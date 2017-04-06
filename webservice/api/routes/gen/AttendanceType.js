var express = require("express");


/**
 * @function AttendanceType
 *@param {int(11)} idAttendanceType - Key: PRI
 *@param {varchar(15)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO AttendanceType (idAttendanceType, name) VALUES( :V_idAttendanceType, :V_name )", req.body, res);
	});
 	router.use("/AttendanceType", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM AttendanceType WHERE :OU", req.body, res);
	});
 	router.use("/AttendanceType", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE AttendanceType SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/AttendanceType", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM AttendanceType WHERE :OR", req.body, res);
	});
 	router.use("/AttendanceType", deletePath);

	return router;
}
