/**
 * SignupController
 *
 * @description :: Server-side logic for managing signups
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 let connection = DbConnectionService;
module.exports = {
	show: (req, res) => {
		res.view('signup');
	},

  signupStudent: (req, res) => {
    let values = [
      req.param('pcarnet'),
      req.param('pcedula'),
      req.param('pname'),
      req.param('plastname'),
      req.param('pbirthdate'),
      req.param('ppassword'),
      req.param('pdateJoinedProgram'),
      req.param('pSpecificAddress'),
      req.param('pEmail'),
      req.param('pPhone'),
      req.param('pIdDistrict'),
      req.param('pIsLefty'),
      req.param('pHasAdequacy'),
      req.param('pSpecialCondition'),
      req.param('pMedication')
    ].join(', ');
    let query = `call SimaplaDb.registerStudent(${values})`;
    connection.query(query, {}, res);
  },

  signupAdministrator: (req, res) => {
    let values = [
      req.param('pcarnet'),
      req.param('pcedula'),
      req.param('pname'),
      req.param('plastname'),
      req.param('pbirthdate'),
      req.param('ppassword'),
      req.param('pdateJoinedProgram'),
      req.param('pSpecificAddress'),
      req.param('pEmail'),
      req.param('pPhone'),
      req.param('pIdDistrict'),
      req.param('pIdManagementPosition')
    ].join(', ');
    let query = `call SimaplaDb.registerAdministrator(${values})`;
    connection.query(query, {}, res);
  }
};
