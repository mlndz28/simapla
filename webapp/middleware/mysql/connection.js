var mysql = require('mysql');

// @TODO this loads the file, but only once and caches it, so no on-the-go
// changes to file to see a live change. Use something like fs.watch() and
//  require('jsonfile') to reload it every time it changes.
var credentials = require('./credentials.json');

var connection = function(connect = true) {
  var connection = mysql.createConnection(credentials);
  if(connect) {
    try {
      connection.connect();
    } catch (exception) {
      console.log('ERROR: ');
      console.log(exception);
    }
    connection.end();
  }
  return connection;
  // remember to connection.end();
};

exports.getConnection = connection;
