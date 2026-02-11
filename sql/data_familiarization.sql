-- Data Familiarization
-- Get familiar with each table in the analytics practice database

-- 1) Familiarize with each table, grain, fields, colummn stats
-- 2) Check for uniqueness of primary key fields

--
-- 1A) raw.customers
--
select * from 
"raw.customers"
limit 10;
-- Fields include CustomerID(primary key), name, gender, birthdate, city, and join date

-- Number of records? --> 200
select count(*)
from "raw.customers";

--Number of distinct CustomerIds? 200
select count(distinct("CustomerID"))
from "raw.customers";

-- 2A) Double check that all CustomerIDs are unique --> YES
select count("CustomerID") / count(distinct("CustomerID")) as uniq_custid_ratio
from "raw.customers";


---
--- 1B)raw.products
---
select *
from "raw.products"
limit 10;
-- Fields include Product id, name, categories
-- Unitprice is sale price
-- CostPrice is cost to company
-- How many unique products?

-- are proudct IDS all unique? -->YES
select count("ProductID")/count(distinct("ProductID")) as uniq_prodid_ratio
from "raw.products";

-- are all product names unique? --> YES
select count("ProductName")/count(distinct("ProductName")) as uniq_prodname_ratio
from "raw.products";

-- What types of products do they sell?
-- Electronics, fashion and groceries
select distinct("Category")
from "raw.products";

-- subcategories?
select distinct("SubCategory")
from "raw.products";

-- which category is the most expensive for customers on average & 
-- which has the greatest margin?
select "Category",
		round(avg("UnitPrice")::numeric,2) as avg_unit_price,
		round(stddev("UnitPrice")::numeric,2) as stdv_unit_price,
		round(avg("UnitPrice"- "CostPrice")::numeric,2) as margin
from "raw.products"
group by("Category")
order by avg_unit_price desc;
-- Electronics have the greatest unit price and the greatest margin. 
-- Is that fashion price right?
select * 
from "raw.products"
where "Category" = 'Fashion';
-- Yes, this is fake data or they sell high end stuff. 


