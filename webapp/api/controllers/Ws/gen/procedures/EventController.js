let connection = DbConnectionService;

sails.config.routes['POST /ws/event'] = 'Ws/gen/procedures/Event.insert';
sails.config.routes['GET /ws/event'] = 'Ws/gen/procedures/Event.get';
module.exports = {
	
	/**
	 * @function Insert
	 * @memberOf event
	 * @param {varchar} pName
	 * @param {date} pDate
	 * @param {varchar} pLocation
	 * @param {decimal} pCoordX
	 * @param {decimal} pCoordY
	 * @param {int} pEventType_idEventType
	 */

	insert: (req, res) => {
		connection.query("CALL eventInsert( :V_pName, :V_pDate, :V_pLocation, :V_pCoordX, :V_pCoordY, :V_pEventType_idEventType );", req.body, res);
		},
	
	/**
	 * @function Get
	 * @memberOf event
	 * @param {varchar} pName
	 * @param {date} pDate
	 * @param {varchar} pLocation
	 * @param {decimal} pCoordX
	 * @param {decimal} pCoordY
	 * @param {int} pEventType_idEventType
	 */

	get: (req, res) => {
		connection.query("CALL eventGet( :V_pName, :V_pDate, :V_pLocation, :V_pCoordX, :V_pCoordY, :V_pEventType_idEventType );", req.query, res);
		}

}
