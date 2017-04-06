var express = require("express");


/**
 * @function Province
 *@param {int(11)} idProvince - Key: PRI
 *@param {varchar(45)} name
 *@param {int(11)} Country_idCountry - Key: PRI
 */


exports.router = function (connection) {
	var router = express.Router();

	var create = express.Router();
	create.post("/add", function (req, res) {
		connection.query("INSERT INTO Province (idProvince, name, Country_idCountry) VALUES( :V_idProvince, :V_name, :V_Country_idCountry )", req.body, res);
	});
 	router.use("/Province", create);

	var read = express.Router();
	read.post("/get", function (req, res) {
		connection.query("SELECT :C FROM Province WHERE :OU", req.body, res);
	});
 	router.use("/Province", read);

	var update = express.Router();
	update.post("/update", function (req, res) {
		connection.query("UPDATE Province SET :OC WHERE :OF", req.body, res);
	});
 	router.use("/Province", update);

	var deletePath = express.Router();
	deletePath.post("/delete", function (req, res) {
		connection.query("DELETE FROM Province WHERE :OR", req.body, res);
	});
 	router.use("/Province", deletePath);

	return router;
}
