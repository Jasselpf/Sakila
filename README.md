# Sakila

## Fuente de Datos
The [Sakila Database - DVD rental store](https://github.com/jOOQ/jOOQ/tree/master/jOOQ-examples/Sakila)
The Sakila example database was originally developed by Mike Hillyer of the MySQL AB documentation team. 
It was ported to other databases by DB Software Laboratory

License: [BSD Copyright DB Software Laboratory](http://www.etl-tools.com)

## Estructura de la Base de Datos

### Actor
**actor_id** identificador �nico de cada actor \\
**first_name** nombre del actor \\
**last_name** apellido del actor \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### Address
**address_id** identificador �nico de domicilio \\
**address** direcci�n \\
**address2** columna opcional para direcci�n adicional o datos adicionales de la direcci�n. En este caso esta vac�a para todos los registros \\
**district** distrito en el que se ubica la direcci�n. Est� vac�o para todos los registros \\
**city_id** identificador �nico de la ciudad en la que se encuentra el domicilio \\
**postal_code** c�digo postal de la direcci�n en la que se encuentra el domicilio \\
**phone** tel�fono del cliente, en este caso est� vac�o para todos los registros \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### Category
**category_id** identificador �nico de las categor�as de las pel�culas \\
**name** nombre de la categor�as de la pel�culas \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### City
**city_id** identificador �nico de la ciudad \\
**city** nombre de la ciudad \\
**country_id** identificador �nico del pa�s \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### Country
**country_id** identificador �nico del pa�s \\
**country** nombre del pa�s \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### Customer
**customer_id** identificador �nico de cada cliente \\
**store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas \\
**first_name** nombre del cliente \\
**last_name** apellido del cliente \\
**email** correo electr�nico del cliente \\
**address_id** identificador �nico de cada domicilio del cliente \\
**activebool** en la documentaci�n no hay descripci�n de esta variable. Se encuentra vac�a en todos los registros \\
**create_date** fecha en la que el cliente fue agregado al sistema \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\
**active** variable booleana que identifica si un cliente se enceuntra activo o no (1: activo y 0: inactivo) \\

### Film
**film_id** identificador �nico de cada pel�cula \\
**title** nombre o t�tulo de la pel�cula \\
**description** una breve descripci�n de la pel�cula \\
**release_year** fecha en la que fue lanzada la pel�cula \\
**language_id** identificador del lenguaje de la pel�cula \\
**original_language** lenguaje original de la pel�cula \\
**rental_duration** duraci�n del periodo de la renta medido en d�as \\
**rental_rate** costo de renta de la pe�cula en el periodo especificado en la columna rental_duration \\
**length** duraci�n de la pel�cula medida en minutos \\
**replacement_cost** monto cargado al cliente si la pel�cula no es regresada o si se devuelve da�ada \\
**rating** clasificaci�n de la pel�cula. Puede ser uno de los siguientes: G, PG, PG-13, R, NC-17 \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\
**special_features** lista de las caracter�sticas especiales incluidas en el DVD. Puede ser: ning�na, una o una o m�s de las siguientes Trailers, Commentaries, Deleted Scenes, Behind the Scenes \\

### film_actor
**actor_id** identificador �nico de cada actor \\
**film_id** identificador �nico de cada pel�cula \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### film_category
**film_id** identificador �nico de cada pel�cula \\
**category_id** identificador �nico de las categor�as de las pel�culas \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### inventory
**inventory_id** identificador �nico de inventario de la tienda \\
**film_id** identificador �nico de cada pel�cula \\
**store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### language
**language_id** identificador del lenguaje de la pel�cula \\
**name** idioma de la pel�cula. Solo hay seis idiomas: English. Italian, Japanese, Mandarin, French y German \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### payment
**payment_id** identificador �nico de cada pago \\
**costumer_id** identificador �nico de cada cliente \\
**staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 \\
**rental_id** la renta a la que se le aplica el pago. Es opcional porque alguno pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta \\
**amount** el monto del pago \\
**payment_date** fecha en la que se proces� el pago \\

### staff
**staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 \\
**first_name** nombre del miembro del staff \\
**last_name** apellido del miembro del staff \\
**address_id** identificador �nico de domicilio \\
**email** correo electr�nico del miembro del staff \\
**store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas \\
**active** variable booleana que identifica si el empleado se enceuntra activo o no (1: activo y 0: inactivo) \\
**username** nombre de usuario del miembro del staff para acceder al sistema de rentas \\
**password** contrase�a usada por el miembro del staff para acceder al sistema de rentas \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\
**picture** BLOB que contiene la foto del empleado, en este caso vac�o \\

### rental
**rental_id** la renta a la que se le aplica el pago. Es opcional porque algunos pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta \\
**rental_date** fecha y hora en que se realiz� la renta \\
**inventory_id** identificador �nico de inventario de la tienda \\
**customer_id** identificador �nico de cada cliente \\
**return_date** fecha en la que se devolvi� la pel�cula rentada \\
**staff_id** identificador �nico del miembro del staff que proces� el pago. S�lo tiene 2 valores: 1 y 2 \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

### store
**store_id** identificador �nico de tienda. S�lo se tienen registros de dos tiendas \\
**manager_staff_id** identificador �nico del gerente de la tienda \\
**address_id** identificador �nico de domicilio \\
**last_update** fecha en la que el registro fue creado o la m�s receinte actualizaci�n de dicho registro \\

![Diagrama_Entidad_Relaci�n](sakila_database.png)

## Pipeline

## Instalaci�n y Ejecuci�n
Clonar repositorio de github \\
```shell
git clone https://github.com/Jasselpf/Sakila
```
Crear entorno virtual sakila con python 3.7.3 \\
```shell
pyenv virtualenv 3.7.3 sakila
```
Apuntar a carpeta para activar el ambiente virtual \\
```shell
echo 'sakila' > .python-version
```
Instalar poetry \\
```shell
pip install poetry
poetry install
```
Crear usuario sakila \\
```shell
sudo su postgres
createuser sakila -D -l -P
createdb -O sakila sakila
```
Crear esquemas \\
```python
cd sakila
python sakila.py create-schemas
```
Crear raw tables \\
```python
python sakila.py create-raw-tables
python sakila.py load-sakila
```
Crear raw tables \\
```python
python sakila.py create-raw-tables
python sakila.py load-sakila
```
Para revisar que se hayan creado las tablas en el esquema raw \\
```shell
\c sakila
SET search_path TO raw; 
\dt
```


Crear tablas limpias
```python
python sakila.py to-cleaned
```
Crear tablas semantic
```python
python sakila.py to-semantic
```

