--First we combine all the three sheets

with hotels as (

select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
--1. Query for calculation Revenue Year Wise

--SELECT
--hotels.arrival_date_year,
--ROUND(SUM((hotels.stays_in_weekend_nights + hotels.stays_in_week_nights)
--* hotels.adr*(1-[dbo].[market_segment$].Discount)), 2) 
--AS Revenue,
--SUM(round(SUM((hotels.stays_in_weekend_nights + hotels.stays_in_week_nights)
--* hotels.adr*(1-[dbo].[market_segment$].Discount)),2))
--OVER (ORDER BY hotels.arrival_date_year) AS Running_revenue
--FROM
--hotels
--inner join 
--[dbo].[market_segment$]
--on hotels.[market_segment]=
--[dbo].[market_segment$].market_segment
--where hotels.reservation_status not like 'Canceled'
--GROUP BY
--hotels.arrival_date_year
--ORDER BY
--hotels.arrival_date_year;



--2. Query for calculation Number of People visiting the Hotel
--select 
--hotels.arrival_date_year,
--hotels.arrival_date_month,
--hotels.hotel
--,sum(hotels.adults +hotels.children+hotels.babies) as Visiters
--from hotels
--where  hotels.reservation_status not like 'Canceled'
--GROUP BY  
--hotels.arrival_date_year,
--hotels.arrival_date_month,
--hotels.hotel
--ORDER BY
--hotels.arrival_date_year,
--hotels.arrival_date_month,
--hotels.hotel



--3. Query for calculation Number of Parking Space Used/Required

select hotels.arrival_date_year,
hotels.hotel,
sum(hotels.[required_car_parking_spaces]) as Parking
from hotels
where  hotels.reservation_status not like 'Canceled'
GROUP BY  
hotels.arrival_date_year,
hotels.hotel
ORDER BY
hotels.arrival_date_year,
hotels.hotel