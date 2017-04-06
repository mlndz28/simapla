var express = require("express");


/**
 * @function InstrumentName
 *@param {int(11)} idInstrumentName - Key: PRI
 *@param {varchar(45)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO InstrumentName (idInstrumentName, name) VALUES( :V_idInstrumentName, :V_name )", req.body, res);
	});
 	router.use("/InstrumentName", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM InstrumentName WHERE :OU", req.body, res);
	});
 	router.use("/InstrumentName", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE InstrumentName SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/InstrumentName", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM InstrumentName WHERE :OR", req.body, res);
	});
 	router.use("/InstrumentName", deletePath);

	return router;
}
