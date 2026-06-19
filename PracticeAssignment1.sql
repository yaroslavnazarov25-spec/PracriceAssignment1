 --CTE для усунення необхідності об'єднання усіх таблиць повторно
with shop_system as(
	select*
	from shops s
	left join warehouses w 
	on s.shopid  = w.shopid
	left join products p
	on w.warehouseid   = p.warehouseid  
	left join clients c 
	on s.shopid  = c.shopid 
	left join orders o
	on c.clientid = o.clientid 
)
--дивимся потрібну інформацію у конкретному місті та країні у тих магазинах, об'єм складу яких більший за 10000
select s.country as shop_country,
	s.city as shop_city, 
	avg(s.capacity) as average_city_warehouses_capacity,
	avg(s.quantity) as average_order_size,
	max(s.quantity) as max_order_size
from shop_system s
where s.capacity >10000
group by 1,2 

--об'єднуємо дві таблиці без повторень
union all 

--дивимся потрібну інформацію у конкретному місті та країні у тих магазинах, об'єм складу яких менший за 4000
select s2.country as shop_country,
	s2.city as shop_city, 
	avg(s2.capacity) as average_city_warehouses_capacity,
	avg(s2.quantity) as average_order_size,
	max(s2.quantity) as max_order_size
from shop_system s2
where s2.capacity <5000
group by 1,2
order by 1 desc