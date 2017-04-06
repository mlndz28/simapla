var express = require("express");


/**
 * @function Administrator
 *@param {int(11)} Person_idPerson - Key: PRI
 *@param {int(11)} ManagementPosition_idManagementPosition - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Administrator (Person_idPerson, ManagementPosition_idManagementPosition) VALUES( :V_Person_idPerson, :V_ManagementPosition_idManagementPosition )", req.body, res);
	});
 	router.use("/Administrator", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Administrator WHERE :OU", req.body, res);
	});
 	router.use("/Administrator", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Administrator SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Administrator", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Administrator WHERE :OR", req.body, res);
	});
 	router.use("/Administrator", deletePath);

	return router;
}
