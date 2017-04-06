var express = require("express");


/**
 * @function Attendance
 *@param {int(11)} idAttendance - Key: PRI
 *@param {int(11)} idPerson - Key: MUL
 *@param {int(11)} Session_idSession - Key: PRI
 *@param {int(11)} AttendanceType_idAttendanceType - Key: PRI
 *@param {int(11)} numSession
 *@param {date} dateSession
 *@param {int(11)} ScheduleXGroup_idScheduleXGroup - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Attendance (idAttendance, idPerson, Session_idSession, AttendanceType_idAttendanceType, numSession, dateSession, ScheduleXGroup_idScheduleXGroup) VALUES( :V_idAttendance, :V_idPerson, :V_Session_idSession, :V_AttendanceType_idAttendanceType, :V_numSession, :V_dateSession, :V_ScheduleXGroup_idScheduleXGroup )", req.body, res);
	});
 	router.use("/Attendance", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Attendance WHERE :OU", req.body, res);
	});
 	router.use("/Attendance", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Attendance SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Attendance", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Attendance WHERE :OR", req.body, res);
	});
 	router.use("/Attendance", deletePath);

	return router;
}
