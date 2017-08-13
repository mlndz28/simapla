let connection = DbConnectionService;

sails.config.routes['POST /ws/registerStudent'] = 'Ws/gen/procedures/RegisterStudent.post';

/**
 * @function registerStudent
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
 * @param {bit} pIsLefty
 * @param {bit} pHasAdequacy
 * @param {varchar} pSpecialCondition
 * @param {varchar} pMedication
 */

module.exports = {
	post: (req, res) => {
		connection.query("CALL registerStudent( :V_pcarnet, :V_pcedula, :V_pname, :V_plastname, :V_pbirthdate, :V_ppassword, :V_pdateJoinedProgram, :V_pSpecificAddress, :V_pEmail, :V_pPhone, :V_pIdDistrict, :V_pIsLefty, :V_pHasAdequacy, :V_pSpecialCondition, :V_pMedication );", req.body, res);
	}
}
