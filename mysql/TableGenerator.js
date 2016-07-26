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
const filePath = './workbench.sql';
var gen = new TableGenerator();
gen.generate(filePath);

function TableGenerator() {
  const outputPath = './dist/';
  if (!fs.existsSync(outputPath)) fs.mkdirSync(dir); // initialize path

  this.generate = function(filePath) {
    createTableFiles(filePath);
  }

  function loadTables(data) {
    data = data.replace(/\r/gm, '');
    let restr = "(?:" +
                "-- -+\\s+" +
                "-- ([a-z]+) [a-z`]+\\.\\`([a-z]+)\\`\\s+" +
                "-- -+\\s+" +
                "(([ \\ta-z0-9\\(\\)\\._,;='`@*-]+\\s)+)" +
                ")";
    // /(?:-- -+\s+-- ([a-z]+) [a-z`]+\.\`([a-z]+)\`\s+-- -+\s+(([ \ta-z0-9\(\)\._,;='`@*-]+\s)+))/gim
    let re = new RegExp(restr, "gmi");
    let block, blocks = [];
    while((block = re.exec(data)) !== null) blocks.push(block);
    return blocks;
  }

  function createTableFiles(filePath) {
    fs.readFile(filePath, (err, data) => {
      // exit on error.
      if (err) return console.log(err);
      data = data.toString();
      let blocks = loadTables(data);
      for (let i = 0; i < blocks.length; i++) {
        writeBlock(blocks[i]);
      }
    });
  }

  function writeBlock(block) {
    let destinationPath = `${outputPath}${block[1]}`;
    if (!fs.existsSync(destinationPath)) fs.mkdirSync(destinationPath);
    let destinationFile = `${destinationPath}/${block[2]}.sql`;
    let body = `SELECT '${block[1]} ${block[2]}';\n${block[3]}`;
    fs.writeFile(destinationFile, body, (err) => {
      if (err) {
        console.log('ERROR: File ' + destinationFile + ' not created.');
        console.log(err);
      } else {
        console.log('File ' + destinationFile + ' created.')
      }
    });
  }
}
