let connection = DbConnectionService;
module.exports = {
  getInstruments: (req, res) => {
    let query = `SELECT * FROM InstrumentName`;
    connection.query(query, {}, res);
  }
}
