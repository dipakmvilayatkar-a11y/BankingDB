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


create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);
describe Accounts;

create table Transactions (
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);
describe Transactions;

create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);
desc Branches;

create table AccountBranches (
AssignmentDate date
);
create table Loans (
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
StartDate date,
EndDate date
);