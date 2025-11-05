/*High Value cash Identify accounts that conducted individual cash withdrawals of $15,000 or more.	High-value cash withdrawal detection*/


Select
	account_id,
	transaction_date,
	customer_id
from dbo.transactions_sample
where transaction_type in ('CASH_DEPOSIT', 'CASH_WITHDRAWAL')
AND transaction_amount>=$15000;


/*Identify customers who made 5 or more cash deposits within 7 consecutive days totaling over $25,000*/

Select
	account_id
from transactions_sample
where transaction_type= 'cash_deposit'
group by account_id
having sum(transaction_amount)>25000
AND DATEDIFF(DAY, MIN(transaction_date), MAX(transaction_date)) <= 7;

--Detect accounts that made outgoing wire transfers to high-risk countries (based on country_risk_score > 7).
SELECT
    account_id,
    transaction_type,
   sum(cast(transaction_amount as decimal (18,2))) AS total_wire_amount
FROM transactions_sample
WHERE transaction_type = 'WIRE_TRANSFER'
  AND country_risk_score > 20
group BY account_id,transaction_type;


