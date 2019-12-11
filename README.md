# Sakila

## Fuente de Datos
The [Sakila Database - DVD rental store](https://github.com/jOOQ/jOOQ/tree/master/jOOQ-examples/Sakila)

La base de datos Sakila fue desarrollada originalmente por Mike Hillyer del equipo de documentaci�n de MySQL AB <br/>
Fue convertida a otras bases de datos por DB Software Laboratory <br/>

Licencia: [BSD Copyright DB Software Laboratory](http://www.etl-tools.com)

## Estructura de la Base de Datos

### Actor
- **actor_id** identificador �nico de cada actor <br/>
- **first_name** nombre del actor <br/>
- **last_name** apellido del actor <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### Address
- **address_id** identificador �nico de domicilio <br/>
- **address** direcci�n <br/>
- **address2** columna opcional para direcci�n adicional o datos adicionales de la direcci�n. En este caso esta vac�a para todos los registros <br/>
- **district** distrito en el que se ubica la direcci�n. Est� vac�o para todos los registros <br/>
- **city_id** identificador �nico de la ciudad en la que se encuentra el domicilio <br/>
- **postal_code** c�digo postal de la direcci�n en la que se encuentra el domicilio <br/>
- **phone** tel�fono del cliente, en este caso est� vac�o para todos los registros <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### Category
- **category_id** identificador �nico de las categor�as de las pel�culas <br/>
- **name** nombre de las categor�as de la pel�culas <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### City
- **city_id** identificador �nico de la ciudad <br/>
- **city** nombre de la ciudad <br/>
- **country_id** identificador �nico del pa�s <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### Country
- **country_id** identificador �nico del pa�s <br/>
- **country** nombre del pa�s <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### Customer
- **customer_id** identificador �nico de cada cliente <br/>
- **store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas <br/>
- **first_name** nombre del cliente <br/>
- **last_name** apellido del cliente <br/>
- **email** correo electr�nico del cliente <br/>
- **address_id** identificador �nico de cada domicilio del cliente <br/>
- **activebool** en la documentaci�n no hay descripci�n de esta variable. Se encuentra vac�a en todos los registros <br/>
- **create_date** fecha en la que el cliente fue agregado al sistema <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>
- **active** variable booleana que identifica si un cliente se encuentra activo o no (1: activo y 0: inactivo) <br/>

### Film
- **film_id** identificador �nico de cada pel�cula <br/>
- **title** nombre o t�tulo de la pel�cula <br/>
- **description** breve descripci�n de la pel�cula <br/>
- **release_year** fecha en la que fue lanzada la pel�cula <br/>
- **language_id** identificador del idioma de la pel�cula <br/>
- **original_language** idioma original de la pel�cula <br/>
- **rental_duration** duraci�n del periodo de la renta medido en d�as <br/>
- **rental_rate** costo de renta de la pe�cula en el periodo especificado en la columna rental_duration <br/>
- **length** duraci�n de la pel�cula medida en minutos <br/>
- **replacement_cost** monto cargado al cliente si la pel�cula no es regresada o si se devuelve da�ada <br/>
- **rating** clasificaci�n de la pel�cula. Puede ser uno de los siguientes: G, PG, PG-13, R, NC-17 <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>
- **special_features** lista de las caracter�sticas especiales incluidas en el DVD. Puede ser: ninguna o una o m�s de las siguientes: Trailers, Commentaries, Deleted Scenes, Behind the Scenes <br/>

### film_actor
- **actor_id** identificador �nico de cada actor <br/>
- **film_id** identificador �nico de cada pel�cula <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### film_category
- **film_id** identificador �nico de cada pel�cula <br/>
- **category_id** identificador �nico de las categor�as de las pel�culas <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

La siguiente imagen muestra el n�mero de pel�culas por categor�a: <br/>
![Film_Categories](sakila_films_categories.png)

### inventory
- **inventory_id** identificador �nico de inventario de la tienda <br/>
- **film_id** identificador �nico de cada pel�cula <br/>
- **store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

La siguiente imagen muestra el inventario por tienda y pel�culas, por ejemplo, la tienda 1 tiene 3 copias de 232 pel�culas: <br/>
![Inventory](sakila_inventories.png)

### language
- **language_id** identificador del idioma de la pel�cula <br/>
- **name** idioma de la pel�cula. Solo hay seis idiomas: English. Italian, Japanese, Mandarin, French y German <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

### payment
- **payment_id** identificador �nico de cada pago <br/>
- **costumer_id** identificador �nico de cada cliente <br/>
- **staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 <br/>
- **rental_id** la renta a la que se le aplica el pago. Es opcional porque algunos pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta <br/>
- **amount** el monto del pago <br/>
- **payment_date** fecha en la que se proces� el pago <br/>

### staff
- **staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 <br/>
- **first_name** nombre del miembro del staff <br/>
- **last_name** apellido del miembro del staff <br/>
- **address_id** identificador �nico de domicilio <br/>
- **email** correo electr�nico del miembro del staff <br/>
- **store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas <br/>
- **active** variable booleana que identifica si el empleado se enceuntra activo o no (1: activo y 0: inactivo) <br/>
- **username** nombre de usuario del miembro del staff para acceder al sistema de rentas <br/>
- **password** contrase�a usada por el miembro del staff para acceder al sistema de rentas <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>
- **picture** BLOB que contiene la foto del empleado, en este caso esta vac�o para los dos empleados <br/>

### rental
- **rental_id** la renta a la que se le aplica el pago. Es opcional porque algunos pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta <br/>
- **rental_date** fecha y hora en que se realiz� la renta <br/>
- **inventory_id** identificador �nico de inventario de la tienda <br/>
- **customer_id** identificador �nico de cada cliente <br/>
- **return_date** fecha en la que se devolvi� la pel�cula rentada <br/>
- **staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

La siguiente imagen muestra el n�mero de rentas y de devoluciones por fecha: <br/>
![Rentals](sakila_rentals.png)

### store
- **store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas <br/>
- **manager_staff_id** identificador �nico del gerente de la tienda <br/>
- **address_id** identificador �nico de domicilio <br/>
- **last_update** fecha en la que el registro fue creado o la m�s reciente actualizaci�n de dicho registro <br/>

La siguiente imagen muestra el n�mero total de pel�culas (inventario) para cada tienda: <br/>
![Stores](sakila_stores.png)

## Diagrama de Entidad Relaci�n
![Diagrama_Entidad_Relaci�n](sakila_database.png)

## Pipeline
![Pipeline](sakila_pipeline.png)

## Instalaci�n y Ejecuci�n

- Primeros pasos
Clonar repositorio de github en m�quina virtual de vagrant <br/>
```shell
git clone https://github.com/Jasselpf/Sakila
```
Ubicarse en la carpeta Sakila clonada <br/>
Ejecutar el archivo *set_up.sh* <br/>
```shell
./set_up.sh
```
Este archivo ejecutar� los siguientes pasos: <br/>

Crear entorno virtual sakila con python 3.7.3 <br/>
```shell
pyenv virtualenv 3.7.3 sakila
```
Apuntar a carpeta para activar el ambiente virtual <br/>
```shell
echo 'sakila' > .python-version
```
Instalar poetry <br/>
```shell
pip install poetry
poetry install
```
Crear usuario sakila <br/>
```shell
sudo su postgres
createuser sakila -D -l -P
createdb -O sakila sakila
```
- Crear esquemas <br/>
Se crean los esquemas a utilizar que son: raw, cleaned y semantic <br/>
```python
cd sakila
python sakila.py create-schemas
```
- Crear raw tables <br/>
Se crean los esquemas de las tablas tal como estaban de origen y poniendo todos los campos como tipo texto. Se cargan los datos <br/>
```python
python sakila.py create-raw-tables
python sakila.py load-sakila
```
Para revisar que se hayan creado las tablas en el esquema raw <br/>
```shell
\c sakila
SET search_path TO raw; 
\dt
```
- Crear tablas limpias <br/>
Se siguen las mejores pr�cticas vistas: se renombran las tablas y los campos, se asigna el tipo de dato correcto, los textos se pasan a min�sculas <br/>
```python
python sakila.py to-cleaned
```
- Crear tablas semantic <br/>
```python
python sakila.py to-semantic
```

Nos planteamos responder las siguientes preguntas: <br/>
1. �Cu�ntas rentas va a hacer el cliente? <br/>
2. Predecir el monto de renta por cliente en un periodo <br/>

Por tal motivo decidimos que nuestra **entidad** ser�a el *cliente* y los **eventos** que definimos relacionados a este son: <br/>
1. Rentar pel�cula <br/>
2. Devolver pel�cula <br/>



