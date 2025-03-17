USE master;
CREATE DATABASE auxiliary  collate Latin1_General_CI_AS;
GO

USE auxiliary;
CREATE TABLE holidays(date DATETIME PRIMARY KEY, holiday VARCHAR(500), bank_holiday BIT);
CREATE TABLE vacation("begining" DATETIME, "end" DATETIME, type VARCHAR(500), PRIMARY KEY("begining", "end"));
CREATE TABLE season("begining" DATETIME, "end" DATETIME, type VARCHAR(500), PRIMARY KEY("begining", "end"));

USE master;
GO