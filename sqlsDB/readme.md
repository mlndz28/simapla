# Scripts DML de la Base de Datos de Simapla

## Requerimientos
  - MySQL Server CE 5.7

## Instalación
```bash
mysql -u username -p
# ingresar contraseña
```
### Con datos de prueba)
```bash
mysql -u username -p
# ingresar contraseña
> source source.sql
```

Se corren todos los scripts en un wrapper ```source.sql```.


### sin datos de prueba)
```mysql
> drop schema SimaplaDb;
> source tablesFksUsers.sql;
> source views.sql
> source procedures.sql;
```

## Base de Datos
La base de datos ```SimaplaDb``` se compone de una serie de tablas, vistas,
procedimientos y datos de prueba.

### Tablas
Las tablas de la base de datos se encuentran en el script ```tablesFksUsers.sql```, cuenta además con las relaciones(foreign keys) entre las tablas.

### Vistas
Las vistas se encuentran en el script ```views.sql```.

### Procedimientos
Los procedimientos se encuentran en el script ```procedures.sql```.
