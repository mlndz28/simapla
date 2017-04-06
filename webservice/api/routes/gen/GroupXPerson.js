var express = require("express");


/**
 * @function GroupXPerson
 *@param {int(11)} Group_idGroup - Key: PRI
 *@param {int(11)} Person_idPerson - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO GroupXPerson (Group_idGroup, Person_idPerson) VALUES( :V_Group_idGroup, :V_Person_idPerson )", req.body, res);
	});
 	router.use("/GroupXPerson", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM GroupXPerson WHERE :OU", req.body, res);
	});
 	router.use("/GroupXPerson", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE GroupXPerson SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/GroupXPerson", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM GroupXPerson WHERE :OR", req.body, res);
	});
 	router.use("/GroupXPerson", deletePath);

	return router;
}
