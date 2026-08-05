-- show databases
CREATE DATABASE BankingDB;
USE bankingdb;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountcreationDate DATE
);

describe customers;

select * from customers;


CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10 , 2 )
);
describe Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10 , 2 ),
    TransactionType VARCHAR(20)
);
describe Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
desc Branches;

create table AccountBranches (
AssignmentDate date
);
CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10 , 2 ),
    InterestRate DECIMAL(5 , 2 ),
    StartDate DATE,
    EndDate DATE
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
SELECT 
    *
FROM
    customers;

insert into customers
values (102,'Suresh','Sharma','suresh@gmail.com','9923456787','2026-02-24','1998-04-18');
SELECT 
    *
FROM
    customers;

UPDATE customers 
SET 
    AccountcreationDate = '2025-06-29'
WHERE
    CustomerID = 101;

insert into branches
(BranchID,BranchName,BranchAddress,BranchPhone)
values 
(001,'Narsala','Nagpur','222426'),
(002,'Dighori','Nagpur','242426'),
(003,'Kharabi','Nagpur','242546');
SELECT 
    *
FROM
    branches;
insert into accounts
(AccountID,CustomerID,AccountType,Balance)
Values
(202,'102','Current','15000'),
(203,'103','Saving','24000'),
(204,'104','Current','18000');

SELECT 
    *
FROM
    loans;

insert into loans
(LoanID,LoanAmount,InterestRate,StartDate,EndDate,CustomerID)
Values
(301,'200000','12.5','2023-08-20','2027-08-20','101');

insert into loans
(LoanID,LoanAmount,InterestRate,StartDate,EndDate,CustomerID)
Values
(302,'300000','10','2021-06-24','2026-06-24','102'),
(303,'700000','11.5','2022-05-01','2027-05-10','103'),
(304,'800000','10.5','2020-09-05','2024-09-05','104');

select * from loans;

insert into transactions
(TransactionID,TransactionDate,Amount,TransactionType,AccountID)
Values
(401,'2026-08-04','15000','UPI','201'),
(402,'2026-08-04','4000','NB','202'),
(403,'2026-08-04','2500','NB','203'),
(404,'2026-08-04','7000','UPI','204');

SELECT * from transactions;

insert into customers values (105,'karan','mehta','karan@gmail.com','7709540869','2026-07-25','1998-10-29');
UPDATE accounts
SET BranchID = '001'
WHERE AccountID = 201;

UPDATE accounts
SET BranchID = '002'
WHERE AccountID = 202;

UPDATE accounts
SET BranchID = '003'
WHERE AccountID = 203;

UPDATE accounts
SET BranchID = '001'
WHERE AccountID = 204;
select * from accounts;

update accounts
set balance = '30000'
Where AccountID = 201;

update accounts
set balance = balance + 2000
Where AccountID = 202;

update customers
set Email = 'sharmarahul@gmail.com',
Phone = '9518562312'
where
CustomerID = 101;
Select * from accounts;

SELECT 
    CustomerID, Firstname, Lastname, Phone
FROM
    customers;
    
    select * from accounts
    where AccountType = 'Saving';
    
    select * from accounts
    where AccountType != 'Saving';
    
    select * from accounts
    where Balance = 30000 and AccountType = 'Savings';
    
     select * from accounts
    where Balance >= 18000 or AccountType = 'Savings';
    
    select * from accounts
    where not AccountType = 'saving';