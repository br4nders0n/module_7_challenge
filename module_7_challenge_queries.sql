-- Data Analysis: Part 1 

--- How can you isolate (or group) the transactions of each cardholder?
SELECT card_holder.name, credit_card.id_card_holder, transaction.card, SUM(amount) as total_amount_per_person
FROM transaction 
LEFT JOIN credit_card ON transaction.card = credit_card.card
LEFT JOIN card_holder ON credit_card.id_card_holder = card_holder.id
GROUP BY transaction.card, credit_card.id_card_holder, card_holder.name;

-- Count the transactions that are less than $2.00 per cardholder.
SELECT card_holder.name, credit_card.id_card_holder, transaction.card, COUNT(CASE WHEN transaction.amount <2 THEN 1 ELSE NULL END) as transactions_less_than_$2
FROM transaction 
LEFT JOIN credit_card ON transaction.card = credit_card.card
LEFT JOIN card_holder ON credit_card.id_card_holder = card_holder.id
GROUP BY transaction.card, credit_card.id_card_holder, card_holder.name
ORDER BY transactions_less_than_$2 DESC;
--Source - count case statement - https://stackoverflow.com/questions/17975229/using-sql-count-in-a-case-statement

-- Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made.
SELECT date, amount
FROM transaction
WHERE EXTRACT(HOUR FROM date) BETWEEN 7 AND 8 
ORDER BY amount DESC
LIMIT 100;
--Source - extract statement - https://modern-sql.com/feature/extract

--What are the top 5 merchants prone to being hacked using small transactions?
SELECT merchant.id, merchant.name, COUNT(transaction.amount) as merchant_number_small_transactions
FROM transaction 
JOIN merchant ON transaction.id_merchant = merchant.id
WHERE transaction.amount <2
GROUP BY merchant.id, merchant.name
ORDER BY COUNT(transaction.amount) DESC
LIMIT 5;

-- Data Analysis: Part 2

-- Query #1 for Jupyter Notebook
SELECT card_holder.id, transaction.date, transaction.amount
FROM card_holder 
INNER JOIN credit_card ON card_holder.id = credit_card.id_card_holder
INNER JOIN transaction ON credit_card.card = transaction.card;

-- Query #2 for Jupyter Notebook
SELECT date_part('month', t.date) AS month, date_part('day', t.date) as day, t.amount
FROM transaction AS t
JOIN credit_card AS cc ON cc.card = t.card
JOIN card_holder AS ch ON ch.id = cc.id_card_holder
WHERE ch.id = 25 AND date_part('month', t.date) <= 6
ORDER BY month, day;