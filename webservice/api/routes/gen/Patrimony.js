var express = require("express");


/**
 * @function Patrimony
 *@param {int(11)} idPatrimony - Key: PRI
 *@param {varchar(35)} name
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Patrimony (idPatrimony, name) VALUES( :V_idPatrimony, :V_name )", req.body, res);
	});
 	router.use("/Patrimony", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Patrimony WHERE :OU", req.body, res);
	});
 	router.use("/Patrimony", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Patrimony SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Patrimony", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Patrimony WHERE :OR", req.body, res);
	});
 	router.use("/Patrimony", deletePath);

	return router;
}
