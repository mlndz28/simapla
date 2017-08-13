let connection = DbConnectionService;

sails.config.routes['POST /ws/registerResponsible'] = 'Ws/gen/procedures/RegisterResponsible.post';

/**
 * @function registerResponsible
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
 */

module.exports = {
	post: (req, res) => {
		connection.query("CALL registerResponsible( :V_pcarnet, :V_pcedula, :V_pname, :V_plastname, :V_pbirthdate, :V_ppassword, :V_pdateJoinedProgram, :V_pSpecificAddress, :V_pEmail, :V_pPhone, :V_pIdDistrict );", req.body, res);
	}
}
