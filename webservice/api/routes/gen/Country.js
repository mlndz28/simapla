var express = require("express");


/**
 * @function Country
 *@param {int(11)} idCountry - Key: PRI
 *@param {varchar(20)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Country (idCountry, name) VALUES( :V_idCountry, :V_name )", req.body, res);
	});
 	router.use("/Country", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Country WHERE :OU", req.body, res);
	});
 	router.use("/Country", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Country SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Country", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Country WHERE :OR", req.body, res);
	});
 	router.use("/Country", deletePath);

	return router;
}
