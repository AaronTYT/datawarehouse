Use master
Go

PRINT '';
PRINT '*** Dropping Database';
GO

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'CrimesDW_Diagram')
DROP DATABASE CrimesDW_Diagram;
GO

PRINT '';
PRINT '*** Creating Database';
GO

Create database CrimesDW_Diagram
Go

Use CrimesDW_Diagram
Go

PRINT '';
PRINT '*** Creating Table DimDate';
GO

Create Table DimDate
(
DateID int primary key identity,
DateNum varchar(20)
)
Go

PRINT '';
PRINT '*** Creating Table DimLocation';
GO

Create Table DimLocation
(
LocationID int primary key identity,
Beat int,
Neighborhood varchar(100),
Npu varchar(1),
Lat float,
Long float,
Road varchar(200),
City varchar(100),
County varchar(100),
State varchar(100),
Postcode int,
Country varchar(100)
)
Go

PRINT '';
PRINT '*** Creating Table DimType';
GO

Create Table DimType
(
TypeID int primary key identity,
TypeName varchar(100)
)
Go

PRINT '';
PRINT '*** Creating Table FactCrime';
GO

Create Table FactCrime
(
CrimeID bigint primary key identity,
DateID int not null,
LocationID int not null,
TypeID int not null
)
Go

PRINT '';
PRINT '*** Add relation between fact table foreign keys to Primary keys of Dimensions';
GO

AlTER TABLE FactCrime ADD CONSTRAINT 
FK_DateID FOREIGN KEY (DateID)REFERENCES DimDate(DateID);
AlTER TABLE FactCrime ADD CONSTRAINT 
FK_LocationID FOREIGN KEY (LocationID)REFERENCES DimLocation(LocationID);
AlTER TABLE FactCrime ADD CONSTRAINT 
FK_TypeID FOREIGN KEY (TypeID)REFERENCES DimType(TypeID);
Go


