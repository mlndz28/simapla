const fs = require('fs');
const jsonfile = require('jsonfile');
jsonfile.spaces = 2;

/**
 * This script will take a workbench generated sql script and make a single
 * file for each table in the script. The output files will be created at
 * dist/tables folder so that the generated files won't overwrite the existing
 * ones at src/tables folder.
 *
 * Note that such folder(both dist and dist/tables must exist).
 */
const filePath = './SimaplaDB25jul16-920pm.sql';
var gen = new TableGenerator();
gen.generate(filePath);

function TableGenerator() {
  const outputPath = './dist/';

  this.generate = function(filePath) {
    createTableFiles(filePath);
  }

  function createTableFiles(filePath) {
    fs.readFile(filePath, (err, data) => {
      // exit on error.
      if (err) return console.log(err);

      data = data.toString();

      var re = /-- Table `SimaplaDb`\.`.+`/gm;
      var tables = data.match(re);

      // exit if no match.
      if (tables === null) return console.log("No tables found.");

      // get the table names.
      tables = tables.map(function(element) {
        return element.replace('-- Table `SimaplaDb`.`', '').replace('`', '')
      });

      // Save a list with the order in the script.
      jsonfile.writeFile(outputPath + 'found-tables.json', tables);

      for (let i = 0; i < tables.length; i++) {
        writeDeclaration(tables[i], data);
      }
    });
  };

  function writeDeclaration(table, data) {
    // find from -- Table `SimaplaDb`.`tableName` to next empty line.
    var re = new RegExp(
      "-- Table `SimaplaDb`\.`" + table + "`(.|\r\n)+?^[\r\n|\r|\n]", "gm");

    // find anything that isn't a comment and has content.
    var codeRe = /^(?!--).+/gm;

    var declaration = data.match(re);

    // exit if no match.
    if (declaration === null) return console.log("Declaration not found.");

    // trim down to code of table declaration.
    declaration = "SELECT 'tables/" + table + "';\r\n" + // Print table name.
                  declaration[0].match(codeRe).join("\r\n") + "\r\n";

    // write file and log status.
    var destination = outputPath + `tables/${table}.sql`;
    fs.writeFile(destination, declaration, (err) => {
      if (err) {
        console.log('ERROR: File ' + destination + ' not created.');
        console.log(err);
      } else {
        console.log('File ' + destination + ' created.')
      }
    });
  }
}
