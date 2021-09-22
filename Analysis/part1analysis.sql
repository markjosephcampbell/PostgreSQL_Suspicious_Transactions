/* Isolate transactions of each cardholder */

SELECT card_holder.id, card_holder.name, credit_card.card, transactions.amount FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2
group by card_holder.name

/* count of transactons< 2*/

SELECT  card_holder.name, count(amount) FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2
group by card_holder.name

/*Potentially Fraudulent transactions card holder with more than 5 transactions< 2*/

SELECT  card_holder.name, count(amount) FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2
group by card_holder.name
HAVING count(amount)>5