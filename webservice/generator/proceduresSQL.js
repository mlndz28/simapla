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

// Main function
function generate(tables) {



	for (i1 = 0; i1 < tables.length; i1++) {
		it: {
			var table = tables[i1];
			if(!table.fields) break it;
			var name = table.name;

			saveToFile(routeCode(table), "generated", i1>0);
		}
	}
}

var sql = "";

function add(line) {
	sql += line + '\n';
}

/* Create statements */

// Return the select statement
function select(name) {
}

// Return the insert statement
function insert(name, fields) {
	sql = "";

	let paramsDeclaration = "";
	let columns = "";
	let values = "";
	let verifications = "";
	let selects = "";
	for( i = 0; i < fields.length; i++ ){
		if(fields[i].Extra != "auto_increment"){
			if(fields[i].ForeignKey){
				verifications += "\tIF NOT EXISTS(select "+ fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " from " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " where <<name in table>> = " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME.replace("id","") + "\n";
				verifications += "\t\tTHEN\n";
				verifications += "\t\t\tSIGNAL SQLSTATE '45000'\n";
				verifications += "\t\t\t\tSET MESSAGE_TEXT = '" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME.replace("id","") + " does not exist';\n";
				verifications += "\tEND IF;\n";
				selects += "\tselect @" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " := " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " from " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME + " where <<name in table>> = " + fields[i].ForeignKey.REFERENCED_COLUMN_NAME.replace("id","") + ";\n";
				paramsDeclaration += "\tin `" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME.replace("id","") + "` "  +  "<<type>>" + (i == fields.length - 1 ? "" : ",\n");
				values += "\t\t@" + fields[i].ForeignKey.REFERENCED_COLUMN_NAME  + (i == fields.length - 1 ? "" : ",\n");
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
	if(selects) add(selects);
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

// Return the delete statement
function deleteSt(name) {
}

// Return the update statement
function update(name, fields) {
}

// Generate javascript code for routes
function routeCode(table) {
	console.log("Generating description for ", table.name);
	let fields = table.fields;


	let sql = "DELIMITER //\n";

	sql += "-- " + table.name + "Insert\n";
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
