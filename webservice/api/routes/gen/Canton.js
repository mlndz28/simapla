var express = require("express");


/**
 * @function Canton
 *@param {int(11)} idCanton - Key: PRI
 *@param {varchar(45)} name
 *@param {int(11)} Province_idProvince - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Canton (idCanton, name, Province_idProvince) VALUES( :V_idCanton, :V_name, :V_Province_idProvince )", req.body, res);
	});
 	router.use("/Canton", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Canton WHERE :OU", req.body, res);
	});
 	router.use("/Canton", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Canton SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Canton", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Canton WHERE :OR", req.body, res);
	});
 	router.use("/Canton", deletePath);

	return router;
}
