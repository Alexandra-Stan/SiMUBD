/*×ÀÑÒÜ 1*/
use [MilitaryReg(lr3)];

drop table if exists TypeOfTroop;
create table TypeOfTroop
(
	IdTypeOfTroop int IDENTITY (1,1) primary key NOT null,
    TypeOfTroop varchar(50) NOT null
);

drop table if exists PlaceOfLocation;
create table PlaceOfLocation
(
	IdOfPlace int IDENTITY (1,1)  primary key NOT null,
    Country varchar(250) NOT null,
	City varchar(250)NOT null,
	Adres varchar(250)NOT null,
	Area int,
	NumerousStructures int


);

drop table if exists Base;
create table Base
(
	IdOfBase int IDENTITY (1,1) primary key NOT null,
    IdOfPlace int unique foreign key references PlaceOfLocation (IdOfPlace) on update cascade on delete cascade NOT null,
	IdTypeOfTroop int foreign key references TypeOfTroop (IdTypeOfTroop) on update cascade on delete cascade NOT null,
	NumberOfCompanys int,
	NumberOfTechnique int,
	NumberOfWeapons int
	

);

drop table if exists Weapons;
create table Weapons
(
	IdOfWeapon int IDENTITY (1,1) primary key NOT null,
    IdOfBase int foreign key references Base (IdOfBase) on update cascade on delete cascade NOT null,
	NameOfWeapon varchar(250) NOT null,
	Ñharacteristics varchar(250)
	

);

drop table if exists Technique;
create table Technique
(
	IdTechnique int IDENTITY (1,1) primary key NOT null,
	IdOfBase int foreign key references Base (IdOfBase) on update cascade on delete cascade NOT null,
	Ñharacteristics varchar(250),

);





