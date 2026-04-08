# 📊 Customer Churn Analysis (Excel + MySQL)

## 📌 Project Overview
This project analyzes customer churn data from a retail bank using Microsoft Excel and MySQL.  
The dataset contains 10,000 customer records including demographic, financial, and behavioral attributes.

---

## 🎯 Objective
- Analyze customer churn behavior  
- Identify high-risk customer segments  
- Generate actionable business insights  
- Build an interactive Excel dashboard  
- Perform data analysis using SQL queries  

---

## 📂 Dataset Description
The dataset includes:

- CustomerId  
- Surname  
- CreditScore  
- Geography  
- Gender  
- Age  
- Tenure  
- Balance  
- NumOfProducts  
- HasCrCard  
- IsActiveMember  
- EstimatedSalary  
- Exited (Churn Indicator)  
- Complain  
- Satisfaction Score  
- Card Type  
- Point Earned  

---

## 🛠️ Tools & Technologies
- Microsoft Excel  
- MySQL  

---

## 📊 Excel Dashboard Features
- Churn rate overview  
- Churn by geography  
- Gender-wise distribution  
- Product-wise churn analysis  
- Balance vs churn insights  
- Customer segmentation (age groups, activity status)  
- KPI cards:
  - Total customers  
  - Churned customers  
  - Churn rate (%)  
  - Average balance  
  - Average credit score  

---

## 🔍 Key Insights
- Customers with higher balance are more likely to churn  
- Inactive members show higher churn rates  
- Some geographies have higher churn rates  
- Customers with fewer products tend to churn more  
- Mid-age group customers show noticeable churn  

---

## 🧮 MySQL Analysis

### Basic Queries
- Total number of customers  
- Churned vs non-churned customers  
- Average credit score  
- Customers by geography  
- Gender distribution  

### Intermediate Analysis
- Customers with zero balance  
- Average balance of churned customers  
- Country with highest churn rate  
- Average tenure of retained customers  

### Advanced Insights
- Churn rate by age group  
- Churn rate by product count  
- Geography and gender churn combinations  
- High-risk customer identification  
- Customers above average churned balance  
- Countries exceeding overall churn rate  

---

## 📌 Sample SQL Query
```sql
SELECT Geography,
       COUNT(*) AS Total_Customers,
       SUM(Exited) AS Churned_Customers,
       (SUM(Exited)/COUNT(*)) * 100 AS Churn_Rate
FROM customers
GROUP BY Geography
ORDER BY Churn_Rate DESC;
```

## Customer-Churn-Analysis
```
│
├── Dataset/                → Raw data file
├── Excel Dashboard/        → Final dashboard file (.xlsx)
├── SQL Queries/            → .sql file with all queries
├── Screenshots/            → Dashboard images
├── Report/                 → Word/PDF report (optional ⭐)
└── README.md
```
🚀 Conclusion

This project demonstrates how Excel and SQL can be used together to analyze customer behavior and generate meaningful business insights.

⭐ Author

Samreen Khan
Data Analyst
