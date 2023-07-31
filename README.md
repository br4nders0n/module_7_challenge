# Unit 7 Homework Assignment: Looking for Suspicious Transactions

## Background

Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this homework assignment, you will apply your new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

You are asked to accomplish three main tasks:

1. [Data Modeling](#Data-Modeling):
Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.

2. [Data Engineering](#Data-Engineering): Create a database schema on PostgreSQL and populate your  database from the CSV files provided.

3. [Data Analysis](#Data-Analysis): Analyze the data to identify possible fraudulent transactions trends data, and develop a report of your observations.

## Files

* [card_holder.csv](Data/card_holder.csv)
* [credit_card.csv](Data/credit_card.csv)
* [merchant.csv](Data/merchant.csv)
* [merchant_category.csv](Data/merchant_category.csv)
* [transaction.csv](Data/transaction.csv)

## Instructions

### Data Modeling

Create an entity relationship diagram (ERD) by inspecting the provided CSV files.

Part of the challenge here is to figure out how many tables you should create, as well as what kind of relationships you need to define among the tables.

Feel free to discuss your database model design ideas with your classmates. You can use a tool like [Quick Database Diagrams](https://www.quickdatabasediagrams.com) to create your model.

**Hints:** 

* For the `credit_card` and `transaction` tables, the `card` column should be a VARCHAR(20) datatype rather than an INT.
* For the `transaction` table, the `date` column should be a TIMESTAMP datatype rather than DATE.

![ERD](https://github.com/br4nders0n/module_7_challenge/assets/133409952/d4275430-9bd8-4911-b91c-0bd51589808c)

### Data Engineering

Using your database model as a blueprint, create a database schema for each of your tables and relationships. Remember to specify data types, primary keys, foreign keys, and any other constraints you defined.

![Screenshot 2023-07-31 at 10 10 38 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/16b7f0be-1cba-41bc-b653-b8cb5dd1ca0f)

After creating the database schema, import the data from the corresponding CSV files.

**Data imported without errors**

### Data Analysis
#### Part 1:

The CFO of your firm has requested a report to help analyze potential fraudulent transactions. Using your newly created database, generate queries that will discover the information needed to answer the following questions, then use your repository's ReadME file to create a markdown report you can share with the CFO:

* Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders. 

  * How can you isolate (or group) the transactions of each cardholder?
    
![Screenshot 2023-07-31 at 10 13 04 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/118e07fb-404c-4a3e-8502-4bd2024de271)

**Output:** [group_transactions_by_cardholder.csv](data_outputs/group_transactions_by_cardholder.csv)

  * Count the transactions that are less than $2.00 per cardholder.

![Screenshot 2023-07-31 at 10 16 32 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/552b2571-b1d1-4506-afb7-7253742154b8)

**Output:** [transactions_less_2.csv](data_outputs/transactions_less_2.csv)
  
  * Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

**Based on the data there is no direct evidence that a single cardholder has been hacked, however if we assume fradulent transactions are under $2, then Megan Price, Danielle Green, and Malik Carlson are the most at risk.**

* Take your investigation a step futher by considering the time period in which potentially fraudulent transactions are made.

  * What are the top 100 highest transactions made between 7:00 am and 9:00 am?
 
  ![Screenshot 2023-07-31 at 10 23 46 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/27f437d8-bb00-401e-9340-f5bff82b7baa)

**Output:** [transactions_7_to_9.csv](data_outputs/transactions_7_to_9.csv)

  * Do you see any anomalous transactions that could be fraudulent?

 **Based on the data, there is no one time between 7am to 9am that suggests fradulent activity.**

  * Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

  **No, cannot be inferred from data.**

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

* What are the top 5 merchants prone to being hacked using small transactions?

![Screenshot 2023-07-31 at 10 30 36 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/f1323083-f9c9-44ba-9779-22ebe904a171)

**Output:** [merchant_small_transactions.csv](data_outputs/merchant_small_transactions.csv)

**The top 5 are Wood-Ramirez, Hood-Phillips, Baker Inc, Clark and Sons, and Green-Wood.**

#### Part 2:

Your CFO has also requested detailed trends data on specific card holders. Use the [starter notebook](Starter_Files/challenge.ipynb) to query your database and generate visualizations that supply the requested information as follows, then add your visualizations and observations to your markdown report:      

* The two most important customers of the firm may have been hacked. Verify if there are any fraudulent transactions in their history. For privacy reasons, you only know that their cardholder IDs are 2 and 18.

  * Using hvPlot, create a line plot representing the time series of transactions over the course of the year for each cardholder separately.
 
![Screenshot 2023-07-31 at 10 35 24 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/68181971-98f7-44ee-afb2-193f57ec1183)

![Screenshot 2023-07-31 at 10 35 51 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/04ffb8d0-13ea-474f-9679-f0d83f149bce)

  * Next, to better compare their patterns, create a single line plot that contains both card holders' trend data.

![Screenshot 2023-07-31 at 10 37 01 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/54b060a8-71ea-4a90-aebd-b1b0568a271e)

  * What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale.

 **The consumption patterns of both cardholders are very different. Cardholder 18 makes mostly small transactions and then 1 or 2 big ones a month, while cardholder 2 makes only small transactions. Based on this data, cardholder 2 is more susceptible to fraud.**

* The CEO of the biggest customer of the firm suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. Again, for privacy reasons, you know only that the cardholder ID in question is 25.

  * Using hvPlot, create a box plot, representing the expenditure data from January 2018 to June 2018 for cardholder ID 25.
  
  ![Screenshot 2023-07-31 at 10 42 06 AM](https://github.com/br4nders0n/module_7_challenge/assets/133409952/f9fbbfcf-4d52-4da7-b573-6bc33da87783)

  * Are there any outliers for cardholder ID 25? How many outliers are there per month?
 
  **Yes, there are outliers. January, March, and May all had 1 outlier transaction, while April and June had 3.**

  * Do you notice any anomalies? Describe your observations and conclusions.
 
  **I think the months with highest risk of fradulent transactions are the ones with 1 outlier. The fraudster could be making one large purchase a month to see if customer 25 notices on their credit card statement.**
