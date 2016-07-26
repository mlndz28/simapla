const _ = require('lodash');
const fs = require('fs');
const mysql = require('mysql');
const jsonfile = require('jsonfile');

/**
 * Handles a database connection.
 * @param {Boolean} connect Indicates if connection should connect on object
 *                          initialization.
 */
function DatabaseConnection(connect = true) {

      /**
       * The path to the credentials file.
       * @type {String}
       */
  var credentialsPath = './credentials.json'

      /**
       * The credentials object.
       * @type {Object}
       */
      , credentials = {}

      /**
       * The mysql connection
       */
      , connection = null
      ;

  /**
   * Constructor method which is called on object initialization.
   * @param {Boolean} connect Indicates if the connection should connect
   *                          right away.
   */
  function constructor(connect = true) {
    loadCredentials(initConnection, connect);
  }
  constructor(connect);

  /**
   * Loads the credentials object with the access info for the database.
   * @param {Function} callback Callback after the credentials have been
   *                            loaded.
   * @param {Array} ...args Arguments to be passed to the callback function.
   */
  function loadCredentials(callback, ...args) {
    jsonfile.readFile(credentialsPath, (err, obj) => {
      if (err) {
        throw {
          err: err,
          message: 'Error while loading credentials for database.'
        };
      }

      if (!(typeof obj === 'object' && obj !== null)) {
        throw {
          obj: obj,
          err: null,
          message: `Can't convert undefined or null to object.`
        };
      }

      credentials = obj;

      if (typeof callback === 'function') {
        callback(...args);
      }
    });
  };

  /**
   * Initializes the connection variable and connects to database if connect
   * argument equals true.
   * @param {Boolean|array} connect If it is Boolean, indicates if connection
   *                                should connect right away. If it is array,
   *                                and has at least one element, the first
   *                                element's boolean value will be the used
   *                                value.
   */
  function initConnection(connect = true) {
    // We will take the first element of an array or the value of a boolean.
    connect = _.isArray(connect) && connect.length > 0? !!connect[0]: connect;
    connect = _.isBoolean(connect)? connect: true;

    connection = mysql.createConnection(credentials);
    if(connect) {
      connect();
    }
  };

  /**
   * Connects the connection to the database.
   */
  function connect() {
    connection.connect((err) => {
      if (err) {
        throw {
          error: exception,
          message: `Can't connect do database.`
        };
      }
    });
  };

  /**
   * Obtain the connection object.
   * @return {Object} Connection object.
   */
  this.getConnection = function() {
    return connection;
  };

  /**
   * Ends the connection session after all the querys have been completed.
   */
  this.end = function() {
    connection.end((err) => {
      // https://github.com/mysqljs/mysql#terminating-connections
      // Connection is closed now, no worries about err.
    });
  }
}

exports.getConnection = function(connect = true) {
  return new DatabaseConnection(connect);
};
