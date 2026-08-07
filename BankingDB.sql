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
    
    -- find all customers register after 1 july 2026
    
    select * from customers
    where AccountcreationDate > '2026-07-01';
    
    -- Query multiple customers using IN operator (use phone number)
    
    select FirstName,LastName,Phone from customers
    where Phone in (9870123211,7709540869);
    
     select FirstName,LastName,Phone from customers 
    where Phone = '9518562312' or Phone = '9923456799' or Phone = '9870123211';
    
    -- BETWEEN operator
    -- find customers having balance between 10000 to 30000
    SELECT 
    CustomerID, AccountType, Balance
FROM
    accounts
WHERE
    Balance BETWEEN 10000 AND 30000;
    -- the values specified in range are included in the results.
    
   SELECT 
    CustomerID, AccountType, Balance
FROM
    accounts
WHERE
    Balance >= 10000 AND Balance <= 30000;  
    
    -- like operator used for pattern matching.
   -- find all customers whose first name starts with letter "K" 
   -- "_" matches exactly one character.

select * from customers where firstName like 'K%'; 

-- find all customers whose last name ends with letter "A" 

select * from customers where LastName like '%A'; 

-- find all customers whose last name has exactly 5 characters;
Select * from customers
where LastName Like '_____' ;

-- ORDER BY Clause
-- sort the accounts table according to the customers balance.

SELECT 
    CustomerID, Balance
FROM
    accounts
ORDER BY Balance;

-- sort  the branches table according to the branchname.
SELECT 
    BranchID, BranchName
FROM
    branches
ORDER BY BranchName;

-- sort the accounts table according to the customers balance from highest to lowest amount.

SELECT 
    CustomerID, Balance
FROM
    accounts
ORDER BY Balance DESC;

-- sort according to multiple columns
-- sort account table according to the accounttype and balance
SELECT 
    AccountID,AccountType,Balance,CustomerID
FROM
    accounts
    
ORDER BY AccountType desc,Balance desc;

-- DISTINCT clause.
-- find distinct(unique) accounttype from accounts table

select distinct accounttype from accounts;
-- find distinct(unique) transaction type and account id from transaction  table
select distinct transactiontype,accountid from transactions;

select * from transactions
limit 2; -- use of limit clause

-- offset clause is used to skip specific row before return

select * from customers
limit 2 offset 2;

select * from accounts
order by Balance desc
limit 2;

select * from accounts
order by Balance desc
limit 1 offset 2;

select * from accounts
order by Balance desc
limit 2,1;   -- here 2 specifies the rows to skip and 1 specifies the number of rows to return

Insert into customers
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate,DateofBirth)
values
(106,'Prasad','Patil','Prasad@gmail.com',null,'2026-02-15','1995-11-16'),
(107,'Sachin','Gedam','Gedam@gmail.com','9665623649','2026-07-28','1996-09-25'),
(108,'Sandhya','Alone','Sandhya@gmail.com',null,'2026-01-02','1997-10-28');

-- null and not null values
select * from customers
where Phone is null;

select * from customers
where Phone is not null;

insert into accounts
(AccountID,CustomerID,AccountType,Balance)
Values
(205,'105','Current','50000'),
(206,'106','Savings','75000'),
(207,'107','Current','29000'),
(208,'108','Savings','19000');

insert into transactions
(TransactionID,TransactionDate,Amount,TransactionType,AccountID)
Values
(405,'2026-08-05','16000','deposit','205'),
(406,'2026-08-05','450','withdrawl','206'),
(407,'2026-08-06','25000','withdrawl','207'),
(408,'2026-08-07','5000','deposit','208');

insert into loans
(LoanID,LoanAmount,InterestRate,StartDate,EndDate,CustomerID)
Values
(305,'2500000','9.5','2021-09-28','2026-09-28','105'),
(308,'700000','11.5','2022-08-06','2027-08-06','108');

select * from transactions;
select * from loans;
select * from customers;
select * from accounts;

UPDATE accounts
SET BranchID = '002'
WHERE AccountID = 205;

UPDATE accounts
SET BranchID = '001'
WHERE AccountID = 206;

UPDATE accounts
SET BranchID = '003'
WHERE AccountID = 207;

UPDATE accounts
SET BranchID = '002'
WHERE AccountID = 208;

select AccountID,Accounttype,Balance,
case
when balance >= 50000 then "High Value Customer"
else "Low Value Customer"
end as CustomerCategory
from accounts;