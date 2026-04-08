create database Capstone;
use capstone;
select * from cust_churn_records;
rename table `customer-churn-records` to cust_churn_records;
select count(RowNumber) as tot_records from cust_churn_records;
-- select C.CustomerId, C.Surname, C.Gender, C.Exited, NC.CustomerId, NC.Surname, NC.Gender, NC.Exited from cust_churn_records as C  inner join cust_churn_records as NC on C.Exited
select Exited, count(Exited) as total_cus from cust_churn_records group by Exited;

select avg(CreditScore) as avg_credit_score from cust_churn_records;

select Geography, count(CustomerId) as Cust_count from cust_churn_records group by Geography;


select Gender, count(Gender) as tot_cust from cust_churn_records group by Gender;


select count(Balance) as Zero_bal_cust from cust_churn_records where Balance=0;

select round(avg(Balance),2) as Avg_balance from cust_churn_records where Exited=1;
select * from cust_churn_records;
select geography, count(Exited) as churn_rate from cust_churn_records where Exited=1 group by geography order by churn_rate desc limit 1;

select round(avg(Tenure),2) as avg_tenure_nchurn from cust_churn_records where Exited=0; 

select *, dense_rank() over(order by EstimatedSalary desc) from cust_churn_records where Exited=1 limit 5;

select CustomerId, Surname, EstimatedSalary, Exited from cust_churn_records where Exited=1 order by EstimatedSalary desc limit 5;

select* from cust_churn_records;

select count(IsActiveMember) as tot_member from cust_churn_records where IsActiveMember=1 and NumOfProducts>2;

select IsActiveMember, round(avg(balance),2) as avg_bal from cust_churn_records group by IsActiveMember;

select gender, round(avg(EstimatedSalary),0) as avg_sal from cust_churn_records group by gender;

select Tenure, count(Exited) from cust_churn_records where Exited=1 group by Tenure order by Tenure;

create view ts1 as (select NumofProducts,count(*) as tot_cust, sum(Exited) as churn_per_prod from cust_churn_records group by NumofProducts);
select * from ts1;


select NumofProducts, churn_per_prod *100.0/tot_cust as churn_rate from ts1 order by NumofProducts;

select * from ts2;

select min(age) from cust_churn_records;

create view t1 as(
select *,
case 
when age between 18 and 30 then "18-30"
when age between  31 and 45 then "31-45"
when age between 46 and 60 then "46-60"
when age between 61 and 75 then "61-75"
 else "age group 5"
 end as age_group from cust_churn_records);
 
 select age_group, round(sum(exited)*100/count(*),2) as agewise_churn_cust from t1 group by age_group order by age_group;
 select * from cust_churn_records;


select Geography, Gender, round((sum(exited)*100/count(*)),2) as churn_rate 
from cust_churn_records 
group by Gender,geography order by churn_rate desc limit 1;

select Geography, 
round(avg(case when exited=1 then creditscore end),2) as avg_cred,
round(avg(case when exited=1 then balance end),2) as Avg_bal, 
round((sum(exited)*100/count(*)),2) as churn_rate from cust_churn_records group by Geography;

select * from cust_churn_records;

select Surname, Balance from cust_churn_records where Exited=1 order by Balance desc limit 10;


select count(CustomerID) as Cust_ID from cust_churn_records where HasCrCard=0 and Exited=1;


select round(count(case when HasCrCard=0 and Exited=1 then 1 end)*100
/count(case when HasCrCard =0 then 1 end),0) as No_Cust_Churned 
from cust_churn_records;

With displ1 as(select avg(Balance) as Avg_bal from cust_churn_records where Exited =1) 
select * from displ1 where Balance > Avg_bal and Exited=1;

select * from cust_churn_records where Balance>(select avg(Balance) from cust_churn_records where exited=1);
select * from cust_churn_records;

select * from (select Geography, sum(exited)*100/count(RowNumber) as country_churn_rate ,
sum(sum(exited)) over() *100 /sum(count(RowNumber)) over() as overal_churn from cust_churn_records group by Geography) as churn_data 
where country_churn_rate > overal_churn;

