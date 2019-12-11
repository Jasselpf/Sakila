--\echo 'Sakila(semantic)'
--\echo 'Programación para Ciencia de Datos'

SET search_path = semantic,public;

drop table if exists semantic.entities;

create table if not exists semantic.entities as (
	select customer,
		first_name,
		last_name, 
		active,
		store,
		city_name,
		country_name
	from cleaned.customers c
		join cleaned.addresses a using(address)
		join cleaned.cities ci using(city)
		join cleaned.countries co using(country)
);

create index semantic_entities_customer_ix on semantic.entities(customer);

drop type if exists event_type cascade;
	create type event_type as enum (
                'rent',  'return');
  
  
drop table if exists semantic.events;
create table if not exists semantic.events (
	event serial,
	customer integer,
    type event_type,
    date date,
    attributes jsonb
  );

insert into semantic.events (customer, type, date, attributes)
	(
		select cu.customer,
			'rent'::event_type,
			date(rental_date) as rental_date,
			json_build_object(
				'title',title,
				'category', name, 
				'store',cu.store,
				'rental_rate',rental_rate,
				'replacement_cost', replacement_cost,
				'rating', rating,
				'amount', amount) as attributes
		from  cleaned.customers cu 
			join cleaned.rentals r using(customer)
			join cleaned.inventories i on r.inventory = i.inventory
			join cleaned.films f on i.film = f.film
			join cleaned.films_categories fc on f.film = fc.film
			join cleaned.categories c on fc.category =c.category
			join cleaned.payments p on r.rental = p.rental
	)
	union all
	(
		select cu.customer,
			'return'::event_type,
			date(return_date) as return_date,
			json_build_object(
				'title',title,
				'category', name, 
				'store',cu.store,
				'rental_rate',rental_rate,
				'replacement_cost', replacement_cost,
				'rating', rating,
				'amount', amount) as attributes
		from  cleaned.customers cu 
			join cleaned.rentals r using(customer)
			join cleaned.inventories i on r.inventory = i.inventory
			join cleaned.films f on i.film = f.film
			join cleaned.films_categories fc on f.film = fc.film
			join cleaned.categories c on fc.category =c.category
			join cleaned.payments p on r.rental = p.rental
	);

create index semantic_events_event_ix on semantic.events(event);
create index semantic_events_customer_ix on semantic.events(customer);




