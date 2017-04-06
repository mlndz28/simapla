var express = require("express");


/**
 * @function Person
 * @param {int(11)} idPerson - Key: PRI
 * @param {varchar(10)} carnet
 * @param {varchar(12)} cedula
 * @param {varchar(20)} name
 * @param {varchar(20)} lastname
 * @param {date} birthdate
 * @param {varchar(45)} password
 * @param {date} dateJoinedProgram
 * @param {tinyint(4)} salt
 * @param {int(11)} SpecificAddress_idSpecificAddress - Key: PRI
 * @param {int(11)} Email_idEmail - Key: PRI
 * @param {int(11)} Phone_idPhone - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Person (idPerson, carnet, cedula, name, lastname, birthdate, password, dateJoinedProgram, salt, SpecificAddress_idSpecificAddress, Email_idEmail, Phone_idPhone) VALUES( :V_idPerson, :V_carnet, :V_cedula, :V_name, :V_lastname, :V_birthdate, :V_password, :V_dateJoinedProgram, :V_salt, :V_SpecificAddress_idSpecificAddress, :V_Email_idEmail, :V_Phone_idPhone )", req.body, res);
	});
 	router.use("/Person", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Person WHERE :OU", req.body, res);
	});
 	router.use("/Person", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Person SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Person", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Person WHERE :OR", req.body, res);
	});
 	router.use("/Person", deletePath);

	return router;
}
