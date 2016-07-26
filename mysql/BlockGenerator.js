const fs = require('fs');
const jsonfile = require('jsonfile');
jsonfile.spaces = 2;

/**
 * This script will take a workbench generated sql script and make a single
 * file for each 'block' in the script. The output files will be created in
 * dist/ folders so that the generated files won't overwrite the existing
 * ones at src/ folders.
 *
 * A block is the way workbench boundles a serie of commands. i.e.

-- -----------------------------------------------------
-- Table `SimaplaDb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;

 * a new file ./dist/Table/Country.sql will be created. Note that the words
 * Table and Country are scraped from the workbench file.
 */
const filePath = './workbench.sql';
var gen = new BlockGenerator();
gen.generate(filePath);

function BlockGenerator() {
  const outputPath = './dist/';
  if (!fs.existsSync(outputPath)) fs.mkdirSync(dir); // initialize path

  this.generate = function(filePath) {
    createTableFiles(filePath);
  }

  function loadBlocks(data) {
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
      let blocks = loadBlocks(data);
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
