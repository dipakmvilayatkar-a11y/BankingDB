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

alter table customers
add DateOfBirth date;
desc customers;
alter table customers
modify Phone varchar(20);

alter table accounts
add constraint chk_MinBalance
check (Balance >= 1000);
desc accounts;

drop table accountbranches;

alter table accounts
add CustomerID int;

alter table accounts
add constraint FK_Accounts_Customers
foreign key (CustomerID)
references customers(customerID);
desc accounts;

alter table accounts
add constraint pk_AccountID
primary key (AccountID);
desc accounts;

alter table customers
modify FirstName varchar(50) not null;

desc customers;

alter table customers
add constraint uq_Email unique(Email);

-- link branches to account
alter table branches
add constraint pk_BranchID
primary key (BranchID);

alter table accounts
add BranchID int;

alter table accounts
add constraint FK_Accounts_Branches
foreign key (BranchID)
references branches(BranchID);

desc accounts;

-- link transactions to accounts
alter table transactions
add AccountID int;

alter table transactions
add constraint FK_Accounts_Transactions
foreign key (AccountID)
references accounts(AccountID);

-- link customers to loan
alter table loans
add constraint PK_Loans
primary key (LoanID);

-- add customerID column
alter table loans
ADD CustomerID int;

alter table loans
add constraint fk_CustomerID
foreign key (CustomerID)
references customers(CustomerID);

desc loans;

insert into customers
(CustomerID,FirstName,LastName,Email,Phone,DateofBirth)
values
(101,'Rahul','Sharma','rahul@gmail.com','9923456789','1998-04-15');

select * from customers;

insert into accounts
(AccountID,CustomerID,AccountType,Balance)
Values
(201,101,'Savings',25000);

select * from accounts;

insert into customers
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate,DateofBirth)
values
(103,'Sham','Mehra','sham@gmail.com','9923456799','2026-03-24','1998-08-15'),
(104,'nikhil','ramteke','nikhil@gmail.com','9870123211','2026-07-15','1998-10-27');
select * from customers;

insert into customers
values (102,'Suresh','Sharma','suresh@gmail.com','9923456787','2026-02-24','1998-04-18');
select * from customers;

update customers
set AccountcreationDate = '2025-06-29'
where CustomerID = 101;
