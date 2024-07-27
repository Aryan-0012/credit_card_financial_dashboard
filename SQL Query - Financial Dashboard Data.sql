-- SQL Query to create and import data from csv files:

-- Create a database 
create database cc_project;

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Create cust_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. load csv data into MY SQL (remember to update the file name and file location in below query)

-- load cc_detail table

truncate cc_detail;
set global local_infile=1
;
load data local infile 'C:/Users/User/Desktop/POWER BI/credit_card.csv'
into table cc_detail
columns terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;


-- load cust_detail table

truncate cust_detail;
set global local_infile=1
;
load data local infile 'C:/Users/User/Desktop/POWER BI/customer.csv'
into table cust_detail
columns terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;


-- If you are getting below error, then use the below point:  
   -- ERROR:  date/time field value out of range: "0"
   -- HINT:  Perhaps you need a different "datestyle" setting.

-- Check the Data in Your CSV File: Ensure date column values are formatted correctly and are in a valid format that MY SQL can recognize
--  (e.g., YYYY-MM-DD). And correct any incorrect or missing date values in the CSV file. 

-- Now, try to COPY the csv files!


-- 4. Insert additional data into SQL, using same load statement

-- copy additional data (week-53) in cc_detail table
-- check the date format also in cc_add file for date format
set global local_infile=1
;
load data local infile 'C:/Users/User/Desktop/POWER BI/cc_add.csv'
into table cc_detail
columns terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)
set global local_infile=1
;
load data local infile 'C:/Users/User/Desktop/POWER BI/cust_add.csv'
into table cust_detail
columns terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;