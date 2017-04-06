var express = require("express");


/**
 * @function Email
 *@param {int(11)} idEmail - Key: PRI
 *@param {varchar(255)} mail
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Email (idEmail, mail) VALUES( :V_idEmail, :V_mail )", req.body, res);
	});
 	router.use("/Email", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Email WHERE :OU", req.body, res);
	});
 	router.use("/Email", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Email SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Email", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Email WHERE :OR", req.body, res);
	});
 	router.use("/Email", deletePath);

	return router;
}
