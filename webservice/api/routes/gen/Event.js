var express = require("express");


/**
 * @function Event
 *@param {int(11)} idEvent - Key: PRI
 *@param {varchar(99)} name
 *@param {datetime} date
 *@param {varchar(255)} location
 *@param {decimal(11,7)} CoordX
 *@param {decimal(11,7)} CoordY
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Event (idEvent, name, date, location, CoordX, CoordY) VALUES( :V_idEvent, :V_name, :V_date, :V_location, :V_CoordX, :V_CoordY )", req.body, res);
	});
 	router.use("/Event", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Event WHERE :OU", req.body, res);
	});
 	router.use("/Event", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Event SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Event", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Event WHERE :OR", req.body, res);
	});
 	router.use("/Event", deletePath);

	return router;
}
