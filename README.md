# FoodOrder-SQL-Project
Online Food Ordering Database

****Overview****

Online_Food_Orders1 is a relational database project built in SQL Server Management Studio (SSMS) to simulate the operations of an online food ordering business. The database is designed using a star schema, which supports efficient analytical queries and data analysis.
The dataset consists of dummy data, intentionally modeled to reflect realistic patterns found in real-world food ordering businesses, including customer behavior, order activity, and operational performance.

****Star Schema Design****

**Fact Table**
Orders – Stores transactional data for each order, with the following columns:
Order_ID
Customer_ID
Restaurant_ID
Location_ID
Product_ID
Date_ID
Partner_ID
Order_Amount
Order_Quantity
Discount
Unit_Price
Total_Price
Order_Status
Delivery_Type
Order_Channel
Order_Hour
Estimated_Delivery_Time
Actual_Delivery_Time
Promo_Code

**Dimension Tables** - stores the descriptive data of the database.

Dim_Customers:
Customer_ID
Customer_Name
Customer_Email
Customer_Address
Phone_Number
Device_Type
Preferred_Cuisine
Sign_Up_Date
Total_Spend
Last_Order_Date

Dim_Restaurants:
Restaurant_ID
Restaurant_Name
Restaurant_Email
Restaurant_Address
Phone_Number
Cuisine_Type
Average_Rating
Average_Preparation_Time

Dim_Product:
Product_ID
Product_Name
Product_Category
Product_Price
Restaurant_ID
Average_Rating
Stock_Availability

Dim_Date:
Date_ID
Year
Quarter
Month
Day
Weekend_or_Weekday
Holiday_Flag

Dim_Location:
Location_ID
Country
Province
City
City_Type
Zip_Code

Dim_Delivery_Partner:
Partner_ID
Partner_Name
License_Number
Phone_Number
Vehicle_Type
Average_Delivery_Time
Total_Deliveries


****Features****

Realistic dummy data reflecting real-world food ordering operations.
Structured for advanced SQL queries and analytical workflows.

Enables exploration of key business insights, including:
Customer behavior and spending patterns
Restaurant performance and product popularity
Delivery partner efficiency and delivery trends
Order trends by time, location, or channel


****Getting Started****

**Clone the repository:**
git-Bash
git clone <https://github.com/TebogoLesedi1/FoodOrder-SQL-Project>
Open the .sql scripts in SQL Server Management Studio.
Execute scripts to create the database, tables, and load the dummy data.
Begin exploring the database using SQL queries for analysis and reporting.

Example Queries
Identify top-selling products by restaurant or category.
Calculate average delivery times by partner or location.
Analyze customer spending and order frequency over time.
Track delivery performance against estimated delivery times.

****Future Work****

Expand the dataset with additional orders, customers, and products.
Add stored procedures for common analytical queries.
Integrate with visualization tools (Power BI, Tableau) for dashboards.
Use the database for machine learning experiments (e.g., predicting delivery times, customer churn, or order volume).

**Notes**
All data is dummy data, but closely mirrors real-world ordering behaviors.
This project demonstrates database design, star schema modeling, and SQL-based data analysis.

**Author**
_Tebogo Lesedi
BSc Mathematical Science | Data Science Enthusiast | Aspiring Data Engineer_
