-- 1. Profit by Region and City
SELECT 
    b.Region,
    b.City,
    SUM(b.Profit_Margin) AS Total_Profit
FROM BankData AS b
GROUP BY b.Region, b.City
ORDER BY Total_Profit DESC;

-- 2. Customers by Type
SELECT 
    c.Customer_Type,
    COUNT(c.Customer_ID) AS Number_of_Customers
FROM CustomerData AS c
GROUP BY c.Customer_Type
ORDER BY Number_of_Customers DESC;

-- 3. Profit, Customers and Transactions Overview
SELECT
    COUNT(DISTINCT c.Customer_ID) AS Total_Customers,
    COUNT(DISTINCT t.Transaction_ID) AS Total_Transactions,
    SUM(t.Transaction_Amount) AS Total_Profit
FROM CustomerData AS c
JOIN TransactionData AS t ON c.Customer_ID = t.Customer_ID;

-- 4. Regional Overview Performance
SELECT
    b.Region,
    COUNT(DISTINCT c.Customer_ID) AS Customers_Count,
    SUM(t.Transaction_Amount) AS Total_Transaction_Amount,
    SUM(b.Profit_Margin) AS Total_Profit
FROM BankData AS b
JOIN CustomerData AS c ON b.Branch_ID = c.Branch_ID
JOIN TransactionData AS t ON c.Customer_ID = t.Customer_ID
GROUP BY b.Region
ORDER BY Total_Profit DESC;

-- 5. Bank Performance Summary – Top 10 by Transaction Volume
SELECT 
    c.Customer_ID,
    c.Customer_Type,
    SUM(t.Transaction_Amount) AS Total_Transaction_Volume,
    COUNT(t.Transaction_ID) AS Number_of_Transactions
FROM CustomerData AS c
JOIN TransactionData AS t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Type
ORDER BY Total_Transaction_Volume DESC
LIMIT FIRST 10 ROWS ONLY;

-- 6. Bank Profit Overview – Average Profit by Region
SELECT
    b.Region,
    AVG(b.Profit_Margin) AS Avg_Profit_Per_Region
FROM BankData AS b
GROUP BY b.Region
ORDER BY Avg_Profit_Per_Region DESC;

-- 7. Customer Activity – Top 5 Most Active Users
SELECT
    c.Customer_ID,
    c.Customer_Type,
    COUNT(t.Transaction_ID) AS Total_Transactions
FROM CustomerData AS c
JOIN TransactionData AS t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Type
ORDER BY Total_Transactions DESC
LIMIT FIRST 5 ROWS ONLY;
