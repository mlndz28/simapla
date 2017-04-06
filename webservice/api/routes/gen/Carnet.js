var express = require("express");


/**
 * @function Carnet
 *@param {int(11)} idCarnet - Key: PRI
 *@param {tinyint(4)} yearEntrance
 *@param {tinyint(4)} consecutive
 *@param {varchar(6)} locationInitials
 *@param {int(11)} Person_idPerson - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Carnet (idCarnet, yearEntrance, consecutive, locationInitials, Person_idPerson) VALUES( :V_idCarnet, :V_yearEntrance, :V_consecutive, :V_locationInitials, :V_Person_idPerson )", req.body, res);
	});
 	router.use("/Carnet", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Carnet WHERE :OU", req.body, res);
	});
 	router.use("/Carnet", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Carnet SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Carnet", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Carnet WHERE :OR", req.body, res);
	});
 	router.use("/Carnet", deletePath);

	return router;
}
