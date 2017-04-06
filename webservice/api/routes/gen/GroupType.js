var express = require("express");


/**
 * @function GroupType
 *@param {int(11)} idGroupType - Key: PRI
 *@param {varchar(45)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO GroupType (idGroupType, name) VALUES( :V_idGroupType, :V_name )", req.body, res);
	});
 	router.use("/GroupType", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM GroupType WHERE :OU", req.body, res);
	});
 	router.use("/GroupType", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE GroupType SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/GroupType", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM GroupType WHERE :OR", req.body, res);
	});
 	router.use("/GroupType", deletePath);

	return router;
}
