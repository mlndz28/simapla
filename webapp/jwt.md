# Uso de jwt en el proyecto

Para la autenticacion de usuarios se utiliza jwt, esto se implementa
en el servicio ```api/services/jwtService.js``` y la _policy_
```api/policies/jwtAuth.js```. En

## Comunicación con el servidor

Para realizar pedidos que requieran el token se debe realizar un login y
guardar el token en caso de login exitoso.
Ahora se debe incluir el token en los pedidos que lo requieran a manera del
header ```Authorization``` asignado a ```Bearer <token>```, se sustituye
```<token>``` por el token almacenado previamente.

̣_* Probado con postman para request ```GET ws/countries```._

̣̣_** El login ya devuelve el token._
