# Web App #

## ¿Cómo correr? ##
```
> cd /path/to/here
> npm install
> npm start
```
Ver la aplicación en la dirección indicada(e.g. `http://localhost:3000`).

## Archivos y Carpetas ##

 - **`app.js`**: crea la aplicación express y le adjunta el middleware(`app.use(...)`), 
 este middleware es lo que se ejecuta cuando se hace un pedido http.
 - **`package.json`**: es la información del proyecto npm, define las dependencias del 
 proyecto entre otras cosas.
 - **`bin/www`**: script para correr la aplicación.
 - **`public/`**: contenido estático, estilos y javascripts para el cliente.
 - **`routes/`**: define las rutas del proyecto, es middleware que se usa en `app.js`.
 - **`views/`**: son los templates en jade para generar el html.
