create database Project;
use Project;
show tables;

select * from financial_loan_dataset;

select count(id) as Total_Loan_Applications from financial_loan_dataset;

Select sum(loan_amount) as Total_Amount_Funded from financial_loan_dataset;

Select sum(total_payment) as Total_Amount_Received from financial_loan_dataset;

Select avg(int_rate)*100 as Avg_Int_Rate from financial_loan_dataset;

/* rounding off the average interest rate */
Select round((avg(int_rate)*100),2) as Avg_Int_Rate from financial_loan_dataset;

select avg(dti)*100 as avg_dti from financial_loan_dataset;

/* rounding off the average dti */
Select round((avg(dti)*100),2) as Avg_DTI from financial_loan_dataset;

/* Good loan Count */
select count(case when loan_status='Fully Paid' or loan_status='Current' then id end) as Good_Loan_Applications from financial_loan_dataset;

/* Good loan count perecentage */
Select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)/count(id) as Good_Loan_Applications_Percentage from financial_loan_dataset;

/* Good loan funded amount */
Select sum(loan_amount) as Good_Loan_Amount from financial_loan_dataset where loan_status='Fully Paid' or loan_status= 'Current';

/* Good loan amount recovered */
Select sum(total_payment) as Total_Good_Loan_Amount_Received from financial_loan_dataset where loan_status='Fully Paid' or loan_status= 'Current';

/* Bad loan Count */
Select count(case when loan_status='Charged Off' then id end) as Bad_Loan_Applications from financial_loan_dataset;

/* Bad loan count perecentage */
Select (count(case when loan_status='Charged Off' then id end)*100)/count(id) as Bad_Loan_Applications_Percentage from financial_loan_dataset;

/* Bad loan funded amount */
Select sum(loan_amount) as Bad_Loan_Amount  from financial_loan_dataset where loan_status='Charged Off';

/* Bad loan amount recovered */
Select sum(total_payment) as Total_Bad_Loan_Amount_Received from financial_loan_dataset where loan_status='Charged Off';