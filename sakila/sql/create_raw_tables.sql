create schema if not exists raw;

drop table if exists raw.actor ;


CREATE TABLE raw.actor (
    actor_id TEXT,
    first_name TEXT,
    last_name TEXT,
    last_update TEXT
);

comment on table raw.actor is 'describe la informacion personal del actor';

drop table if exists raw.category ;


CREATE TABLE raw.category (
    category_id TEXT,
    name TEXT,
    last_update TEXT
);

comment on table raw.category is 'describe el catalogo de categorias de las peliculas';

drop table if exists raw.film ;

CREATE TABLE raw.film (
    film_id TEXT,
    title TEXT,
    description TEXT,
    release_year TEXT,
    language_id TEXT,
    original_language_id TEXT,
    rental_duration TEXT,
    rental_rate TEXT,
    length TEXT,
    replacement_cost TEXT,
    rating TEXT,
    last_update TEXT,
    special_features text[]
);

comment on table raw.film is 'describe la información de las peliculas y metricas de renta';


drop table if exists raw.film_actor ;

CREATE TABLE raw.film_actor (
    actor_id TEXT,
    film_id TEXT,
    last_update TEXT
);

comment on table raw.film_actor is 'describe o enlaza al actor con la pelicula';


drop table if exists raw.film_category ;

CREATE TABLE raw.film_category (
    film_id TEXT,
    category_id TEXT,
    last_update TEXT
);

comment on table raw.film_category is 'describe o enlaza la pelicula con una categoria';

drop table if exists raw.address ;

CREATE TABLE raw.address (
    address_id TEXT,
    address TEXT,
    address2 TEXT,
    district TEXT,
    city_id TEXT,
    postal_code TEXT,
    phone TEXT,
    last_update TEXT
);

comment on table raw.address is 'describe la informacion de la direccion del cliente';

drop table if exists raw.city ;

CREATE TABLE raw.city (
    city_id TEXT,
    city TEXT,
    country_id TEXT,
    last_update TEXT
);

comment on table raw.city is 'describe la informacion de la ciudad del cliente';

drop table if exists raw.country ;

CREATE TABLE raw.country (
    country_id TEXT,
    country TEXT,
    last_update TEXT
);

comment on table raw.city is 'describe la informacion del país del cliente';

drop table if exists raw.customer ;


CREATE TABLE raw.customer (
    customer_id TEXT,
    store_id TEXT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    address_id TEXT,
    activebool TEXT,
    create_date TEXT,
    last_update TEXT,
    active TEXT
);

comment on table raw.customer is 'describe la informacion del cliente';

drop table if exists raw.inventory ;


CREATE TABLE raw.inventory (
    inventory_id TEXT,
    film_id TEXT,
    store_id TEXT,
    last_update TEXT
);

comment on table raw.inventory is 'relaciona la pelicula con la tienda y el estado de la renta';


drop table if exists raw.language ;


CREATE TABLE raw.language (
    language_id TEXT,
    name TEXT,
    last_update TEXT
);

comment on table raw.language is 'describe el idioma de la pelicula';


drop table if exists raw.payment ;

CREATE TABLE raw.payment (
    payment_id TEXT,
    customer_id TEXT,
    staff_id TEXT,
    rental_id TEXT,
    amount TEXT,
    payment_date TEXT
);

comment on table raw.payment is 'describe el pago de la renta';


drop table if exists raw.rental ;

CREATE TABLE raw.rental (
    rental_id TEXT,
    rental_date TEXT,
    inventory_id TEXT,
    customer_id TEXT,
    return_date TEXT,
    staff_id TEXT,
    last_update TEXT
);

comment on table raw.rental is 'describe el estado de la renta';

drop table if exists raw.staff ;

CREATE TABLE raw.staff (
    staff_id TEXT,
    first_name TEXT,
    last_name TEXT,
    address_id TEXT,
    email TEXT,
    store_id TEXT,
    active TEXT,
    username TEXT,
    password TEXT,
    last_update TEXT,
    picture TEXT
);

comment on table raw.staff is 'describe informacion del personal';

drop table if exists raw.store ;

CREATE TABLE raw.store (
    store_id TEXT,
    manager_staff_id TEXT,
    address_id TEXT,
    last_update TEXT
);

comment on table raw.store is 'describe informacion del establecimiento';

