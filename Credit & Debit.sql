create database Project1;
use project1;
#-----credit & debit kpis---------------------
#---------Kpi-1-------------------------------
SELECT SUM(Amount) AS Total_Credit
FROM `debit and credit banking_data`
WHERE `Transaction Type` = 'Credit';
#---------Kpi-2-------------------------------
SELECT SUM(Amount) AS Total_Debit
FROM `debit and credit banking_data`
WHERE `Transaction Type` = 'Debit';
#---------Kpi-3-------------------------------
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) /
  NULLIF(SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END), 0) AS Credit_Debit_Ratio
FROM `debit and credit banking_data`;
#---------Kpi-4-------------------------------
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) -
  SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END) AS Net_Transaction_Amount
FROM `debit and credit banking_data`;
#---------Kpi-5-------------------------------
SELECT 
  `Customer ID`,
  COUNT(*) * 1.0 / NULLIF(AVG(Balance), 0) AS Account_Activity_Ratio
FROM `debit and credit banking_data`
GROUP BY 1;
#---------Kpi-6-------------------------------
#-----daily---------
SELECT 
  CAST(`Transaction Date` AS DATE) AS Day,
  COUNT(*) AS Transactions_Per_Day
FROM `debit and credit banking_data`
GROUP BY 1
ORDER BY Day;
#-----monthly---------
SELECT 
  EXTRACT(YEAR FROM `Transaction Date`) AS Year,
  EXTRACT(MONTH FROM `Transaction Date`) AS Month,
  COUNT(*) AS Transactions_Per_Month
FROM `debit and credit banking_data`
GROUP BY 1,2
ORDER BY Year, Month;
#---------Kpi-7-------------------------------
SELECT 
  Branch,
  SUM(Amount) AS Total_Transaction_Amount
FROM `debit and credit banking_data`
GROUP BY Branch
ORDER BY Total_Transaction_Amount DESC;