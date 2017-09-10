Generator
============

The generators use either one of the APIs designed for MySQL data retrieval. They can't work by themselves since they don't have connection to MySQL.
Most of the logic consists in getting information from the system tables to procedurally generate code that can be used as a frame for the APIs previously mentioned.

crud.js
-----

Uses the api on /webservice/. As the configuration defaults are written, the api should be working on the port 2828.
Generates code for an Express application (specifically for this one, but can be used by adapting a connection object to make the queries).
The queries are pretty simple, but flexible as well in the matter of using filters.

procedures.js
-----

Makes a file for each of the procedures found on the database, each file have a connection call for the procedure and a path defined on the Express API.

proceduresSails.js
-----

The same as procedures.js but uses the Sails API for MySQL db connection, and generates the procedure calls for this API as well. The procedures are placed into controllers, and several procedures can go into a controller if the naming guidelines in the db are followed.

proceduresSQL
-----

Generates a sql file with procedure definitions templates. Uses information from the tables to get a prototype of a simple operation to be made in a typical procedure. Uses the Express api.
