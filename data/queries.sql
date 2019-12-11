# Interesting SQL queries by using PostgreSQL syntax:


# Number of films by store
with films as (
	select store, film, count(*) as number_films from cleaned.inventories 
	group by store,film)
select store,number_films,count(*) as films from films
group by store,number_films
order by store,count(*);


# Number of rental per day
select date(rental_date) as rental_date, count(*) as number_of_rentals from cleaned.rentals 
group by date(rental_date) 
order by date(rental_date); 

# Number of returns by day
select date(return_date) as return_date, count(*) as number_of_returns from cleaned.rentals 
group by date(return_date) 
order by date(return_date); 

# Rentals and returns
with rentals as (
	select date(rental_date) as rental_date, 
		count(*) as number_of_rentals 
	from cleaned.rentals 
	group by date(rental_date) ),
	 returns as (
	select date(return_date) as return_date, 
		count(*) as number_of_returns 
	from cleaned.rentals 
	group by date(return_date) )
select rental_date, number_of_rentals, number_of_returns
	from rentals r
	left join returns t on r.rental_date = t.return_date
	order by r.rental_date;


# Information of films and rental rates 
select cu.customer,
	title,name as category, cu.store,
	rental_rate,
	replacement_cost,
	rating,
	date(rental_date) as rental_date,
	date(return_date) as return_date,
	amount
from  cleaned.customers cu 
	join cleaned.rentals r using(customer)
	join cleaned.inventories i on r.inventory = i.inventory
	join cleaned.films f on i.film = f.film
	join cleaned.films_categories fc on f.film = fc.film
	join cleaned.categories c on fc.category =c.category
	join cleaned.payments p on r.rental = p.rental
where amount = replacement_cost
order by rental_date
limit 10;

# Customer information

select first_name,last_name, 
	active,
	city_name,
	country_name
from cleaned.customers c
join cleaned.addresses a using(address)
join cleaned.cities ci using(city)
join cleaned.countries co using(country);