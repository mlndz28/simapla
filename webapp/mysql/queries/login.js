const mysql = require('mysql');
const dbcon = require('../DatabaseConnection');

function LoginQuery(user, pass) {
  var query = 'SELECT `id`, `salt`, `pass` FROM `users` WHERE user=? LIMIT 1'
      , options = {}
      ;

  // could be like this, not really sure.
  var results = {id: 0, salt: 'abcdefgh', pass: '14387fag643gab264b1245b234d67e'};

  var person = new Person();
  person.setId(results.id);
  person.setPasswordWithSalt(pass, results.salt);
  return person.getPassword() === results.pass;
}
