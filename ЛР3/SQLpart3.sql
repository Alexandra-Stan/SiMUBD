/*×ÀÑÒÜ 3*/
/*1*/
select Base.NumberOfWeapons,Weapons.NameOfWeapon from Base,Weapons; 
select Base.NumberOfTechnique,Technique.Ñharacteristics from Base,Technique; 
/*2*/
select * from  Base, PlaceOfLocation
where Base.IdOfPlace = PlaceOfLocation.IdOfPlace;
select * from Base, TypeOfTroop
where Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
select * from Base, Weapons
where Base.IdOfBase = Weapons.IdOfBase;
/*3*/
select * from  Base, PlaceOfLocation
where Base.IdOfPlace = PlaceOfLocation.IdOfPlace and PlaceOfLocation.City = 'Minsk' ;
select * from Base, TypeOfTroop
where Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop and not TypeOfTroop.TypeOfTroop = 'Tank forces';
/*4*/
select * from  Base, PlaceOfLocation, TypeOfTroop
where Base.IdOfPlace = PlaceOfLocation.IdOfPlace and
Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
select * from  Base, PlaceOfLocation, Technique
where Base.IdOfPlace = PlaceOfLocation.IdOfPlace and
Base.IdOfBase = Technique.IdOfBase;
/*5*/
select * from Base  join TypeOfTroop
on Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
/*6*/
use [MilitaryReg(lr3)]
select * from Base left join TypeOfTroop
on Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
select * from  Base left join PlaceOfLocation
on Base.IdOfPlace = PlaceOfLocation.IdOfPlace 
/*7*/
select * from Base right join TypeOfTroop
on Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
select * from  Base right join PlaceOfLocation
on Base.IdOfPlace = PlaceOfLocation.IdOfPlace;
/*8*/
select * from Base full outer join TypeOfTroop
on Base.IdTypeOfTroop = TypeOfTroop.IdTypeOfTroop;
select * from  Base full outer join PlaceOfLocation
on Base.IdOfPlace = PlaceOfLocation.IdOfPlace;
