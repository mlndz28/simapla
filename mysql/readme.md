# MySQL #
Acá están los scripts para generar la base de datos.

La idea es mantener separadas las diferentes partes del script final para que
sea fácil modificarlas y debugearlas. También se puede optar por crear un script
que solo contenga las partes deseadas.

La estructura de la carpeta [`src`](src) es bastante sencilla.

## Generando el script ##
Para generar el script se debe hacer lo siguiente:
```
> cd /path/to/here
> npm install
> gulp
```
La última linea va a concatenar todos los archivos en el orden adecuado(vease
el orden de los elementos del array `sqlFiles` en [`gulpfile.js`](gulpfile.js)).

El script luego permanecerá esperando cambios en cualquier archvo `.sql` de la
carpeta `src`que se esté concatenando(i.e. que está en `sqlFiles`) , y realizará
nuevamente la concatenación.

El archivo creado se encontrará en la carpeta `dist`, y se llamrá `script.sql`.
