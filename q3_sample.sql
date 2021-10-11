select id,ShipCountry,newSeg 
from (select * from (select *,"northAmerica" as newSeg from [Order] where ShipCountry in (select distinct ShipCountry from [Order] where ShipCountry like '%USA%' or ShipCountry like '%Canada%' or ShipCountry like '%Mexico%') union select *,"otherplace" as newSeg from [Order] where ShipCountry not in (select distinct ShipCountry from [Order] where ShipCountry like '%USA%' or ShipCountry like '%Canada%' or ShipCountry like '%Mexico%')) order by id)
where id>15444 limit 20;
