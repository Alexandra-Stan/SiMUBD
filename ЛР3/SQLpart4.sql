/*×ÀÑÒÜ 4*/
/*1*/
SELECT COUNT(*) AS "Count base"
FROM	Base;
SELECT COUNT(*) AS "Count weapons"
FROM	Weapons;
/*2*/
SELECT SUM(NumberOfCompanys) AS 'All companys'
FROM Base;
SELECT SUM(NumberOfWeapons) AS 'All weapons'
FROM Base;
/*3*/
select upper(Country) as'COUNTRY' from PlaceOfLocation;
select lower(City)as 'city' from PlaceOfLocation ;
/*4*/
select getdate() as 'date';
SELECT DAY(GETDATE()) as 'day';
SELECT MONTH(GETDATE()) as 'month'; 
/*5*/
   SELECT City
   FROM PlaceOfLocation
   GROUP BY city;
SELECT Country
   FROM PlaceOfLocation
   GROUP BY Country;
/*6*/
SELECT City,Country
   FROM PlaceOfLocation
   GROUP BY Country, City;
SELECT NumberOfTechnique,NumberOfWeapons
   FROM Base
   GROUP BY NumberOfTechnique,NumberOfWeapons;
 /*7*/
SELECT Country, COUNT(Country) FROM PlaceOfLocation
WHERE Area > 4 
GROUP BY Country
HAVING COUNT(Country) > 0;
SELECT City, COUNT(City) FROM PlaceOfLocation
WHERE Area > 4 
GROUP BY City
HAVING COUNT(City )> 0;
/*8*/
SELECT avg(Area) as 'Av area' FROM PlaceOfLocation
WHERE Country = 'Belarus';
SELECT avg(Area) as 'Av area' FROM PlaceOfLocation
WHERE Country = 'USA';
/*9*/
use [MilitaryReg(lr3)]
select *
   from PlaceOfLocation
   order by Country desc;
 select *
   from PlaceOfLocation
   order by Country ;
/*10*/
insert into TypeOfTroop(
TypeOfTroop) values ('test')
select * from TypeOfTroop;
insert into TypeOfTroop(
TypeOfTroop) values ('test2')
select * from TypeOfTroop;
/*11*/
update TypeOfTroop
set TypeOfTroop='again' where IdTypeOfTroop = 8;
select * from TypeOfTroop;
update TypeOfTroop
set TypeOfTroop='again2' where IdTypeOfTroop = 7;
select * from TypeOfTroop;
/*12*/
update TypeOfTroop
set TypeOfTroop='again' where IdTypeOfTroop = 8;
select * from TypeOfTroop;
update TypeOfTroop
set TypeOfTroop='again2' where IdTypeOfTroop = 7;
select * from TypeOfTroop;
/*13*/
use [MilitaryReg(lr3)]
delete from TypeOfTroop
where IdTypeOfTroop=7;
select * from TypeOfTroop;
delete from TypeOfTroop
where IdTypeOfTroop=8;
select * from TypeOfTroop;