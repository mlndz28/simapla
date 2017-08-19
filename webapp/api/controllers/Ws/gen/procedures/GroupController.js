let connection = DbConnectionService;

sails.config.routes['POST /ws/group'] = 'Ws/gen/procedures/Group.insert';
module.exports = {
	
	/**
	 * @function Insert
	 * @memberOf group
	 * @param {varchar} pName
	 * @param {varchar} description
	 * @param {int} pGroupType
	 * @param {int} pIdEncargado
	 */

	insert: (req, res) => {
		connection.query("CALL groupInsert( :V_pName, :V_description, :V_pGroupType, :V_pIdEncargado );", req.body, res);
		}

}
