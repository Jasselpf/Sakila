
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
        to_date(substring(last_update,1,10),'YY-MM-DD') as last_update
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

    create table raw.film_actor (
        actor_id TEXT,
        film_id TEXT,
        last_update TEXT
    );

    comment on table raw.film_actor is 'describe o enlaza al actor con la pelicula';


    drop table if exists raw.film_category ;

    create table raw.film_category (
        film_id TEXT,
        category_id TEXT,
        last_update TEXT
    );

    comment on table raw.film_category is 'describe o enlaza la pelicula con una categoria';

    drop table if exists raw.address ;

    create table raw.address (
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

    create table raw.city (
        city_id TEXT,
        city TEXT,
        country_id TEXT,
        last_update TEXT
    );

    comment on table raw.city is 'describe la informacion de la ciudad del cliente';

    drop table if exists raw.country ;

    create table raw.country (
        country_id TEXT,
        country TEXT,
        last_update TEXT
    );

    comment on table raw.city is 'describe la informacion del país del cliente';

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
