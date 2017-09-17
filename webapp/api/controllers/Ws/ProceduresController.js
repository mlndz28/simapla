var conf = require("../../../config/db.json").mysql;

let connection = DbConnectionService;

sails.config.routes['GET /ws/procedures'] = 'Ws/Procedures.get';

module.exports = {
  get: (req, res) => {
    //let query = `SELECT * FROM ManagementPosition`;
	connection.query("SHOW PROCEDURE STATUS WHERE Db = '" + conf.database + "';", {}, getProcedureNames(connection, res));

  }
}

/**
 * Get each procedure name from the return table on res and calls getProcedureDescriptions for each procedure.
 * @memberOf procedures
 * @param {Object} connection - MySQL connection
 * @param {Object} res - Express response
 * @private
 */

var getProcedureNames = function (connection, res) {

	return {
		json: function (obj) {

			if(obj.error){
				res.json({data: [], error: obj.error});
				return;
			}
			var data = [];

			for (i = 0; i < obj.data.length; i++) {
				var procedure = {};
				procedure.name = obj.data[i].Name;
				connection.query(	"SELECT PARAMETER_NAME, DATA_TYPE, PARAMETER_MODE FROM information_schema.parameters WHERE SPECIFIC_NAME = :V_objName;",
									{objName: procedure.name},
									getProcedureDescriptions(res, data, procedure, obj.data.length));
			}
		}
	}
}

/**
 * @memberOf procedures
 * @param {Object} res - Express response
 * @param {Object} data - Procedures array
 * @param {Object} procedure - Procedure's description
 * @param {Object} returnSize - data's intended length
 * @private
 */
var getProcedureDescriptions = function (res, data, procedure, returnSize) {
	return {
		json: function (obj) {

			procedure.parameters = [];
			for (var i = 0; i < obj.data.length; i++) {
				procedure.parameters.push({"name": obj.data[i].PARAMETER_NAME, "type": obj.data[i].DATA_TYPE, "io": obj.data[i].IPARAMETER_MODE});
			}
			data.push(procedure);

			if (data.length == returnSize) {
				res.json({data: data, error: null});
			}
		}
	}
}
