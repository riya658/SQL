1. What are the names of all the customers who live in New York?
SELECT CONCAT(FirstName," ",LastName) as Customer FROM customers
WHERE City='New York';

2.  What is the total balance of all checking accounts?
SELECT SUM(Balance) AS Total_Balance FROM accounts
WHERE AccountType='Checking';

3. What is the total balance of all accounts associated with customers who live in Los Angeles?
SELECT c.City , SUM(a.Balance) as Balance  FROM accounts a 
JOIN customers c
ON a.CustomerID =c.CustomerID
WHERE City ='Los Angeles'
GROUP BY c.City;

4.Which branch has the highest average account balance?
SELECT b.BranchName as Branch ,AVG(a.Balance) as Highest_Avg_Balance FROM accounts a 
JOIN branches b 
ON b.BranchID=a.BranchID 
GROUP BY Branch
ORDER BY Highest_Avg_Balance DESC LIMIT 1;

5.Which customer has the highest current balance in their accounts?
SELECT CONCAT(c.FirstName," ",c.LastName) as Customer , SUM(a.Balance) AS Balance FROM accounts a
JOIN customers c
ON a.CustomerID=c.CustomerID
GROUP BY Customer 
ORDER BY Balance DESC;

6. Which customer has made the most transactions in the Transactions table?
SELECT CONCAT(c.FirstName," ",c.LastName) as Customer,COUNT(t.TransactionID) AS Transactions

7. Which branch has the highest total balance across all of its accounts?
SELECT b.BranchName,
SUM(a.Balance) OVER (PARTITION BY b.BranchName ORDER BY a.Balance DESC) AS Highest_Balance FROM Branches b 
JOIN Accounts a
ON b.BranchID = a.BranchID
ORDER BY Highest_Balance DESC
8. Which customer has the highest total balance across all of their accounts, including savings 
and checking accounts?
SELECT c.FirstName as CustName,SUM(a.Balance) as Total FROM accounts a
JOIN customers c
ON c.CustomerID =a.CustomerID
WHERE a.AccountType IN ('Savings','Checking')
GROUP BY CustName
ORDER BY Total DESC LIMIT 1;

 9. Which branch has the highest number of transactions in the Transactions table?
 SELECT b.BranchName AS Branch , SUM(t.TransactionID) as Total FROM branches b
 JOIN accounts a
 ON b.BranchID =a.BranchID
 JOIN transactions_ t
 ON a.AccountID =t.AccountID
 GROUP BY Branch 
 ORDER BY Total DESC LIMIT 2;
 
 10.List branches with average account balance greater than a 10000.
 SELECT b.BranchName as Name , ROUND(AVG(a.Balance),1) as Account_Balance from accounts a
 JOIN branches b
 ON b.BranchID = a.BranchID
 GROUP BY Name
 HAVING Account_Balance > 10000;
 
 