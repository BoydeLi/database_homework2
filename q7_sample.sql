select id,OrderDate,previousDate,round(julianday(OrderDate)-julianday(previousDate),2)
from (select id,OrderDate,lag(OrderDate,1,OrderDate) over (partition by CustomerId order by OrderDate) as previousDate from [Order] where CustomerId="BLONP" limit 10);
