
create database myntra;
use myntra;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

CREATE TABLE prd_details (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    img TEXT,
    asin VARCHAR(50),
    price INT,
    mrp INT,
    rating DECIMAL(2,1),
    ratingTotal INT,
    discount INT,
    seller VARCHAR(100),
    purl TEXT
);


-- Q1) Which sellers are offering high discounts but getting low customer engagement (ratingTotal)?
select seller, count(*) as product_count, round(avg(discount), 2) as avg_discount,
round(avg(ratingtotal), 2) as avg_rating_total
from prd_details
group by seller
order by product_count desc
limit 5;


-- Q2) Which sellers are pricing their products significantly above average for their category but 
-- receiving below-average engagement?
with market_avg as (
  select round(avg(price), 2) as avg_price,
         round(avg(ratingtotal), 2) as avg_engagement
  from prd_details
),
overpriced_low_engaged as (
  select seller,
         count(*) as product_count,
         round(avg(price), 2) as avg_seller_price,
         round(avg(ratingtotal), 2) as avg_seller_engagement
  from prd_details
  group by seller
)
select seller, product_count, avg_seller_price, avg_seller_engagement
from overpriced_low_engaged, market_avg
where avg_seller_price > avg_price
  and avg_seller_engagement < avg_engagement
order by avg_seller_price desc
limit 5;


-- Q3) Which discount ranges generate the highest customer engagement (rating total)?
select 
  case 
    when discount between 0 and 20 then '0-20%'
    when discount between 21 and 40 then '21-40%'
    when discount between 41 and 60 then '41-60%'
    else '60%+'
  end as discount_range,
  round(avg(ratingtotal), 2) as avg_rating_total
from prd_details
group by discount_range
order by avg_rating_total desc;

-- Q4)Which sellers consistently offer highly rated products?
select 
  seller,
  count(*) as total_products,
  round(avg(rating), 2) as avg_rating,
  sum(ratingtotal) as total_ratings
from prd_details
group by seller
having count(*) > 100
order by avg_rating desc, total_products desc
limit 5;

-- Q5)Which price segments receive the most customer engagement (rating total)?
select 
  case 
    when price < 300 then '<300'
    when price between 300 and 500 then '300-500'
    when price between 501 and 800 then '501-800'
    else '>800'
  end as price_range,
  round(avg(ratingtotal), 2) as avg_rating_total
from prd_details
group by price_range
order by avg_rating_total desc;

-- Q6)How does product rating correlate with number of ratings?
select rating, count(*) as total_products,
round(avg(ratingtotal), 2) as avg_ratings_per_product,
sum(ratingtotal) as total_ratings_given
from prd_details
where rating is not null and ratingtotal is not null
group by rating
order by avg_ratings_per_product desc
limit 5;

-- Q7)Which product is the top-performing one for each seller, based on the highest rating and highest engagement?
with top_ratings as 
(select seller, max(rating) as max_rating
from prd_details
group by seller),

top_products as 
(select p.*
from prd_details p
join top_ratings tr
on p.seller = tr.seller and p.rating = tr.max_rating)

select id, name, price, mrp, discount, round(rating, 2) as rating, ratingtotal, seller
from (select *,
row_number() over (partition by seller order by ratingtotal desc) as rn
from top_products) ranked
where rn = 1
order by ratingtotal desc
limit 5;

-- Q8) Are product discounts aligned with actual MRP-to-price drops?
select id, mrp, price, (mrp - price) as actual_price_drop, discount
from prd_details
where mrp > price
limit 5;

-- Q9) Which sellers have the most products listed on Myntra?
select seller, count(*) as total_products
from prd_details
group by seller
order by total_products desc
limit 10;

-- Q10) Which products are both heavily discounted and highly rated?
with ranked_products as 
(select *,
row_number() over (partition by name order by ratingtotal desc, rating desc) as rn
from prd_details
where discount >= 50 and rating >= 4.2 and ratingtotal > 3000)

select id, name, price, mrp, discount, round(rating, 2) as rating, ratingtotal, seller
from ranked_products
where rn = 1
order by ratingtotal desc
limit 20;






