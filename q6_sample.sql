select ProductName,CompanyName,ContactName 
from (((select ProductName,id,Discontinued from Product where Discontinued=1) join (select ProductId,OrderId from OrderDetail) on id=ProductId) join (select id as O_id,CustomerId,OrderDate from [Order]) on O_id = OrderId) join (select id as C_id,CompanyName,ContactName from Customer) on CustomerId=C_id
where OrderDate in (select min(OrderDate) from ((select ProductName,id,Discontinued from Product where Discontinued=1) join (select ProductId,OrderId from OrderDetail) on id=ProductId) join (select id as O_id,CustomerId,OrderDate from [Order]) on O_id = OrderId
group by ProductName)
order by ProductName;
