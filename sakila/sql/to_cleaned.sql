
\echo 'Sakila(cleaned)'
\echo 'Programación para Ciencia de Datos'
\echo 'Github <https://github.com/Jasselpf/Sakila>'
\set VERBOSITY terse
\set ON_ERROR_STOP true

do language plpgsql $$ declare
    exc_message text;
    exc_context text;
    exc_detail text;
begin

  do $cleaned$ begin

   set search_path = cleaned, public;

  raise notice 'populating actors';
  drop table if exists cleaned.actors cascade;

  create table cleaned.actors as (
    select
        actor_id::int as actor,
        lower(first_name) as first_name,
        lower(last_name) as last_name,
        to_date(substring(last_update,1,10),'YY-MM-DD') as last_update
    from raw.actor
    );

  create index cleaned_actors_actor_ix on cleaned.actors (actor)


  raise notice 'populating categories';
  drop table if exists cleaned.categories cascade;

  create table cleaned.categories as (
    select
        category_id::int as category,
        lower(name) as name,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.category
    );

  create index cleaned_categories_category_ix on cleaned.categories (category);
  create index cleaned_categories_category_ix on cleaned.categories (name);

  raise notice 'populating films';
  drop table if exists cleaned.films cascade;

  create table cleaned.films as (
    select
        film_id::int as film,
        lower(title) as title,
        lower(description) as description,
        release_year::int as release_year,
        language_id::int as idiom,
        0 as original_language,
        rental_duration::int as rental_duration,
        rental_rate::real as rental_rate,
        length::int as length,
        replacement_cost::real as replacement_cost,
        lower(rating) as rating,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update,
        special_features
    from raw.film
    );

    create index cleaned_films_film_ix on cleaned.films(film);

    comment on column cleaned.films.idiom is 'En raw la columna se llama language_id';
    comment on column cleaned.films.original_language is 'Originalmente valor nulo, se modifico a 0';

  raise notice 'populating films_actors';
  drop table if exists cleaned.films_actors cascade;

  create table cleaned.films_actors as (
    select
        actor_id::int as actor,
        film_id::int as film,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.film_actor
    );

  create index cleaned_films_actors_actor_ix on cleaned.films_actors(actor);
  create index cleaned_films_actors_film_ix on cleaned.films_actors(film);

  comment on table cleaned.films_actors is 'relacion entre actores y peliculas';

  raise notice 'populating films_categories';
  drop table if exists cleaned.films_categories cascade;

  create table cleaned.films_categories as (
    select
        film_id::int as film,
        category_id::int category,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.film_category
    );

  create index cleaned_films_categories_category_ix on cleaned.films_actors(category);
  create index cleaned_films_categories_film_ix on cleaned.films_actors(film);

  comment on table cleaned.films_categories is 'relacion pelicula con una categoria';

  raise notice 'populating addresses';
  drop table if exists cleaned.addresses cascade;

  create table cleaned.addresses as (
    select
        address_id::int as address,
        lower(address) as address1,
        0 as address2,
        0 as district,
        city_id::int as city,
        postal_code::int as postal_code,
        0 as phone,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.address
    );

  create index cleaned_addresses_address_ix on cleaned.addresses(address);

  comment on table cleaned.addresses is 'describe la informacion de la direccion del cliente';

  raise notice 'populating cities'
  drop table if exists cleaned.cities cascade;

  create table cleaned.cities (
    select
        city_id::int as city,
        lower(city) as city_name ,
        country_id::int as country,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.city
    );

  create index cleaned_cities_city_ix on cleaned.cities(city);
  create index cleaned_cities_country_ix on cleaned.cities(country);

  comment on table cleaned.cities is 'describe la informacion de la ciudad del cliente';

  raise notice 'populating countries'
  drop table if exists cleaned.countries cascade;

  create table cleaned.countries as (
    select
        country_id::int as country,
        lower(country) as country_name,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
    from raw.country
    );

  create index cleaned_countries_country_ix on cleaned.countries(country);
  create index cleaned_countries_country_name_ix on cleaned.countries(country_name);

  comment on table cleaned.countries is 'describe la informacion del país del cliente';

    drop table if exists raw.customer ;


    create table raw.customer (
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


    create table raw.inventory (
        inventory_id TEXT,
        film_id TEXT,
        store_id TEXT,
        last_update TEXT
    );

    comment on table raw.inventory is 'relaciona la pelicula con la tienda y el estado de la renta';


    drop table if exists raw.language ;


    create table raw.language (
        language_id TEXT,
        name TEXT,
        last_update TEXT
    );

    comment on table raw.language is 'describe el idioma de la pelicula';


    drop table if exists raw.payment ;

    create table raw.payment (
        payment_id TEXT,
        customer_id TEXT,
        staff_id TEXT,
        rental_id TEXT,
        amount TEXT,
        payment_date TEXT
    );

    comment on table raw.payment is 'describe el pago de la renta';


    drop table if exists raw.rental ;

    create table raw.rental (
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

    create table raw.staff (
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

    create table raw.store (
        store_id TEXT,
        manager_staff_id TEXT,
        address_id TEXT,
        last_update TEXT
    );

    comment on table raw.store is 'describe informacion del establecimiento';

    end $cleaned$;

    exception when others then
    get stacked diagnostics exc_message = message_text;
    get stacked diagnostics exc_context = pg_exception_context;
    get stacked diagnostics exc_detail = pg_exception_detail;
    raise exception E'\n------\n%\n%\n------\n\nCONTEXT:\n%\n', exc_message, exc_detail, exc_context;
end $$; 
