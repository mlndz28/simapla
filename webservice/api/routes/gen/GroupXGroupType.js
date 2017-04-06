var express = require("express");


/**
 * @function GroupXGroupType
 *@param {int(11)} Group_idGroup - Key: PRI
 *@param {int(11)} GroupType_idGroupType - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO GroupXGroupType (Group_idGroup, GroupType_idGroupType) VALUES( :V_Group_idGroup, :V_GroupType_idGroupType )", req.body, res);
	});
 	router.use("/GroupXGroupType", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM GroupXGroupType WHERE :OU", req.body, res);
	});
 	router.use("/GroupXGroupType", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE GroupXGroupType SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/GroupXGroupType", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM GroupXGroupType WHERE :OR", req.body, res);
	});
 	router.use("/GroupXGroupType", deletePath);

	return router;
}
