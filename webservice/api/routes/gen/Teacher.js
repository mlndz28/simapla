var express = require("express");


/**
 * @function Teacher
 *@param {int(11)} Person_idPerson - Key: PRI
 *@param {int(11)} InstrumentName_idInstrumentName - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Teacher (Person_idPerson, InstrumentName_idInstrumentName) VALUES( :V_Person_idPerson, :V_InstrumentName_idInstrumentName )", req.body, res);
	});
 	router.use("/Teacher", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Teacher WHERE :OU", req.body, res);
	});
 	router.use("/Teacher", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Teacher SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Teacher", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Teacher WHERE :OR", req.body, res);
	});
 	router.use("/Teacher", deletePath);

	return router;
}
