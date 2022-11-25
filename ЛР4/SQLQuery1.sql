/*ЧАСТЬ1*/
use [MilitaryReg(lr3)];
/*1*/
   /*1.1*/
DECLARE @characteristics TABLE
(
id INT Identity (1,1) not null,	
description CHAR (255) NOT NULL
)
INSERT @characteristics 
SELECT Сharacteristics FROM Weapons SELECT * FROM  @characteristics;
  /*1.2*/
DECLARE @a INT 
DECLARE @str CHAR(50)
SET @a = (SELECT COUNT(*) FROM Weapons) 
IF @a > 4 BEGIN
SET @str = 'Количество вооружений больше 4' SELECT @str
END ELSE BEGIN
SET @str = 'Количество вооружений =' + str(@a) SELECT @str
END
DECLARE @b INT 
DECLARE @str2 CHAR(50)
SET @b = (SELECT COUNT(*) FROM Technique) 
IF @b > 4 BEGIN
SET @str2 = 'Количество техники больше 4' SELECT @str2
END ELSE BEGIN
SET @str2 = 'Количество техники =' + str(@b) SELECT @str2
END

  /*1.3*/
 DECLARE @с INT SET @с = 1 WHILE @с <100
BEGIN
PRINT @с 
IF (@с>40) AND (@с<50)
BREAK 
ELSE
SET @с = @с+rand()*10 
CONTINUE
END
 PRINT @с

  DECLARE @d INT SET @d = 1 WHILE @d <10
BEGIN
PRINT @d 
IF (@d>4) AND (@d<6)
BREAK 
ELSE
SET @d = @d+rand()*10 
CONTINUE
END
 PRINT @d

   /*1.4*/

IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

GO
CREATE FUNCTION dbo.ISOweek (@NUMBER INT) RETURNS CHAR(150)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(150); 
SET @man= @NUMBER

IF (@man<=10) SET @ISOweek='Число меньше или равно 10'; 
IF (@man>10 AND @man<30) SET @ISOweek='Число в диапозоне от 10 до 30';
IF (@man>=30) SET @ISOweek='Число больше или равно 30';
RETURN(@ISOweek); 
END;
GO
SET DATEFIRST 1;
SELECT dbo.ISOweek(10) AS 'Число';

  /*1.5*/
 IF OBJECT_ID (N'ufn_SalesByStore', N'IF') IS NOT NULL
DROP FUNCTION db_owner.ufn_SalesByStore; 
GO
CREATE FUNCTION db_owner.ufn_SalesByStore(@id int) RETURNS TABLE
AS RETURN (
SELECT t.Country AS 'Страна', t.City AS 'Город', SUM(d.NumberOfCompanys + d.NumberOfTechnique+d.NumberOfWeapons) AS 'Все'
FROM Base d, PlaceOfLocation t
WHERE d.IdOfBase =t.IdOfPlace and d.NumberOfCompanys>@id
GROUP BY t.Country,t.City
);

GO
SELECT * from db_owner.ufn_SalesByStore(10);

  /*1.6*/
DROP PROCEDURE IF EXISTS Count_Country;
go

CREATE PROCEDURE Count_Country
AS
Select count(Country) AS 'Количество стран' from PlaceOfLocation
where Country='test' 
Go

DROP PROCEDURE IF EXISTS Count_Big_Place;
go

CREATE PROCEDURE Count_Big_Place
AS
Select count(Country) AS 'Количество стран с большей площадью' from PlaceOfLocation
where Area>100 
Go

EXECUTE Count_Country
EXECUTE Count_Big_Place

 /*1.7*/
DROP PROCEDURE IF EXISTS Count_Country_Area;
go

CREATE PROCEDURE Count_Country_Area @area int
AS
Select count(Country) AS 'Количество стран' from PlaceOfLocation
where Country='test' and Area>=@area
Go

DROP PROCEDURE IF EXISTS Count_Base;
go

CREATE PROCEDURE Count_Base @number as Int
AS
Select count(IdOfBase) from Base
WHERE IdTypeOfTroop ='1' and NumberOfCompanys>=@number
Go

EXEC Count_Country_Area 6
EXEC Count_Base 10
 
 /*1.8*/
 DROP PROCEDURE IF EXISTS Check_Country;

GO
CREATE PROCEDURE Check_Country @param int AS
IF (SELECT Country FROM PlaceOfLocation WHERE IdOfPlace = @param)
= 'USA'
RETURN 1 ELSE RETURN 2
DECLARE @return_status int
EXECUTE @return_status = Check_Country 3 SELECT 'Return Status' = @return_status 

DROP PROCEDURE IF EXISTS Check_Number;

GO
CREATE PROCEDURE Check_Number @param int AS
IF (SELECT NumberOfCompanys FROM Base WHERE IdOfBase = @param)
= '11'
RETURN 1 ELSE RETURN 2
DECLARE @return_status int
EXECUTE @return_status = Check_Number 4 SELECT 'Return Status' = @return_status
 
 /*1.9*/
 DROP PROC IF EXISTS Update_Base

GO
CREATE PROC Update_Base AS
UPDATE Base SET NumberOfTechnique = NumberOfCompanys+10

DROP PROC IF EXISTS uUpdate_Base2
GO
CREATE PROC Update_Base2 AS
UPDATE Base SET NumberOfTechnique = NumberOfTechnique-10

EXEC Update_Base
EXEC Update_Base2

 /*1.10*/

DROP PROC IF EXISTS Select_Country

go
CREATE PROC Select_Country @e CHAR(250) AS
SELECT * FROM PlaceOfLocation WHERE Country= @e

DROP PROC IF EXISTS Select_City

go
CREATE PROC Select_City @e char (250) AS
SELECT * FROM PlaceOfLocation WHERE City= @e

EXEC Select_Country 'Belarus'

EXEC Select_City 'Minsk';

/*ЧАСТЬ2*/
  /*1*/
 drop function if exists Calculator
go
CREATE FUNCTION Calculator(@Opd1 bigint, @Opd2 bigint, @Oprt char (1) = '*') 
RETURNS bigint
AS BEGIN
DECLARE @Result bigint SET @Result =
CASE @Oprt
WHEN '+' THEN @Opd1 + @Opd2 
WHEN '-' THEN @Opd1 - @Opd2
WHEN '*' THEN @Opd1 * @Opd2 
WHEN '/' THEN @Opd1 / @Opd2 ELSE 0
END
Return @Result END
use [MilitaryReg(lr3)];
SELECT dbo.Calculator(4,5, '+') AS '+', dbo.Calculator(3,7, '*') - dbo.Calculator(64,4,'/')*2 AS 'Итог'

/*2*/
DROP FUNCTION IF EXISTS DYNTAB

go
CREATE FUNCTION DYNTAB (@State char(10))
RETURNS Table AS
RETURN SELECT City, Country, Adres FROM PlaceOfLocation WHERE Country = @state

SELECT * FROM DYNTAB ('Belarus')
ORDER BY City, Country, Adres

/*3*/

DROP FUNCTION IF EXISTS ParseStr
go
CREATE FUNCTION ParseStr (@String varchar (500))
RETURNS @tab1 TABLE
(
	Number int IDENTITY (1,1) NOT NULL,
	Substr nvarchar (30)
) AS
BEGIN
	DECLARE @Str1 varchar (500), @Pos int 
	SET @Str1 = @String
	WHILE 1 > 0 
	BEGIN
		SET @Pos = CHARINDEX(' ', @Str1) 
		IF @POS > 0
		BEGIN
			INSERT INTO @tab1
			VALUES (SUBSTRING (@Str1, 1, @Pos)) 

			set @Str1 = (SUBSTRING (@Str1, @Pos + 1, 500))
		END
		ELSE 
		BEGIN
			INSERT INTO @tab1 VALUES (@Str1)
			BREAK
		END 
	END 
	RETURN 
END


DECLARE @TestString varchar(500)
Set @TestString = 'SQL Server 2019' 
SELECT * FROM ParseStr (@TestString)

go
