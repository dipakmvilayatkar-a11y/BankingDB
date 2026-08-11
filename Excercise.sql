select
constraint name,
constraint type
from information_schema.table_constraints
where table_schema = 'bankingdb'

show create table accounts ;

-- Display the CustomerID, FirstName and Email of customers whose AccountCreationDate is after 1-Jan-2025.
select CustomerID,FirstName,Email from customers
    where AccountcreationDate > '2025-01-01';
    
-- Display all Savings accounts having balance greater than ₹20,000.
select accountID,AccountType,Balance from accounts
where Balance > 20000;

-- Display customers whose Phone number is NOT NULL.
select customerid,firstname,lastname,phone from customers
where Phone IS NOT null;

-- Display distinct Account Types available in the Accounts table.
select distinct accounttype from accounts;

-- Display customers whose FirstName starts with 'R'.
select * from customers where firstName like '%R';

-- Display accounts having Balance between ₹20,000 and ₹60,000.
select * FROM accounts WHERE Balance between 20000 and 60000;

-- Display all Deposit transactions whose amount is greater than ₹3000.
select * from transactions WHERE TransactionType = "DEPOSIT" AND Amount > 3000;

-- Display customers whose CustomerID is IN (101,103,106,109).
SELECT CUSTOMERID,FIRSTNAME,LASTNAME FROM customers
where CustomerID IN (101,103,106,108);

-- Display first 5 customers ordered by CustomerID
SELECT * FROM customers 
ORDER BY CustomerID LIMIT 5;

-- Display customers after skipping first 3 records.
SELECT * FROM customers 
ORDER BY CustomerID limit 5 offset 3;

-- Display Savings accounts having balance between ₹20,000 and ₹80,000.
select * from accounts where AccountType = "savings" and Balance between 20000 and 80000;

