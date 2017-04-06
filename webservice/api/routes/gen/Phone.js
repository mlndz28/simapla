var express = require("express");


/**
 * @function Phone
 *@param {int(11)} idPhone - Key: PRI
 *@param {varchar(12)} number
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Phone (idPhone, number) VALUES( :V_idPhone, :V_number )", req.body, res);
	});
 	router.use("/Phone", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Phone WHERE :OU", req.body, res);
	});
 	router.use("/Phone", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Phone SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Phone", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Phone WHERE :OR", req.body, res);
	});
 	router.use("/Phone", deletePath);

	return router;
}
