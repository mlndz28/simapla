var express = require("express");


/**
 * @function ManagementPosition
 *@param {int(11)} idManagementPosition - Key: PRI
 *@param {varchar(45)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO ManagementPosition (idManagementPosition, name) VALUES( :V_idManagementPosition, :V_name )", req.body, res);
	});
 	router.use("/ManagementPosition", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM ManagementPosition WHERE :OU", req.body, res);
	});
 	router.use("/ManagementPosition", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE ManagementPosition SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/ManagementPosition", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM ManagementPosition WHERE :OR", req.body, res);
	});
 	router.use("/ManagementPosition", deletePath);

	return router;
}
