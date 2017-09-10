const debug = require('debug')("simapla:StudentController");

let connection = DbConnectionService;

sails.config.routes['POST /ws/student'] = 'Ws/gen/procedures/Student.insert';
module.exports = {
	
	/**
	 * @function Insert
	 * @memberOf student
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

	insert: (req, res) => {
		debug(req.body);
		connection.query("CALL studentInsert( :V_pcarnet, :V_pcedula, :V_pname, :V_plastname, :V_pbirthdate, :V_ppassword, :V_pdateJoinedProgram, :V_pSpecificAddress, :V_pEmail, :V_pPhone, :V_pIdDistrict, :V_pIsLefty, :V_pHasAdequacy, :V_pSpecialCondition, :V_pMedication );", req.body, res);
		}

}
