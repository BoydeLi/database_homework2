select distinct ShipName,substring(ShipName,1,instr(ShipName,'-')-1)
from [Order]
where ShipName in (select distinct ShipName from [Order] where ShipName like '%-%')
order by ShipName;
