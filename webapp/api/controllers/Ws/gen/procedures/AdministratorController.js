let connection = DbConnectionService;

sails.config.routes['POST /ws/administrator'] = 'Ws/gen/procedures/Administrator.insert';
module.exports = {
	
	/**
	 * @function Insert
	 * @memberOf administrator
	 * @param {varchar} pcarnet
	 * @param {varchar} pcedula
	 * @param {varchar} pname
	 * @param {varchar} plastname
	 * @param {date} pbirthdate
	 * @param {varchar} ppassword
	 * @param {date} pdateJoinedProgram
	 * @param {varchar} pSpecificAddress
	 * @param {varchar} pEmail
	 * @param {varchar} pPhone
	 * @param {int} pIdDistrict
	 * @param {int} pIdManagementPosition
	 */

	insert: (req, res) => {
		connection.query("CALL administratorInsert( :V_pcarnet, :V_pcedula, :V_pname, :V_plastname, :V_pbirthdate, :V_ppassword, :V_pdateJoinedProgram, :V_pSpecificAddress, :V_pEmail, :V_pPhone, :V_pIdDistrict, :V_pIdManagementPosition );", req.body, res);
		}

}
