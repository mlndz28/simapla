var express = require("express");


/**
 * @function EventTypeXEvent
 *@param {int(11)} EventType_idEventType - Key: PRI
 *@param {int(11)} Event_idEvent - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO EventTypeXEvent (EventType_idEventType, Event_idEvent) VALUES( :V_EventType_idEventType, :V_Event_idEvent )", req.body, res);
	});
 	router.use("/EventTypeXEvent", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM EventTypeXEvent WHERE :OU", req.body, res);
	});
 	router.use("/EventTypeXEvent", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE EventTypeXEvent SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/EventTypeXEvent", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM EventTypeXEvent WHERE :OR", req.body, res);
	});
 	router.use("/EventTypeXEvent", deletePath);

	return router;
}
