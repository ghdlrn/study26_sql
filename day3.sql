-- group by : 지정한 열 기준으로 그룹화하여 집계함수 적용(count, sum,avg,max,min)
-- group by에서 조건을 줄 때는 having절 

select district, count(*)
from address
group by district;

select *
from film;

select rating, count(*)
from film
group by rating;

select special_features, count(*)
from film
group by special_features;

select rating, special_features, count(*)
from film
group by rating, special_features;

select rating, sum(length)
from film
group by rating;


select staff_id, count(*), max(amount), min(amount) 
from payment
group by staff_id;

select rating, sum(length)
from film
group by rating;

select rating, special_features, count(length)
from film
group by rating, special_features;

select rating, special_features, count(length) as 갯수
from film
group by rating, special_features
having 갯수 >=15;   --  having count(length) >=15;

select rating, special_features, count(length) as 갯수
from film
group by rating, special_features
having 갯수 >=15
order by rating; 

-- union(합집합,중복X), union all(합집합,중복O), minus(차집합), intersect(교집합)

select special_features, count(*)
from film
group by special_features;

select rating , special_features ,title
from film
where special_features = 'Trailers'
union 
select rating , special_features ,title
from film
where rating = 'G';


select count(*)
from film
where rating = 'G';
select count(*)
from film
where special_features = 'Trailers';



select first_name, last_name, age, height from actor
where actor.name = 'A'
union  -- union all
select first_name, last_name, age, height from actor
where actor.name = 'B';

-- join 

select *
from address
order by city_id;

select *
from city;

-- 동등조인(equi join), 내부조인
select city.city_id, city, address
from city, address
where city.city_id  = address.city_id;

select city.city_id, city.city, address.address
from city, address
where city.city_id  = address.city_id;


select c.city_id, c.city, a.address
from city as c, address a
where c.city_id  = a.city_id;

select c.city_id, c.city, a.address
from city as c join address a
on c.city_id  = a.city_id;

select c.city_id, c.city, a.address,district
from city as c inner join address a
on c.city_id  = a.city_id
where district = 'Texas';

-- 외부조인(Outer Join)

-- left join => 왼쪽 테이블에서 값을 가져오고 오른쪽 테이블에서는 공통열만 가져옴
-- right join => 오른쪽 테이블에서 값을 가져오고 왼쪽 테이블에서는 공통열만 가져옴
select first_name, last_name , address
from customer c join address a
on c.address_id = a.address_id   
order by first_name;    -- inner join

select first_name, last_name , address
from customer c left outer join address a
on c.address_id = a.address_id   
order by first_name;    -- left outer join

select * from address order by address_id desc;
select * from customer order by address_id desc;

select first_name, last_name , address
from customer c right outer join address a
on c.address_id = a.address_id   
order by first_name;    -- left outer join



select * from customer;
select * from payment;

-- 문제1 : customer 테이블과 payment 테이블을 조인하여 각 고객이 
-- 지불한 총액(amount)를 확인
select c.customer_id, amount
from customer c join payment p
on c.customer_id = p.customer_id;

select c.customer_id, amount
from customer c , payment p
where c.customer_id = p.customer_id;

select c.customer_id, sum(amount)
from customer c join payment p
on c.customer_id = p.customer_id
group by c.customer_id;

-- 문제2 : file테이블과 inventory테이블을 조인하여 각 영화의 재고 수를 확인한다.
select * from inventory;
select * from film;

select f.title , count(f.title) as 재고수
from film f join inventory i
on f.film_id = i.film_id
group by f.title;

-- 문제3 : film_actor, actor , film 테이블을 조인하여 특정배우가 출연한 영화 목록을 출력
select * from actor;
select * from film_actor;
select * from film;

select a.actor_id, concat(a.first_name, ' ', a.last_name) name, fa.film_id
	, f.title
from actor a 
join 
	film_actor fa on a.actor_id = fa.actor_id
join 
	film f on fa.film_id = f.film_id
order by actor_id;

    
-- order by a.actor_id asc, f.title asc;



