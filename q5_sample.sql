select CategoryId,CategoryName,sumOfProduct,Uavg,Umin,Umax,Usum 
from ((select CategoryId,round(avg(UnitPrice),2) as Uavg, min(UnitPrice) as Umin,max(UnitPrice) as Umax ,sum(UnitsOnOrder) as Usum from Product group by CategoryId) natural join (select CategoryId,sumOfProduct from (select CategoryId,count(*) as sumOfProduct from Product group by CategoryId) where sumOfProduct>10)) join (select id, CategoryName from Category) on id=CategoryId
order by CategoryId;
