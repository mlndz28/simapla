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

 _* Probado con postman para request ```GET ws/countries```_

̣̣ _** El login ya devuelve el token_

## Commits Relevantes
 
 - init with jwt
    
    f780d83832da9107f3382e2b21033af5e7351db4

 - add jwtAuth
 
    e0e3b96ca139a8959d928645b09ca59c64630c0e

 - add jwt to policies and routes
 
    82da75890d6de191b6a16b7ed7d58607c7446a59
    
 - enable authorization header on sails
 
    4a7358ef1972dca679dad10fa698b653d6d045fb
    
 Talvez(muy probable) hay otros commits, creo que esos son los más importantes
