var http = require('http');
var fs = require('fs');
var config = require('../../webapp/config/db.json').generator.procedures;

var requestStatus;
var options = config.request;
var exceptions = config.exceptions;
var dir = config.routesDir;



// Request to api/routes/tables (service must be up)
http.request(options, function(res) {
	console.log("Here");
    if (res.statusCode != 200) {
        console.log("Error retrieving data. Response status: " + res.statusCode);
    }
    var whole = "";
    res.on('data', function(chunk) {
        whole += chunk;

    });
    res.on('end', function() {
		let response = JSON.parse(whole);
		if(response.data.length == 0){
			console.log("ERROR " + response.error.errno + " (" +  response.error.code + "): " + response.error.sqlMessage);
		}
        generate(response.data);
    });
}).end();

// Main function
function generate(procedures) {
	mkdirp(dir);
    // rearrange accordying procedures so several methods can be written in the same controller
    let tempProcedures = [];
    for (i1 = 0; i1 < procedures.length; i1++) {
        let wholeName = procedures[i1].name.split(/(?=[A-Z])/); // split by caps
        let method = wholeName[wholeName.length - 1];
        wholeName.pop();
        let name = wholeName.join('');
        let temp = {
            name: method,
            parameters: procedures[i1].parameters
        }
        let alreadyAdded = false;
        for (i2 = 0; i2 < tempProcedures.length; i2++) { //if the procedure already exists adds method to the procedure
			if (name == tempProcedures[i2].name) {
                alreadyAdded = true;
                tempProcedures[i2].methods.push(temp);
            }
        }

        if (!alreadyAdded) {
            tempProcedures.push({
                name: name,
                methods: [temp]
            });
        }
    }

    procedures = tempProcedures;

    for (let i1 = 0; i1 < procedures.length; i1++) {
        it: {
        	for (i2 = 0; i2 < exceptions.length; i2++) {
                if (procedures[i1].name == exceptions[i2]) {
                    //break it;
                }
            }
            saveToFile(routeCode(procedures[i1]), procedures[i1].name);
        }
    }
}

// Create query
function query(name, fields) {
    var statement = "CALL " + name + "( ";
    for (i = 0; i < fields.length; i++) {

        statement += ":V_" + fields[i].name;
        if (i != fields.length - 1) {
            statement += ", ";
        }
    }
    statement += " );";

    return statement;
}

// Generate javascript code for routes
function routeCode(procedure) {
    let controllerName = procedure.name.charAt(0).toUpperCase() + procedure.name.slice(1);

    var js = "";

    function add(line) {
        js += line + '\n';
    }
    add("let connection = DbConnectionService;\n");

    var functionBuild = "";
    function addFunction(line) {
        functionBuild +=  "\t" + line + "\n";
	}


    for (i1 = 0; i1 < procedure.methods.length; i1++) {
		let method = procedure.methods[i1];
        addFunction("\n\t/**");
        addFunction(" * @function " +  method.name);
		addFunction(" * @memberOf " + procedure.name );
        for (i = 0; i < method.parameters.length; i++) {
            var temp = " * @param {" + method.parameters[i].type + "} " + method.parameters[i].name;
            addFunction(temp);
        }
		addFunction(" */\n");

		let url = procedure.name.split(/(?=[A-Z])/).join("/").toLowerCase();

        switch (method.name) {
            case "Get":
			add("sails.config.routes['GET /ws/" + url + "'] = 'Ws/gen/procedures/" + controllerName + ".get';");
				addFunction("get: (req, res) => {");
				addFunction("\tconnection.query(\"" + query(procedure.name + method.name , method.parameters) + "\", req.query, res);");
				break;
            case "Insert":
                add("sails.config.routes['POST /ws/" + url + "'] = 'Ws/gen/procedures/" + controllerName + ".insert';");
				addFunction("insert: (req, res) => {");
				addFunction("\tconnection.query(\"" + query(procedure.name + method.name, method.parameters) + "\", req.body, res);");
				break;
            case "Update":
                add("sails.config.routes['PUT /ws/" + url + "'] = 'Ws/gen/procedures/" + controllerName + ".update';");
				addFunction("update: (req, res) => {");
				addFunction("\tconnection.query(\"" + query(procedure.name + method.name, method.parameters) + "\", req.body, res);");
            case "Delete":
                add("sails.config.routes['DELETE /ws/" + url + "'] = 'Ws/gen/procedures/" + controllerName + ".delete';");
				addFunction("delete: (req, res) => {");
				addFunction("\tconnection.query(\"" + query(procedure.name + method.name, method.parameters) + "\", req.body, res);");
				break;
			default:
				add("sails.config.routes['POST /ws/" + url + "/" + method + "'] = 'Ws/gen/procedures/" + controllerName + "." + method + "';");
				addFunction( method.name + ": (req, res) => {");
				addFunction("\tconnection.query(\"" + query(procedure.name + method.name, method.parameters) + "\", req.body, res);");
        }
		if (i1 != procedure.methods.length - 1){
			addFunction("\t},");
		}else{
			addFunction("\t}");
		}
    }

	add("module.exports = {");
	add(functionBuild);
	add("}");

    return js;
}

// Write code into a file
function saveToFile(code, procedure) {
    console.log("Saving " + procedure + "Controller.js");
    fs.createWriteStream(dir + "/" + procedure.charAt(0).toUpperCase() + procedure.slice(1) + "Controller.js", { //write into file
        flags: 'w',
        autoClose: true,
        fd: null,
    }).write(code);
}

// Create a directory along with its parents (in case they don't exist)
function mkdirp(path) {
    var folders = path.split("/");
    var parentBuild = "";

    console.log("Creating gen directory");
    for (i = 0; i < folders.length; i++) {
        parentBuild += folders[i] + "/";
        try {
            //create folder if it doesn't exist
            fs.mkdirSync(parentBuild);
        } catch (e) {
            //expected exception in case it exists
            if (e.code != "EEXIST") {
                data = e.toString();
            }
        }
    }
}
