use bank;


-- Query 1

select client_id, district_id from client
order by district_id asc
limit 5;

-- Query 2

select max(client_id), district_id from client
where district_id = 72;

-- Query 3

select amount from loan
order by amount
limit 3;

-- Query 4

select distinct status from loan
order by status;

-- Query 5

select loan_id from loan
where payments = max(payments);

-- 6

select account_id, amount from loan
order by account_id
limit 5;

-- 7


select account_id from loan
where duration = 60
order by amount
limit 5;

-- 8

select distinct k_symbol from bank.order;

-- 9

select order_id from bank.order
where account_id = 34;

-- 10

select distinct(account_id) from bank.order
where order_id > 29540 and order_id <= 29560;

-- 11

select * from bank.order;

select amount from bank.order
where account_to = 30067122;

-- 12

select * from trans;

select trans_id, date, type, amount from trans
where account_id = 793
order by date desc;

-- 13 

select district_id, count(district_id) from client
where district_id < 10
group by district_id
order by district_id asc;

-- 14

select card.type, count(card_id) from card
group by card.type;

-- 15

select * from loan;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select account_id, sum(amount) from loan
group by account_id, amount
order by amount desc
limit 10;

-- 16

select date, count(loan_id) from loan
where date < 930907
group by date;

-- 17 the results are almost the same but the order not ?

select date_format(convert(date,date), '%Y-%M-%D'), duration from loan
where date_format(convert(date,date), '%Y-%M-%D') regexp 'December'
order by date, duration asc;

-- 18

select account_id, type, sum(amount) from trans
where account_id = 396
group by type;

-- 19 I only have here 'incoming' but I do not see why because the results are separeted so sql understand that the types are different

select account_id, sum(amount),
case
when type = 'VYDAJ' then 'outgoing'
else 'incoming'
end as 'type'
from trans
where account_id = 396
group by type;

-- 20

select account_id, sum(amount)









