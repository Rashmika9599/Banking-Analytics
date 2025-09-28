create database Project1;
use project1;
#----- banking analytics kpis---------------------
#---------Kpi-1-------------------------------
SELECT SUM(`loan amount`) AS total_loan_amount_funded
FROM `bank data analystics`;
#-----------------Kpi-2-------------------------------------
SELECT COUNT(*) AS total_loans
FROM `bank data analystics`;
#--------------------------Kpi-3-------------------------
SELECT SUM(`Total Rec Prncp`+`Total Rrec Int`) AS total_collection
FROM `bank data analystics`;
#-----------------------kpi-4--------------------------------
SELECT SUM(`Total Rrec Int`) AS total_interest
FROM `bank data analystics`;
#----------------------kpi-5--------------------------
select `branch name`,`loan amount` from `bank data analystics`
group by 1,2 limit 10;
#---------------------kpi-6----------------------------
select `state name`,sum`loan amount`from `bank data analystics`
group by 1,2;
#-----------------------kpi-7----------------------------
select `religion`,`loan amount`from `bank data analystics`
group by 1,2;
#------------------------kpt-8----------------------
SELECT `Purpose Category`,count(*) as loan
FROM `bank data analystics`
GROUP BY 1;
#----------------------kpi-9----------------------------
select `Disbursement Date (Years)`,`loan amount`from `bank data analystics`
group by 1,2;
#-----------------------------Kpi-10-----------------------------
select `Grrade`,`loan amount`from `bank data analystics`
group by 1,2;
#-------------------------------------kpi-11-------------------------
SELECT COUNT(*) AS default_loan_count
FROM `bank data analystics`
WHERE `Verification Status`= 'Source Verified';
#--------------------------------------Kpi-12-----------------------
SELECT COUNT(`Client id`) AS delinquent_client_count
FROM `bank data analystics`
WHERE `Loan Status` = 'Active Loan';
#-------------------------------------kpi-13-----------------------
SELECT 
    (SUM(CASE WHEN `Loan Status` = 'Active Loan' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS delinquent_loan_rate
FROM `bank data analystics`;
#-----------------------------------------kpi-14------------------------
SELECT 
    (SUM(CASE WHEN `Loan Status` = 'Active Loan' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS default_loan_rate
FROM `bank data analystics`;
#------------------------------------------kpi-15------------------------------------
SELECT `Loan Status`, COUNT(*) AS loan_count
FROM `bank data analystics`
GROUP BY `Loan Status`;
#----------------------------------------kpi-16---------------------------------
SELECT 
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age >= 55 THEN '55+'
    END AS age_group,
    COUNT(*) AS loan_count
FROM `bank data analystics`
GROUP BY age_group;
#------------------------------------kpi-17------------------------------------
SELECT DATEDIFF(`Closed Date`, `Disbursement Date`) AS days_to_maturity,
       COUNT(*) AS loan_count
FROM `bank data analystics`
GROUP BY days_to_maturity;
#-----------------------------------kpi-18-------------------------------
select count(*) as not_verified_count from  `bank data analystics`
group by `Verification Status`='Not Verified';