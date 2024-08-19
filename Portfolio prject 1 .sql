use cars;

-- portfolio project -- 
-- read data --
SELECT *
FROM car_dekho;

--  Total cars : to get a count of total records -- 
SELECT count(*)
FROM car_dekho           # 7927

-- The Manager asked the employee How many cars will be available in 2023 ? -- 
SELECT count(*)
FROM  car_dekho
WHERE year = 2023          # 6

-- The Manager  asked the employee How many cars will be available in 2020,2021,2022 --  
SELECT count(*)
FROM car_dekho 
WHERE year = 2020 ;        # 74

SELECT count(*)
FROM car_dekho 
WHERE year = 2021 ;       # 7

SELECT count(*)
FROM car_dekho 
WHERE year = 2022 ;        # 7 

-- or (group by) --  
SELECT year,count(*) 
FROM car_dekho 
WHERE year IN (2020,2021,2022)
group by year 
order by year ;                     

--  Clint asked me to print the total of all cars by year.I don't see all the details ........
SELECT year,count(*)
FROM car_dekho
group by year 
order by year desc;

-- Clint asked to car delar agent how many dissel cars will there be in 2020 ? -- 
SELECT count(*)
FROM car_dekho 
WHERE year =2020 and fuel = 'Diesel'           # 20


-- Clint requested a car  delar agent How many Petrol cars will there be in 2020 ? -- 
SELECT count(*)
FROM car_dekho 
WHERE year =2020 and fuel = 'Petrol'     # 51

-- The manager told the employee to give a print all the fuel cars (petrol,diesel,and CNG) come by all years -- 

SELECT  year,count(*)
FROM car_dekho 
WHERE  fuel = "Petrol"
group by year 

SELECT  year,count(*)
FROM car_dekho 
WHERE  fuel = "Diesel"
group by year 

SELECT  year,count(*)
FROM car_dekho 
WHERE  fuel = 'CNG'
group by year 

-- Manager said there were more than 100 cars in a given year,which year had more than 100 cars?

SELECT year,count(*)
FROM car_dekho 
group by year 
HAVING count(*) > 100 ;


-- Manager said there were less than 50 cars in a given year,which year had less than 50 cars?

SELECT year, count(*)
FROM car_dekho
group by year 
HAVING count(*) < 50 

--  The Manager  said to the employee all cars count details between 2015 and 2023 ; we need to complete list --

SELECT  count(*)
FROM car_dekho
WHERE year  between 2015 and 2023  # 4124 


-- The manager said to the employee  All cars details between 2015 to 2023 we need complete list-- 
SELECT *
FROM car_dekho
WHERE year  between 2015 and 2023;

-- END--