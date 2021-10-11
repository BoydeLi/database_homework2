select CompanyName,percentage
from (select ShipVia,round((count_x/count_total)*100,2) as percentage from (select ShipVia,cast(count(*) as float) as count_x from (select ShipVia from [Order] where ShippedDate > RequiredDate) group by ShipVia) natural join (select ShipVia,cast(count(*) as float) as count_total from [Order] group by ShipVia))inner join Shipper on ShipVia=id
order by percentage desc;