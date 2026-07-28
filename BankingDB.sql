-- show databases
CREATE DATABASE BankingDB;
USE bankingdb;
create table Customers (
CustomerID int primary key,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15),
AccountcreationDate date
);

describe customers;

select * from customers;

