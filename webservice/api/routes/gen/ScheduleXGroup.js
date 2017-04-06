var express = require("express");


/**
 * @function ScheduleXGroup
 *@param {int(11)} idScheduleXGroup - Key: PRI
 *@param {int(11)} Schedule_idSchedule - Key: PRI
 *@param {int(11)} Group_idGroup - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO ScheduleXGroup (idScheduleXGroup, Schedule_idSchedule, Group_idGroup) VALUES( :V_idScheduleXGroup, :V_Schedule_idSchedule, :V_Group_idGroup )", req.body, res);
	});
 	router.use("/ScheduleXGroup", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM ScheduleXGroup WHERE :OU", req.body, res);
	});
 	router.use("/ScheduleXGroup", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE ScheduleXGroup SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/ScheduleXGroup", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM ScheduleXGroup WHERE :OR", req.body, res);
	});
 	router.use("/ScheduleXGroup", deletePath);

	return router;
}
