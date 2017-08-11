# Scripts DML de la Base de Datos de Simapla

## Requerimientos
  - MySQL Server CE 5.7

## Instalación

```bash
mysql -u username -p
# ingresar contraseña
```

```mysql
> drop schema SimaplaDb;
> source tablasFksUsers.sql;
> source views.sql
> source procedimientos.sql;
> source populatedb.sql;
```
