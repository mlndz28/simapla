var express = require("express");


/**
 * @function SpecificAddress
 *@param {int(11)} idSpecificAddress - Key: PRI
 *@param {varchar(80)} address
 *@param {int(11)} District_idDistrict - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO SpecificAddress (idSpecificAddress, address, District_idDistrict) VALUES( :V_idSpecificAddress, :V_address, :V_District_idDistrict )", req.body, res);
	});
 	router.use("/SpecificAddress", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM SpecificAddress WHERE :OU", req.body, res);
	});
 	router.use("/SpecificAddress", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE SpecificAddress SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/SpecificAddress", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM SpecificAddress WHERE :OR", req.body, res);
	});
 	router.use("/SpecificAddress", deletePath);

	return router;
}
