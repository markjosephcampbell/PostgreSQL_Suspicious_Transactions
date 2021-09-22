/* Isolate transactions of each cardholder */

CREATE VIEW  isolate_transactions as (SELECT card_holder.id, card_holder.name, credit_card.card, transactions.amount FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2 order by card_holder.name
)

/* count of transactons< 2*/

CREATE VIEW  count_transactions as (SELECT  card_holder.name, count(amount) FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2
group by card_holder.name)

/*Potentially fraudulent transactions card holder with more than 5 transactions< 2*/

CREATE VIEW  potentially_fraudulent_transactions as (SELECT  card_holder.name, count(amount) FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2
group by card_holder.name
HAVING count(amount)>5)
/* 

What are the top 100 highest transactions of less than 2$ that happened between 7:00 am and 9:00 am?
*/
CREATE VIEW  top_hundred_highest_transactions_ as (SELECT  transactions.card,transactions.amount, transactions.date, date_part('hour',transactions.date) as time FROM transactions 

where transactions.amount<=2 and  (date_part('hour', transactions.date)>=7 and date_part('hour', transactions.date) <9) order by transactions.amount limit 100)

/* Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day? */

/* Between 7 and 9 */
CREATE VIEW  transactions_between_7am_9am as (SELECT  count(*)/2 FROM transactions 

where transactions.amount<=2 and  (date_part('hour', transactions.date)>=7 and date_part('hour', transactions.date) <9)) 

/*Outside of 7 and 9*/
CREATE VIEW  transactions_outside_7am_9am as (SELECT  count(*)/22 FROM  transactions

where transactions.amount<=2 and  (date_part('hour', transactions.date)<7 or date_part('hour', transactions.date) >=9)) 

/*What are the top 5 merchants prone to being hacked using small transactions? */

CREATE VIEW top_5_fraudulent_merchants as  (SELECT   merchant.name, count(transactions.amount) as number_of_transactions FROM transactions
inner join merchant on transactions.id_merchant = merchant.id

where transactions.amount<=2
group by merchant.name
order by  count(transactions.amount) DESC
limit 5)
