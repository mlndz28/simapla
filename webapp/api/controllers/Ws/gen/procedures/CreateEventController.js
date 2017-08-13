let connection = DbConnectionService;

sails.config.routes['POST /ws/createEvent'] = 'Ws/gen/procedures/CreateEvent.post';

/**
 * @function createEvent
 * @param {varchar} pName
 * @param {date} pDate
 * @param {varchar} pLocation
 * @param {decimal} pCoordX
 * @param {decimal} pCoordY
 * @param {int} pEventType_idEventType
 */

module.exports = {
	post: (req, res) => {
		connection.query("CALL createEvent( :V_pName, :V_pDate, :V_pLocation, :V_pCoordX, :V_pCoordY, :V_pEventType_idEventType );", req.body, res);
	}
}
