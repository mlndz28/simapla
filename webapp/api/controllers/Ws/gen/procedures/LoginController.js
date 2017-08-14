let connection = DbConnectionService;

sails.config.routes['GET /ws/login'] = 'Ws/gen/procedures/Login.get';
module.exports = {
	
	/**
	 * @function Get
	 * @memberOf login
	 * @param {varchar} pCedula
	 */

	get: (req, res) => {
		connection.query("CALL loginGet( :V_pCedula );", req.query, res);
		}

}
