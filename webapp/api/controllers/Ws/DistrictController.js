let connection = DbConnectionService;
module.exports = {
  getCountries: (req, res) => {
    let query = `SELECT idCountry, name FROM Country`;
    connection.query(query, {}, res);
  },
  getProvinces: (req, res) => {
    let query = `SELECT * FROM Province WHERE Country_idCountry=${req.params.countryId}`;
    connection.query(query, {}, res);
  },
  getCantons: (req, res) => {
    console.log(req.params);
    let query = `SELECT * FROM Canton WHERE Province_idProvince=${req.params.provinceId}`;
    connection.query(query, {}, res);
  },
  getDistricts: (req, res) => {
    console.log(req.params);
    let query = `SELECT * FROM District WHERE canton_idCanton=${req.params.cantonId}`;
    connection.query(query, {}, res);
  }

}
