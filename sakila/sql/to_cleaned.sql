
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


    raise notice 'populating customers';
    drop table if exists cleaned.customers;

    create table cleaned.customers as(
	  select
        customer_id::int customer,
        store_id::int store,
        lower(first_name) as first_name,
        lower(last_name) as last_name,
        lower(email) as email,
        address_id::int address,
        0 as activebool,
		to_timestamp(create_date, 'YYYY-MM-DD HH24:MI:SS') as create_date,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update,
        active::int active
	  from raw.customer
    );

    create index cleaned_customers_customer_ix on cleaned.customers(customer);
    create index cleaned_customers_store_ix on cleaned.customers(store);
	create index cleaned_customers_first_name_ix on cleaned.customers(first_name);
	create index cleaned_customers_last_name_ix on cleaned.customers(last_name);
	create index cleaned_customers_email_ix on cleaned.customers(email);
	create index cleaned_customers_address_ix on cleaned.customers(address);
	
	
	raise notice 'populating inventories';
    drop table if exists raw.inventories;

    create table cleaned.inventories as(
	  select
        inventory_id::int inventory,
        film_id::int film,
        store_id::int store,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
	  from raw.inventory
    );

    create index cleaned_inventories_inventory_ix on cleaned.inventories(inventory);
	create index cleaned_inventories_film_ix on cleaned.inventories(film);
	    
		
    raise notice 'populating languages';
    drop table if exists cleaned.languages;

    create table cleaned.languages as(
	  select
        language_id::int idiom,
		lower(name) as name,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
	  from raw.language
    );

    comment on column cleaned.languages.idiom is 'Se usó idiom en lugar de language ya que este último es función de POSTGRESQL';

    raise notice 'populating payments';
    drop table if exists cleaned.payments ;

    create table cleaned.payments as(
	  select
        payment_id::int payment,
        customer_id::int customer,
        staff_id::int staff,
        rental_id::int rental,
        amount::real amount,
		to_timestamp(payment_date, 'YYYY-MM-DD HH24:MI:SS') as payment_date
	  from raw.payment
    );
	
	create index cleaned_payments_payment_ix on cleaned.payments(payment);
	create index cleaned_payments_customer_ix on cleaned.payments(customer);
	create index cleaned_payments_rental_ix on cleaned.payments(rental);
	create index cleaned_payments_amount_ix on cleaned.payments(amount);
	create index cleaned_payments_payment_date_ix on cleaned.payments(payment_date);


    raise notice 'populating rentals';
    drop table if exists cleaned.rentals cascade;

    create table cleaned.rentals as(
	  select
        rental_id::int rental,
        to_timestamp(rental_date, 'YYYY-MM-DD HH24:MI:SS') as rental_date,
        inventory_id::int inventory,
        customer_id::int customer,
		to_timestamp(return_date, 'YYYY-MM-DD HH24:MI:SS') as return_date,
        staff_id::int staff,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
	  from raw.rental
    );

	create index cleaned_rentals_rental_date_ix on cleaned.rentals(rental_date);
	create index cleaned_rentals_inventory_ix on cleaned.rentals(inventory);
	create index cleaned_rentals_customer_ix on cleaned.rentals(customer);
	create index cleaned_rentals_return_date_ix on cleaned.rentals(return_date);
	
    comment on column cleaned.rental.rental_date is 'Se definió como TIMESTAMP';
	comment on column cleaned.rental.return_date is 'Se definió como TIMESTAMP';

    raise notice 'populating staff';
    drop table if exists cleaned.staff cascade;

    create table cleaned.staff as(
	  select
        staff_id::int as staff,
        lower(first_name) as first_name,
		lower(last_name) as last_name,
        address_id::int as address,
        lower(email) as email,
        store_id::int as store,
        active::int as active,
        lower(username) as username,
        password,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update,
        0 as picture
	  from raw.staff
    );
     
	 comment on table cleaned.staff is 'Se tienen 2 empleados únicamente';
	 
	 
	raise notice 'populating stores';
    drop table if exists cleaned.stores cascade;
	
	create table cleaned.stores as(
	  select
        store_id::int as store,
        manager_staff_id::int as manager_staff,
        address_id::int as address,
        to_date(substring(last_update,1,10),'YYYY-MM-DD') as last_update
	  from raw.store
    );
	
	comment on table cleaned.stores is 'Se tienen 2 tiendas únicamente';

    end $cleaned$;

    exception when others then
    get stacked diagnostics exc_message = message_text;
    get stacked diagnostics exc_context = pg_exception_context;
    get stacked diagnostics exc_detail = pg_exception_detail;
    raise exception E'\n------\n%\n%\n------\n\nCONTEXT:\n%\n', exc_message, exc_detail, exc_context;
end $$; 
