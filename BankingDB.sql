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

SELECT 
    AccountID,
    Accounttype,
    Balance,
    CASE
        WHEN balance >= 50000 THEN 'High Value Customer'
        ELSE 'Low Value Customer'
    END AS CustomerCategory
FROM
    accounts;
    
-- categorize the deposits in the transactions table as conditions given
-- if above 10000(included)High Amount
-- if 5000 to 10000 midium amount
-- if upto 5000 low amount
-- for the transaction type withdrawl"Not applicable"
SELECT 
    TransactionID,
    Amount,
    TransactionType,
    CASE
    WHEN TransactionType = 'Withdrawl' THEN 'Not Applicable'
        WHEN Amount >= 10000 THEN 'High Amount'
        when amount > 5000 and amount < 10000 then 'Midium Amount'
        ELSE 'Low Amount'
    END AS AmountStatus
FROM
    transactions;

UPDATE transactions
SET transactiontype = 'deposit'
WHERE transactionId = 401;

UPDATE transactions
SET transactiontype = 'withdrawl'
WHERE transactionId = 402;

UPDATE transactions
SET transactiontype = 'withdrawl'
WHERE transactionId = 403;

UPDATE transactions
SET transactiontype = 'deposit'
WHERE transactionId = 404;

select * ,
case
when transactiontype = 'deposit' and amount >= 10000 then 'High Amount'
when transactiontype = 'deposit' and amount >= 5000 then 'Medium Amount'
when transactiontype = 'deposit' and amount < 5000 then 'Low Amount'
Else 'Not Applicable'
end as 'TransactionCategory'
from transactions;
-- STRING FUNCTIONS
select CustomerID,UPPER(FirstName),UPPER(LastName)
from customers; -- upper gives o/p in uppercase
select CustomerID,LOWER(FirstName),LOWER(LastName)
from customers; -- lower gives o/p in lowercase
select lastname,length(LastName) from customers; -- length returnes the number of bytes
select char_length("nagpur"); -- char length returns no of characters
select length("नागपूर"); -- length returnes the number of bytes
select char_length("नागपूर");-- char length returns no of characters

select customerid,concat(firstname," ",LastName) as FullName from customers; -- concat joint the two or more strings
select substring("Hello World",1,5); -- substring returns the specified part of string
select concat(substring(firstname,1,1),"."," ",LastName) as InitialName from customers;

-- trim () function to remove leading and trailing spaces
select length("  Hello World   ");
select length(trim("  Hello World   "));
select length(trim(substring("Hello World",6)));

-- Replace() function

select replace("Mat mat Mat","M","C");

select * from accounts;
-- avg function
select avg(Balance) from accounts
where accounttype = "savings";

-- round function
select round(avg(Balance),2) from accounts
where accounttype = "savings";

-- ceil function or ceiling function
select ceil(avg(Balance)) from accounts
where accounttype = "savings";

-- floor function
select floor(avg(Balance)) from accounts
where accounttype = "savings";

-- absolute() function....It removes the sign
select abs(-3656);
select abs(-1.23);
select abs(656);

-- MOD value returns the remainder after division
select (7/3);
select mod(7,3);

-- Power ()
select power(2,3);
select power(1.5,3);

-- SQRT()
select sqrt(123);
select sqrt(144);

SELECT * FROM customers;

-- Date Functions
-- Now,curdate,curtime Functions
select now();
select curdate();
select curtime();

-- Year(),Month(),Day()
select year(DateOfBirth)as Year,
month(DateOfBirth) as Month,
day(DateOfBirth) as Date 
from customers;

-- datediff() difference between age
select concat(firstname," ",LastName)as FullName,dateofbirth,datediff(curdate(),DateofBirth)as Age from customers;
select concat(firstname," ",LastName)as FullName,dateofbirth,floor(datediff(curdate(),DateofBirth)/365)as Age from customers;

-- Date_Add() adds interval to date
select concat(firstname," ",LastName)as fullname,accountcreationdate,date_add(accountcreationdate,interval 1 year) as KYCRenewal from customers;

-- Count() Function
SELECT * FROM customers;
select count(*) as TotalCustomers from customers;
select count(Phone) as TotalCustomers from customers;

-- sum() function
select * from accounts;
select sum(balance) as savingsbalance from accounts;
select sum(balance) as savingsbalance from accounts where AccountType = "savings";

-- avg() function
select * from transactions;
select avg(amount) from transactions;
select avg(amount) as AvgAmountDeposited from transactions where TransactionType = "Deposit";
select avg(amount) as AvgAmountWithdrawl from transactions where TransactionType = "Withdrawl";

-- max() and min() function
-- find maximum balance in savings account
select max(balance) from accounts where AccountType = "Savings";
-- find minimum balance in savings account
select min(balance) from accounts where AccountType = "Savings";

-- Group By
select transactiontype, sum(amount)
from transactions group by (transactiontype);

select * from accounts; -- count accounts, total balance and average balance group by accounttype
select AccountType,
     count(*) as TotalAccounts,
     sum(balance) as TotalBalance,
     avg(balance) as AvgBalance
     from accounts
     group by accounttype;
     
     -- find total accounts for specific branch and accounttype
     select branchID,AccountType,
     count(*) as noofaccounts from accounts
     group by BranchID,AccountType
     order by BranchID;
     
     -- Having filters the result of group by
     select branchID,AccountType,
     count(*) as noofaccounts from accounts
     group by BranchID,AccountType
     having noofaccounts >=2 and AccountType = "savings";
     
	-- how many accounts creates in every year
    Select Count(*)As NoOfAccounts,year(AccountCreationDate) as Years From customers
    group by Years;
    
   -- JOINS in SQL
  -- INNER JOIN (Matches rows that exist in both tables)
  -- Find all customers having loans with their names,interest rate and loan amount 
 SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    l.LoanAmount,
    l.InterestRate
FROM
    customers c
        INNER JOIN
    loans l ON c.CustomerID = l.customerID;
  -- find the branch name for all the accoundids
  -- include accountid,accounttype and branchname,branchaddress
  SELECT 
    a.accountid, a.accounttype, b.branchname, b.branchaddress
FROM
    accounts a
        INNER JOIN
    branches b ON a.BranchID = b.BranchID;
  
-- find all the customers(name,phone,accounttype,balance) where accounttype is saving
select c.firstname,c.lastname,c.phone,a.accounttype,a.balance 
from customers c 
inner join 
accounts a on c.CustomerID = a.CustomerID
 where AccountType = 'savings';  
	