let connection = DbConnectionService;

sails.config.routes['POST /ws/createGroup'] = 'Ws/gen/procedures/CreateGroup.post';

/**
 * @function createGroup
 * @param {varchar} pName
 * @param {varchar} description
 * @param {int} pGroupType
 * @param {int} pIdEncargado
 */

module.exports = {
	post: (req, res) => {
		connection.query("CALL createGroup( :V_pName, :V_description, :V_pGroupType, :V_pIdEncargado );", req.body, res);
	}
}
