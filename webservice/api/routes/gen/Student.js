var express = require("express");


/**
 * @function Student
 *@param {int(11)} Person_idPerson - Key: PRI
 *@param {bit(1)} isLefty
 *@param {bit(1)} hasAdequacy
 *@param {varchar(60)} specialCondition
 *@param {varchar(60)} medication
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Student (Person_idPerson, isLefty, hasAdequacy, specialCondition, medication) VALUES( :V_Person_idPerson, :V_isLefty, :V_hasAdequacy, :V_specialCondition, :V_medication )", req.body, res);
	});
 	router.use("/Student", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Student WHERE :OU", req.body, res);
	});
 	router.use("/Student", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Student SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Student", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Student WHERE :OR", req.body, res);
	});
 	router.use("/Student", deletePath);

	return router;
}
