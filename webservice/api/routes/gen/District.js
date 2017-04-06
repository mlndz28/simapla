var express = require("express");


/**
 * @function District
 *@param {int(11)} idDistrict - Key: PRI
 *@param {varchar(45)} name
 *@param {int(11)} Canton_idCanton - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO District (idDistrict, name, Canton_idCanton) VALUES( :V_idDistrict, :V_name, :V_Canton_idCanton )", req.body, res);
	});
 	router.use("/District", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM District WHERE :OU", req.body, res);
	});
 	router.use("/District", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE District SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/District", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM District WHERE :OR", req.body, res);
	});
 	router.use("/District", deletePath);

	return router;
}
