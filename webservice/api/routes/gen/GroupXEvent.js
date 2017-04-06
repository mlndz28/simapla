var express = require("express");


/**
 * @function GroupXEvent
 *@param {int(11)} Group_idGroup - Key: PRI
 *@param {int(11)} Event_idEvent - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO GroupXEvent (Group_idGroup, Event_idEvent) VALUES( :V_Group_idGroup, :V_Event_idEvent )", req.body, res);
	});
 	router.use("/GroupXEvent", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM GroupXEvent WHERE :OU", req.body, res);
	});
 	router.use("/GroupXEvent", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE GroupXEvent SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/GroupXEvent", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM GroupXEvent WHERE :OR", req.body, res);
	});
 	router.use("/GroupXEvent", deletePath);

	return router;
}
