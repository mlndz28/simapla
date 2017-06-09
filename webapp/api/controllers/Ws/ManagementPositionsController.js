let connection = DbConnectionService;
module.exports = {
  getPositions: (req, res) => {
    let query = `SELECT * FROM ManagementPosition`;
    connection.query(query, {}, res);
  }
}
