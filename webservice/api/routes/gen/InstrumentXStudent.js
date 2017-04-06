var express = require("express");


/**
 * @function InstrumentXStudent
 *@param {int(11)} Instrument_idInstrument - Key: PRI
 *@param {int(11)} Student_Person_idPerson - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO InstrumentXStudent (Instrument_idInstrument, Student_Person_idPerson) VALUES( :V_Instrument_idInstrument, :V_Student_Person_idPerson )", req.body, res);
	});
 	router.use("/InstrumentXStudent", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM InstrumentXStudent WHERE :OU", req.body, res);
	});
 	router.use("/InstrumentXStudent", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE InstrumentXStudent SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/InstrumentXStudent", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM InstrumentXStudent WHERE :OR", req.body, res);
	});
 	router.use("/InstrumentXStudent", deletePath);

	return router;
}
