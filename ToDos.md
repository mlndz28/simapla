# Acciones pendientes
Siéntase en libertad de agregar tareas pendientes. Este documento sirve de consulta de faltantes y asignación o repartición de tareas. Procure no eliminar las tareas listas, si no tacharlas y escribir su nombre al lado, como auditoría del autor del mismo. Siéntase en libertad de consultar con el equipo sobre cualquier duda funcional o no funcional sobre estos requerimientos. Consulte el sitio de [DaringFireball][1] para la correcta utilización de Markdown.

## Aplicación Web
- Basicamente todo ':)

## Servicio Web
- Idear una manera general para consultar Inserts-Updates-Deletes o crear las funciones respectivas para todos los procedimientos. En su defecto se podría programar un autómata que genere las funciones del WebService de manera automática.

## Base de Datos

#### Procedimientos
Procure crear inserts para todas las acciones. No utilice "insert into" dentro de procedimientos, sino que invoque el respectivo procedimiento de insert. Note las etiquetas "I_U_D_" para cada procedimiento; son las iniciales de Insert-Update-Delete. Al completar por ejemplo el update de Event, proceda a sustituir el guión bajo de la derecha por un asterisco como "I_U*D_ Event"
- I_U_D_ Country
- I_U_D_ Province
- I_U_D_ Canton
- I_U_D_ District
- I_U_D_ InstrumentName
- I_U_D_ Patrimony
- I_U_D_ ManagementPosition
- I_U_D_ AttendanceType
- I_U_D_ GroupType
- I_U_D_ EventType
- I_U_D_ Schedule
- I_U_D_ Event
- I_U_D_ Group
- I_U_D_ Person
- I_U_D_ Student
- I_U_D_ Teacher
- I_U_D_ Administrator
- I_U_D_ Phone
- I_U_D_ Email
- I_U_D_ Carnet
- Asignar instrumento a estudiantes
- Asignar horario a grupo
- ...

#### Vistas
Las vistas son una manera estable de consultar siempre los mismos datos. Es similar a los procedimientos, pero estas no reciben parámetros y están optimizadas para SELECTs. Por lo tanto estas vistas son básicamente algunos SELECTs con joins de unas tablas o vistas con otras. Por ejemplo, para ver la información de los estudiantes, se debe hacer un join de la tabla Student y la vista de Personas. Además la vista de Personas es join entre las tablas de Persona, Email, Telefono y demás datos que pertenezcan a las personas.
- Personas
- Estudiantes
- Profesores
- Instrumentos
- Administrativos
- Integrantes de una agrupación
- Eventos
- Grupos (info general)
- Distritos (y respectivos cantones, provincias y pais)




[1]: http://daringfireball.net/projects/markdown/syntax "DaringFireball"
