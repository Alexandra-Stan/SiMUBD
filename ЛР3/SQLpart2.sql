/*×ÀÑÒÜ 2*/
use [MilitaryReg(lr3)]
/*1*/
select * from Base 
where NumberOfCompanys = 11;
select * from Technique 
where Ñharacteristics = 'Black';
select * from PlaceOfLocation 
where Country = 'Italy';
/*2*/
select * from Base 
where NumberOfCompanys=11 and NumberOfTechnique=111;
select * from Technique
where Ñharacteristics = 'Black' or Ñharacteristics = 'White';
select * from PlaceOfLocation 
where not Country='USA';
/*3*/
select * from Base 
where not NumberOfCompanys=11 and not NumberOfWeapons=1111;
select * from Technique 
where  Ñharacteristics = 'Black' and (IdOfBase=3 or IdOfBase=4);
/*4*/
select IdOfBase,NumberOfWeapons + NumberOfTechnique as 'All'
from Base
where NumberOfWeapons + NumberOfTechnique > 2000;
select IdOfBase,NumberOfWeapons + NumberOfCompanys as 'All'
from Base
where NumberOfWeapons + NumberOfCompanys < 40;
/*5*/
select * from Base 
where NumberOfCompanys in ('11','22');
select * from Base 
where NumberOfWeapons in ('1111','3333', '4444');

/*6*/
select * from Base 
where NumberOfWeapons between 1000 and 4000;
select * from Base 
where NumberOfCompanys between 10 and 40;
/*7*/
select * from PlaceOfLocation
where upper(Country) like 'B%';
select * from PlaceOfLocation 
where lower(City) like 'm%';
/*8*/
select * from PlaceOfLocation
where City is not null;
select * from PlaceOfLocation 
where Area is null;
select * from 914301
where  surname!= 'Ñòàíêóñ' and surname!=''