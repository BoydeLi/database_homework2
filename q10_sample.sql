with SelectSet as (
	select ProductName as Name, Product.Id AS id
	from Product 
                where Id in 
		(select distinct(ProductId) from OrderDetail where OrderId in (select Id from 'Order' where CustomerId in 
		(select Id from Customer where CompanyName = "Queen Cozinha")  and OrderDate like "2014-12-25%")
		) 
	order by Id asc
),
sort_it as (
	select row_number() over (order by SelectSet.id asc) as seqnum, SelectSet.name as name
	from SelectSet
),
ans as (
	select seqnum, name
	from sort_it
	where seqnum = 1
	union all
	select sort_it.seqnum, newSeg.name || ', ' || sort_it.name
	from sort_it join
		ans as newSeg on sort_it.seqnum = newSeg.seqnum + 1
)
select name from ans order by seqnum desc limit 1;