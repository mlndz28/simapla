var express = require("express");


/**
 * @function Schedule
 *@param {int(11)} idSchedule - Key: PRI
 *@param {varchar(10)} day
 *@param {date} hourStart
 *@param {date} hourEnd
 *@param {date} expireDate
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Schedule (idSchedule, day, hourStart, hourEnd, expireDate) VALUES( :V_idSchedule, :V_day, :V_hourStart, :V_hourEnd, :V_expireDate )", req.body, res);
	});
 	router.use("/Schedule", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Schedule WHERE :OU", req.body, res);
	});
 	router.use("/Schedule", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Schedule SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Schedule", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Schedule WHERE :OR", req.body, res);
	});
 	router.use("/Schedule", deletePath);

	return router;
}
