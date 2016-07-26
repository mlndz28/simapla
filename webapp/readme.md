# Web App #

## ¿Cómo correr la aplicación? ##

### Simple ###
```
> cd /path/to/here
> npm install
> npm start
```

Ver la aplicación en la dirección adecuada(`http://localhost:3000` para ambiente
local).

### Debug ###
**Windows**:
```
> cd /path/to/here
> npm install
> set DEBUG=webapp:*
> npm start
```

**UNIX**:
```
> cd /path/to/here
> npm install
> DEBUG=webapp:* npm start
```

Ver la aplicación en la dirección indicada(generalmente `http://localhost:3000`).

## Archivos y Carpetas ##

 - **`app.js`**: crea la aplicación express y le adjunta el middleware(`app.use(...)`),
 este middleware es lo que se ejecuta cuando se hace un pedido http.
 - **`package.json`**: es la información del proyecto npm, define las dependencias del
 proyecto entre otras cosas.
 - **`bin/www`**: script para correr la aplicación.
 - **`mysql/`**: código relacionado a la base de datos.
 - **`public/`**: contenido estático, estilos y javascripts para el cliente.
 - **`routes/`**: define las rutas del proyecto, es middleware que se usa en `app.js`.
 - **`views/`**: son los templates en ~~jade~~ pug para generar el html.
