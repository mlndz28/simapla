var express = require("express");


/**
 * @function Instrument
 *@param {int(11)} idInstrument - Key: PRI
 *@param {varchar(20)} serialNumber
 *@param {int(7)} price
 *@param {varchar(10)} color
 *@param {varchar(10)} model
 *@param {int(11)} InstrumentName_idInstrumentName - Key: PRI
 *@param {int(11)} Patrimony_idPatrimony - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Instrument (idInstrument, serialNumber, price, color, model, InstrumentName_idInstrumentName, Patrimony_idPatrimony) VALUES( :V_idInstrument, :V_serialNumber, :V_price, :V_color, :V_model, :V_InstrumentName_idInstrumentName, :V_Patrimony_idPatrimony )", req.body, res);
	});
 	router.use("/Instrument", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Instrument WHERE :OU", req.body, res);
	});
 	router.use("/Instrument", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Instrument SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Instrument", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Instrument WHERE :OR", req.body, res);
	});
 	router.use("/Instrument", deletePath);

	return router;
}
