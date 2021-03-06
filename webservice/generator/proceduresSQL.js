var http = require('http');
var fs = require('fs');
var config = require('../conf/default.json');

var readline = require('readline');

var requestStatus;
var options = config.generator.crud.request;

// Request to api/routes/tables (service must be up)
http.request(options, function (res) {
	if (res.statusCode != 200) {
		console.log("Error retrieving data");
	}
	var whole = "";
	res.on('data', function (chunk) {
		whole += chunk;

	});
	res.on('end', function () {
		generate(JSON.parse(whole).tables);
	});
}).end();

// Basic console input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Main function
function generate(tables) {

	let fileName = "generated";
	rl.question('Generated file name: ', (answer) => {	//callback
  		fileName = answer;
		rl.close();

		for (i1 = 0; i1 < tables.length; i1++) {
			it: {
				var table = tables[i1];
				if(!table.fields) break it;
				var name = table.name;

				saveToFile(routeCode(table), fileName, i1>0);
			}
		}
	});


}

var sql = "";

function add(line) {
	sql += line + '\n';
}

/* Create statements */

// Return a 'get' procedure
function select(name) {
}

// Return an 'insert' procedure
function insert(name, fields) {
	sql = "-- " + name + "Insert\n";

	let paramsDeclaration = "";
	let columns = "";
	let values = "";
	let verifications = "";
	for( i = 0; i < fields.length; i++ ){
		if(fields[i].Extra != "auto_increment"){
			if(fields[i].ForeignKey){
				verifications += "\tIF NOT EXISTS (select "+ fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " from " + fields[i].ForeignKey.REFERENCED_TABLE_NAME + " where " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " = " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + ")\n";
				verifications += "\t\tTHEN\n";
				verifications += "\t\t\tSIGNAL SQLSTATE '45000'\n";
				verifications += "\t\t\t\tSET MESSAGE_TEXT = '" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " does not exist on " + fields[i].ForeignKey.REFERENCED_TABLE_NAME + "';\n";
				verifications += "\tEND IF;\n";
				paramsDeclaration += "\tin `" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + "` "  +  fields[i].Type + (i == fields.length - 1 ? "" : ",\n");
				values += "\t\t" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME  + (i == fields.length - 1 ? "" : ",\n");
			}else{
				paramsDeclaration += "\tin " + "`" + fields[i].Field + "` " +  fields[i].Type + (i == fields.length - 1 ? "" : ",\n");
				values += "\t\t" + fields[i].Field  + (i == fields.length - 1 ? "" : ",\n");
			}
			columns += "\t\t`" + fields[i].Field + "`" + (i == fields.length - 1 ? "" : ",\n");
		}
	}

	add("DROP PROCEDURE IF EXISTS " + config.mysql.database + "." + name + "Insert;" );
	add("//");
	add("CREATE DEFINER=`root`@`localhost` PROCEDURE `" + name + "Insert`(");
	add(paramsDeclaration);
	add(")");
	add("BEGIN");
	if(verifications) add(verifications);
	add("\tINSERT INTO " + config.mysql.database + "." + name + "(");
	add(columns)
	add("\t)VALUES(");
	add(values);
	add("\t);");
	add("\tSELECT LAST_INSERT_ID() AS `id`;");
	add("END");
	add("//");
	return sql;

}

// Return a 'delete' procedure
function deletePr(name) {
}

// Return an 'update' procedure
function update(name, fields) {
}

// Generate javascript code for routes
function routeCode(table) {
	console.log("Generating description for ", table.name);
	let fields = table.fields;


	let sql = "DELIMITER //\n";

	sql += insert(table.name, table.fields);

	sql += "DELIMITER ;\n\n";
	return sql;

}


// Write code into a file
function saveToFile(code, fileName, append) {
	fileName = fileName.replace(".sql", "") + ".sql"
	fs.createWriteStream( fileName, { //write into file
		flags: append ? 'a':'w',
		autoClose: true,
		fd: null,
	}).write(code);
}
