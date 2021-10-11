select ifnull(CompanyName,"MISSING_NAME"),CustomerId ,totalEx
from(select *,ntile(4) over (order by totalEx) number from
(select id as CustomerId,CompanyName from Customer union
select CustomerId,NULL as CompanyName from [Order] where CustomerId not in (select id as CustomerId from Customer)) natural join (select CustomerId,sum(UnitPrice*Quantity) as totalEx from ((select id,CustomerId from [Order]) join (select OrderId,UnitPrice,Quantity from OrderDetail) on id=OrderId)
Group by CustomerId))
Where number=1;
