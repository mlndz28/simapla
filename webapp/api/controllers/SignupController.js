/**
 * SignupController
 *
 * @description :: Server-side logic for managing signups
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 let connection = DbConnectionService;
 let mailSrv = EmailService;

module.exports = {
	show: (req, res) => {
        if(req.session.logged && req.session.me.role == 1){
            res.view('registroAdministrador');
        }else{
            res.view('registro');
        }
	},

    signupStudent: (req, res) => {
        var carnet = generateCarnet();
      let values = [
        `'`+carnet+`'`,//generateCarnet(), // req.param('pcarnet'),
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
              if (typeof resObject.data[4] != 'undefined'){
                  req.session.logged = true;
                  req.session.me = {};
                  req.session.me.role = 0;
                  console.log("resObject.data: " + JSON.stringify(resObject.data))
                  console.log("LOG SignupController resObject: " + JSON.stringify(resObject.data[4][0].cedula));
                  req.session.me.cedula = resObject.data[4][0].cedula;
                  mailSrv.simpleMail(
                      "Simapla Digital <info@simapladigital.org>",
                      [req.param('pEmail')],
                      "Registro de cuenta",
                      '<h1>Simapla Digital</h1><p>Hola ' + req.param('pname') + " " + req.param('plastname')
                        + ',<br><br>Se ha registrado satisfactoriamente su cuenta.<br><br>Su carnet es: ' + carnet
                        + '<br><br>El equipo del SINEM de Mata de Plátano.</p>',
                      console.log("Email enviado"));
                  res.redirect('/perfil');
              } else {
                  res.redirect('/registro');
              }
          }
      });
    },

    signupMultiple: (req, res) => {
        role = req.param('role');
        console.log("LOG SignupController role: " + role);
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
        req.param('pIdDistrict')
    ];
    if (role == 0) {
        roleName = "Student";
        values[values.length] = req.param('pIsLefty'),
        values[values.length] = req.param('pHasAdequacy'),
        values[values.length] = `'${req.param('pSpecialCondition')}'`,
        values[values.length] = `'${req.param('pMedication')}'`;
    } else if (role == 1) {
        roleName = "Administrator";
        values[values.length] = req.param('pposition');
    } else if (role == 2) {
        roleName = "Teacher";
        values[values.length] = req.param('pinstrument');
    } else if (role == 3) {
        roleName = "Responsible";
    } else {
        console.log("LOG SignupController ERROR: Invalid role received: " + role);
        res.redirect('/registro');
    }
      values = values.join(',');
      let query = `call SimaplaDb.register${roleName}(${values})`;
      console.log(query);
      connection.query(query, {}, res, (resObject, res) => {
          if (resObject.error == 'none') {
              if (typeof resObject.data != 'undefined' && typeof resObject.data[4] != 'undefined'){
                  req.session.logged = true;
                  req.session.me = {};
                  req.session.me.role = role;
                  console.log("LOG SignupController resObject: "+JSON.stringify(resObject.data[4][0].cedula));
                  req.session.me.cedula = resObject.data[4][0].cedula;
                  mailSrv.simpleMail(
                      "Simapla Digital <info@simapladigital.org>",
                      [req.param('pEmail')],
                      "Registro de cuenta",
                      '<h1>Simapla Digital</h1><p>Hola ' + req.param('pname') + " " + req.param('plastname')
                        + ',<br><br>Se ha registrado satisfactoriamente su cuenta.<br><br>Su carnet es: ' + carnet
                        + '<br><br>El equipo del SINEM de Mata de Plátano.</p>',
                      console.log("Email enviado"));
                  res.redirect('/perfil');
              } else {
                  console.log("LOG SignupController Error: undefined resObject.data (Unexpected DB return) ");
                  res.redirect('/registro');
              }
          }
      });
    }
};


function generateCarnet(){
let abc = 'abcdefghijklmnopqrstuv'.split('');
let str = '';
for (var i = 0; i < 3; i++)
  str += abc[Math.floor(Math.random()*abc.length)];
return "mdp" + str;
}
