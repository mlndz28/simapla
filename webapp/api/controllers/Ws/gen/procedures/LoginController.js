let connection = DbConnectionService;

sails.config.routes['POST /ws/login'] = 'Ws/gen/procedures/Login.post';

/**
 * @function login
 * @param {varchar} pCedula
 */

module.exports = {
	post: (req, res) => {
		connection.query("CALL login( :V_pCedula );", req.body, res);
	}
}
