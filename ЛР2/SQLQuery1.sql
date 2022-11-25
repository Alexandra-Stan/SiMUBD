USE [master]
GO
CREATE DATABASE Educator
ON PRIMARY (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Educator.mdf',
SIZE = 10, NAME = 'Educator'),
FILEGROUP g1 (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\g1.mdf',
SIZE = 10, NAME = g1)
LOG ON (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Educator.ldf',
SIZE = 10, NAME = 'log1')
GO