/**
 * SignupController
 *
 * @description :: Server-side logic for managing signups
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 let connection = DbConnectionService;
module.exports = {
	show: (req, res) => {
		res.view('registro');
	},

  signupStudent: (req, res) => {
    let values = [
      `'`+generateCarnet()+`'`,//generateCarnet(), // req.param('pcarnet'),
      `'${req.param('pcedula')}'`,
      `'${req.param('pname')}'`,
      `'${req.param('plastname')}'`,
      `'${req.param('pbirthdate')}'`,
      `'${req.param('ppassword')}'`,
      'NOW()',// req.param('pdateJoinedProgram'),
      `'${req.param('pSpecificAddress')}'`,
      `'${req.param('pEmail')}'`,
      `'${req.param('pPhone')}'`,
      req.param('pIdDistrict'),
      req.param('pIsLefty'),
      req.param('pHasAdequacy'),
      `'${req.param('pSpecialCondition')}'`,
      `'${req.param('pMedication')}'`
    ].join(', ');
    let query = `call SimaplaDb.registerStudent(${values})`;
    console.log(query);
    connection.query(query, {}, res, (resObject, res) => {
        if (resObject.error == 'none') {
            let data = resObject.data;
            if (typeof data[4] != 'undefined'){
                req.session.logged = true;
                req.session.me = {};
                console.log("LOG SignupController resObject: "+JSON.stringify(resObject.data[4][0].cedula));
                req.session.me.cedula = resObject.data[4][0].cedula;
                res.redirect('/perfil');
            } else {
                res.redirect('/registro');
            }
        }
    });
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


function generateCarnet(){
let abc = 'abcdefghijklmnopqrstuv'.split('');
let str = '';
for (var i = 0; i < 3; i++)
  str += abc[Math.floor(Math.random()*abc.length)];
return "mdp" + str;
}
