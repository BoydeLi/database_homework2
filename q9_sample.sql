select distinct FirstName,LastName,RegionDescription,BirthDate
from (((select id,FirstName,LastName,BirthDate from Employee where BirthDate in (select min(BirthDate) from Employee group by Region)) join (select EmployeeId,TerritoryId from EmployeeTerritory) on id = EmployeeId) join (select id as T_Id,RegionId from Territory) on T_Id=TerritoryId) join (select id as R_Id, RegionDescription from Region) on R_Id = RegionId
order by RegionId;