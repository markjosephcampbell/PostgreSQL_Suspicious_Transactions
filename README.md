# Unit 7 Homework Assignment: Looking for Suspicious Transactions

![Credit card fraudster](Images/credit_card_fraudster.jpg)

*[Credit Card Fraudster by Richard Patterson](https://www.flickr.com/photos/136770128@N07/42252105582/) | [Creative Commons Licensed](https://creativecommons.org/licenses/by/2.0/)*

## Background

Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this homework assignment, I applied my new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

I accomplished three main tasks:

1. [Data Modeling](#Data-Modeling):
- Defined a database model to store the credit card transactions data and create a new PostgreSQL database using your model.
- Created an entity relationship diagram (ERD) by inspecting the provided CSV files.

2. [Data Engineering](#Data-Engineering): 
- Created a database schema on PostgreSQL and populated the database from the CSV files provided.
- Created five tables: credit_card, card_holder, merchant, merchant_category and transactions.
- Specified data types.
- Set primary keys and foreign keys.

2. [Data Analysis](#Data-Analysis):  
- Analyze the data to identify possible fraudulent transactions trends data, and develop a report of your observations.
- Used the count function, inner join clause, group by statement and where clause to combine, extract and analysis the data through a series of quereies.
- Created views of each query.
- There were some outliers in the data suggesting possible fraudelent activity.
- There is evidence which suggests fraud is more likely to happen in the early morning because customers are less likely to be monitoring their phone for alerts.

4. [Data Analysis using Python Part 1](#Data-Analysis - Python - Part 1):
- Connect database to Python
- Analyze two customers who may have been hacked by cardholder IDS: 2 and 18.
-- Cardholder ID 2 does not appear to have been hacked. Cardholder ID 18 does appear to have been hacked.
_ Plot both customers and then combine the data to better analysis it.

5. [Data Analysis using Python Part 2](#Data-Analysis - Python - Part 2):
- Loaded the data of daily transactions from January to June 2018 for card holder 25 & wrote a query.
- Created a dataframe from the query results.
- Created a box plot of the results.
- There are at least one outlier per month during this timeframe except in February.

6. [Data Analysis using Python Challenge](#Data-Analysis - Python - Challenge):
- Wrote functions that located outliers using standard deviation and interquartile range

---

## Raw Data

* [card_holder.csv](Data/card_holder.csv)
* [credit_card.csv](Data/credit_card.csv)
* [merchant.csv](Data/merchant.csv)
* [merchant_category.csv](Data/merchant_category.csv)
* [transaction.csv](Data/transaction.csv)


### Submission

Post a link to your GitHub repository in BootCamp Spot. The following should be included your repo:

* An image file of your ERD.

* The `.sql` file of your table schemata.

* The `.sql` file of your queries.

* The Jupyter Notebook containing your visual data analysis.

* A ReadME file containing your markdown report.

* **Optional:** The Jupyter Notebook containing the optional challenge assignment.


© 2021 Trilogy Education Services
