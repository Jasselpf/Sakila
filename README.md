# Sakila
The Sakila Database - DVD rental store

## Tablas

### Actor
*actor_id* identificador único de cada actor
*first_name* nombre del actor
*last_name* apellido del actor
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

### Address
*address_id* identificador único de domicilio
*address* dirección
*address2* columna opcional para dirección adicional o datos adicionales de la dirección. En este caso esta vacía para todos los registros
*district* distrito en el que se ubica la dirección. Está vacío para todos los registros
*city_id* identificador único de la ciudad en la que se encuentra el domicilio
*postal_code* código postal de la dirección en la que se encuentra el domicilio
*phone* teléfono del cliente, en este caso está vacío para todos los registros
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

###Category
*category_id* identificador único de las categorías de las películas
*name* nombre de la categorías de la películas
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

###City
*city_id* identificador único de la ciudad en la que se encuentra el domicilio del cliente
*city* nombre de la ciudad
*country_id* identificador único del país
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

###Country
*country_id* identificador único del páis
*country* nombre del país
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

###Customer
*customer_id* identificador único de cada cliente
*store_id* identificador único de tienda. Sólo se tienen registros de dos tiendas
*first_name* nombre del cliente
*last_name* apellido del cliente
*email* correo electrónico del cliente
*address_id* identificador único de cada domicilio del cliente
*activebool* en la documentación no hay descripción de esta variable. Se encuentra vacía en todos los registros.
*create_date* fecha en la que el cliente fue agregado al sistema.
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.
*active* varaible booleana que identifica si un cliente se enceuntra activo o no (1: activo y 0: inactivo).

###Film
*film_id* identificador único de cada película
*title* nombnre o título de la película
*description* una breve descripción de la pélícula
*release_year* fecha en la que fue lanzada la película
*language_id* identificador del lenguaje de la película
*original_language* lenguaje original de la película
*rental_duration* duración del periodo de la renta medido en días.
*rental_rate* costo de renta de la peícula en el periodo especificado en la columna rental_duration
*length* duración de la película medida en minutos
*replacement_cost* monto cargado al cliente si la película no es regresada o si es regresada dañada
*rating* clasificación de la película. Puede ser uno de los siguientes: G, PG, PG-13, R, NC-17
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro
*special_features* lista de las características especiales incluidas en el DVD. Puede ser: ningúna, una o una o más de las siguientes Trailers, Commentaries, Deleted Scenes, Behind the Scenes

###film_actor
*actor_id* identificador único de cada actor}
*film_id* identificador único de cada película
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro.

###film_category
*film_id* identificador único de cada película
*category_id* identificador único de las categorías de las películas
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro

###inventory
*inventory_id* identificador único de inventario de la tienda
*film_id* identificador único de cada película
*store_id* identificador único de tienda. Sólo se tienen registros de dos tiendas
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro

###language
*language_id* identificador del lenguaje de la película
*name* nombre del idioma de la película. Solo hay seis idiomas: English. Italian, Japanese, Mandarin, French y German
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro

###payment
*payment_id* identificador único de cada pago
*costumer_id* identificador único de cada cliente
*staff_id* identificador único del miembro del staff que procesó el pago. Sólo tiene 2 valores: 1 y 2
*rental_id* la renta a la que se le aplica el pago. Es opcional porque alguno pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta
*amount* el monto del pago
*payment_date* fecha en la que se procesó el pago

###staff
*staff_id* identificador único del miembro del staff que procesó el pago. Sólo tiene 2 valores: 1 y 2
*first_name* nombre del miembro del staff
*last_name* apellido del miembro del staff
*address_id* identificador único de domicilio
*email* correo electrónico del miembro del staff
*store_id* identificador único de tienda. Sólo se tienen registros de dos tiendas
*active* varaible booleana que identifica si el empleado se enceuntra activo o no (1: activo y 0: inactivo).
*username* nombre de usuario del miembro del staff para acceder al sistema de rentas
*password* contraseña usada por el miembro del staff para acceder al sistema de rentas.
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro
*picture* BLOB que contiene la foto del empleado, en este caso vacío

###rental
*rental_id* la renta a la que se le aplica el pago. Es opcional porque alguno pagos son por tarifas pendientes y pueden no estar directamente relacionados con la renta
*rental_date* fecha y hora en que se realizó la renta
*inventory_id* identificador único de inventario de la tienda
*customer_id* identificador único de cada cliente
*return_date* fechqa en la que se devolvió la película rentada
*staff_id* identificador único del miembro del staff que procesó el pago. Sólo tiene 2 valores: 1 y 2
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro

###store
*store_id* identificador único de tienda. Sólo se tienen registros de dos tiendas
*manager_staff_id* identificador único del gerente de la tienda
*address_id* identificador único de domicilio
*last_update* fecha en la que el registro fue creado o la más receinte actualización de dicho registro
