# Incrementor-backup

Un herramienta simple para hacer copias de seguridad entre servidores o máquinas Windows haciendo uso de Robocopy o Xcopy (Configurable en el script).

Esta herramienta es ideal para cuando tenemos montado un NAS en red en nuestra oficina o en nuestro entorno de trabajo y lo tenemos conectado a nuestro 
equipo como una unidad de red o simplemente tenemos un servidor de datos en la red (como por ejemplo un servidor SAMBA) y queremos pasar datos a este o hacer una copia de seguirdad
de los datos en local a ese servidor de forma simple y desatendida.

La herramiendo de serie permite crear directorios fechados con el día de la copia para tener backups clasificados por días pero tambiénes posible configurarlo para realizar copias de forma incremental sobre los mismo repositorios.

El scrip es modular y se pueden activar o desactivar secciones según lo que queramos hacer y de la forma que se quiera hacer, así como añadir y eliminar funciones y parámetros adicionales segun se requiera.

**IMPORTANTE**: Es necesario en caso de de que tenegamos un servidor de datos securizado disponer de credenciales para hacer login. El scrip está configurado para conectarse a unidades de red ya mapeadas o con credenciales guardadas ya automáticamente, no obstante es posible modificar el comando en el scrip para insertar las credenciales y que el script ejecute la conexión y el mapeo del la unidad de red automaticamente en el proceso.

¿Cómo funciona?
======
La herramienta comienza haciendo una comprobación de que el host de donde posteriormente se mapearán o se conectarán las unidades de red está operativo y tiene conexión directa. 
En caso de fallo, la herramienta devuelve un error de conexión y se cerrará automaticamente.



