SELECT * FROM sales.transactions;

SELECT *FROM  transactions WHERE   market_code = 'Mark001';

SELECT sum(sales_amount)
 FROM transactions
 WHERE market_code = 'Mark001';
 
select distinct product_code 
 from transactions 
 where market_code = 'Mark001' ;
 
 select *
 from transactions
 where currency = 'USD' ;
 
 
 
 
