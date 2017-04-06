var express = require("express");


/**
 * @function Instruments
 *@param {int(11)} idInstrument
 *@param {varchar(45)} name
 *@param {varchar(20)} serialNumber
 *@param {int(7)} price
 *@param {varchar(10)} color
 *@param {varchar(10)} model
 *@param {varchar(35)} patrimony
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Instruments (idInstrument, name, serialNumber, price, color, model, patrimony) VALUES( :V_idInstrument, :V_name, :V_serialNumber, :V_price, :V_color, :V_model, :V_patrimony )", req.body, res);
	});
 	router.use("/Instruments", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Instruments WHERE :OU", req.body, res);
	});
 	router.use("/Instruments", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Instruments SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Instruments", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Instruments WHERE :OR", req.body, res);
	});
 	router.use("/Instruments", deletePath);

	return router;
}
