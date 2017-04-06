var express = require("express");


/**
 * @function EventType
 *@param {int(11)} idEventType - Key: PRI
 *@param {varchar(45)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO EventType (idEventType, name) VALUES( :V_idEventType, :V_name )", req.body, res);
	});
 	router.use("/EventType", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM EventType WHERE :OU", req.body, res);
	});
 	router.use("/EventType", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE EventType SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/EventType", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM EventType WHERE :OR", req.body, res);
	});
 	router.use("/EventType", deletePath);

	return router;
}
