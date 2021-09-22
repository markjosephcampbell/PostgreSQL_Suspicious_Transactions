/* All transactions between 7am and 9am
*/
SELECT id, amount, date FROM transactions where date_part('hour', date)>7 and date_part('hour', date) <9
/* Transactions of less than 2 $ aggregated by card holder and that happened between 7 and 9 */
SELECT  card_holder.name, count(amount) FROM card_holder 
inner join credit_card  on card_holder.id = credit_card.cardholder_id 
inner join transactions on transactions.card= credit_card.card
where transactions.amount<2 and  (date_part('hour', transactions.date)>7 and date_part('hour', transactions.date) <9)
group by card_holder.name
