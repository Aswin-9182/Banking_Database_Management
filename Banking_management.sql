
create database bankingdb;
use bankingdb;
select database();

#1. branches table
create table branches(branch_id int primary key,
branch_name varchar(100) not null,
location varchar(100) not null
);
alter table branches add column ifsc_code varchar(20) not null default '';
select * from branches;

-- 2. customers table
create table customers(
customer_id int primary key,
customer_name varchar(100) not null,
phone varchar(15),
email varchar(100),
address varchar(255)
);

-- 3. account types table
create table account_types(
account_type_id int primary key,
account_type_name varchar(50) not null
);

-- 4. accounts table
create table accounts(
account_id int primary key,
branch_id int not null,
customer_id int not null,
account_type_id int not null,
account_number varchar(20) unique not null,
balance decimal(12,2) not null default 0.00,
opening_date date not null,
status varchar(20) not null default 'Active',
foreign key(branch_id) references branches(branch_id),
foreign key(customer_id) references customers(customer_id),
foreign key(account_type_id) references account_types(account_type_id),
check(balance>=0),
check(status in('Active','Inactive'))
);

-- 5. transactions table
create table transactions(
transaction_id int primary key,
account_id int not null,
transaction_type varchar(20) not null,
amount decimal(12,2) not null,
transaction_date date not null,
description varchar(255),
foreign key(account_id) references accounts(account_id),
check(amount>0),
check(transaction_type in('Deposit','Withdrawal','Transfer'))
);

-- insert values to the tables
insert into branches values
(1,'MG Road','Bengaluru','IFSC001'),
(2,'Banjara Hills','Hyderabad','IFSC002'),
(3,'Governorpet','Vijayawada','IFSC003'),
(4,'Dwaraka Nagar','Vizag','IFSC004'),
(5,'Brodipet','Guntur','IFSC005');

insert into branches(branch_id,branch_name,location,ifsc_code) values
(6,'Nellore Branch','Nellore','IFSC006'),
(7,'Kurnool Branch','Kurnool','IFSC007'),
(8,'Ongole Branch','Ongole','IFSC008'),
(9,'Warangal Branch','Warangal','IFSC009'),
(10,'Chennai Branch','Chennai','IFSC010');
select * from branches;

insert into customers values
(1,'Aarav','9000000001','aarav@mail.com','Bengaluru'),
(2,'Bhavya','9000000002','bhavya@mail.com','Hyderabad'),
(3,'Charan','9000000003','charan@mail.com','Vijayawada'),
(4,'Deepika','9000000004','deepika@mail.com','Vizag'),
(5,'Esha','9000000005','esha@mail.com','Guntur'),
(6,'Farhan','9000000006','farhan@mail.com','Nellore'),
(7,'Gopi','9000000007','gopi@mail.com','Kurnool'),
(8,'Hari','9000000008','hari@mail.com','Ongole'),
(9,'Isha','9000000009','isha@mail.com','Warangal'),
(10,'John','9000000010','john@mail.com','Chennai');
select * from customers;

insert into account_types values
(1,'Savings'),(2,'Current');
select * from account_types;

insert into accounts values
(101,1,1,1,'100000001',25000,'2025-01-01','Active'),
(102,2,2,1,'100000002',50000,'2025-01-02','Active'),
(103,2,2,2,'200000003',120000,'2025-01-03','Active'),
(104,3,3,1,'100000004',35000,'2025-01-04','Active'),
(105,4,4,1,'100000005',65000,'2025-01-05','Active'),
(106,4,4,2,'200000006',150000,'2025-01-06','Active'),
(107,5,5,2,'200000007',90000,'2025-01-07','Active'),
(108,6,1,1,'100000008',18000,'2025-01-08','Inactive'),
(109,7,2,1,'100000009',27000,'2025-01-09','Active'),
(110,8,3,2,'200000010',78000,'2025-01-10','Active'),
(111,9,4,1,'100000011',45000,'2025-01-11','Active'),
(112,9,4,2,'200000012',99000,'2025-01-12','Active'),
(113,10,5,1,'100000013',60000,'2025-01-13','Active'),
(114,1,1,2,'200000014',85000,'2025-01-14','Active'),
(115,3,3,2,'200000015',110000,'2025-01-15','Active');
select * from accounts;

insert into transactions values
(1001,101,'Deposit',1000,'2025-07-01','Sample Deposit'),
(1002,102,'Withdrawal',6000,'2025-07-02','Sample Withdrawal'),
(1003,103,'Transfer',11000,'2025-07-03','Sample Transfer'),
(1004,104,'Deposit',16000,'2025-07-04','Sample Deposit'),
(1005,105,'Withdrawal',21000,'2025-07-05','Sample Withdrawal'),
(1006,106,'Transfer',26000,'2025-07-06','Sample Transfer'),
(1007,107,'Deposit',31000,'2025-07-07','Sample Deposit'),
(1008,108,'Withdrawal',36000,'2025-07-08','Sample Withdrawal'),
(1009,109,'Transfer',41000,'2025-07-09','Sample Transfer'),
(1010,110,'Deposit',46000,'2025-07-10','Sample Deposit'),
(1011,111,'Withdrawal',1000,'2025-07-11','Sample Withdrawal'),
(1012,112,'Transfer',6000,'2025-07-12','Sample Transfer'),
(1013,113,'Deposit',11000,'2025-07-13','Sample Deposit'),
(1014,114,'Withdrawal',16000,'2025-07-14','Sample Withdrawal'),
(1015,115,'Transfer',21000,'2025-07-15','Sample Transfer'),
(1016,101,'Deposit',26000,'2025-07-16','Sample Deposit'),
(1017,102,'Withdrawal',31000,'2025-07-17','Sample Withdrawal'),
(1018,103,'Transfer',36000,'2025-07-18','Sample Transfer'),
(1019,104,'Deposit',41000,'2025-07-19','Sample Deposit'),
(1020,105,'Withdrawal',46000,'2025-07-20','Sample Withdrawal'),
(1021,106,'Transfer',1000,'2025-07-21','Sample Transfer'),
(1022,107,'Deposit',6000,'2025-07-22','Sample Deposit'),
(1023,108,'Withdrawal',11000,'2025-07-23','Sample Withdrawal'),
(1024,109,'Transfer',16000,'2025-07-24','Sample Transfer'),
(1025,110,'Deposit',21000,'2025-07-25','Sample Deposit'),
(1026,111,'Withdrawal',26000,'2025-07-26','Sample Withdrawal'),
(1027,112,'Transfer',31000,'2025-07-27','Sample Transfer'),
(1028,113,'Deposit',36000,'2025-07-28','Sample Deposit'),
(1029,114,'Withdrawal',41000,'2025-07-29','Sample Withdrawal'),
(1030,115,'Transfer',46000,'2025-07-30','Sample Transfer');
select * from transactions;

#1. list all customer details
select * from customers;

# 2. display all active bank accounts
select * from accounts where status='Active';

# 3. change an account status from active to inactive
update accounts set status='Inactive' where account_id=101 and status='Active';

# 4. display customer names with account numbers and account types
select c.customer_name,a.account_number,at.account_type_name from customers c
join accounts a on c.customer_id=a.customer_id
join account_types at on a.account_type_id=at.account_type_id;

#5. display account number, branch name, and branch city
select a.account_number,b.branch_name,b.location as branch_city from accounts a join branches b on a.branch_id=b.branch_id;

#6. find customers with the highest account balance
select c.customer_name,a.account_number,a.balance from customers c
join accounts a on c.customer_id=a.customer_id where a.balance=(select max(balance) from accounts);

# 7. concatenate customer name with account number
select concat(c.customer_name,' - ',a.account_number) as customer_account from customers c
join accounts a on c.customer_id=a.customer_id;

# 8. display the ceiling and floor of every transaction amount
select transaction_id,amount,ceiling(amount) as ceiling_value,floor(amount) as floor_value from transactions;

# 9. find the absolute difference between opening balance and current balance
select abs(amount-balance) as absolute_difference from transactions
join accounts on accounts.account_id=transactions.account_id;

#10. display all customers and the branches where they hold accounts
select c.customer_name,a.account_number,at.account_type_name as account_type,b.branch_name,b.location as branch_city from customers c
left join accounts a on c.customer_id=a.customer_id
left join account_types at on a.account_type_id=at.account_type_id
left join branches b on a.branch_id=b.branch_id;

#11. calculate total deposits by branch
select b.branch_name,b.branch_id,sum(t.amount) as total_deposits from branches b
join accounts a on b.branch_id=a.branch_id
join transactions t on a.account_id=t.account_id
where t.transaction_type='Deposit' group by b.branch_id,b.branch_name;

# 12. find the total balance available across all accounts
select sum(balance) as total_balance from accounts;

#13. find the highest, lowest, and average account balance
select max(balance) as highest_balance,min(balance) as lowest_balance,round(avg(balance),2) as average_balance from accounts;

#14. calculate total deposits and withdrawals
select sum(case when transaction_type='Deposit' then amount else 0 end) as total_deposits,
sum(case when transaction_type='Withdrawal' then amount else 0 end) as total_withdrawals from transactions;

#15. show branch-wise customer count
select b.branch_name,count(distinct a.customer_id) as customer_count from branches b left join accounts a on b.branch_id=a.branch_id group by b.branch_id,b.branch_name;

#16. count savings and current accounts
select at.account_type_name,count(a.account_id) as account_count from account_types at
left join accounts a on at.account_type_id=a.account_type_id
group by at.account_type_id,at.account_type_name;

#17. find customers who own more than one account
select c.customer_id,c.customer_name,count(a.account_id) as total_accounts from customers c
join accounts a on c.customer_id=a.customer_id group by c.customer_id,c.customer_name having count(a.account_id)>1;

# 18. find the latest transaction for each account
select t.* from transactions t where t.transaction_date=(select max(t2.transaction_date) from transactions t2 where t2.account_id=t.account_id);

#19. find the customer(s) having the highest account balance
select c.customer_id,c.customer_name,a.account_number,a.balance from customers c join accounts a on c.customer_id=a.customer_id where a.balance=(select max(balance) from accounts);

#20. display accounts whose balance exceeds the average balance
select account_id,account_number,balance from accounts where balance>(select avg(balance) from accounts);

#21. show monthly transaction totals with month name and rounded total
select year(transaction_date) as transaction_year,monthname(transaction_date) as month_name,round(sum(amount),2) as monthly_total from transactions
group by year(transaction_date),month(transaction_date),monthname(transaction_date) order by transaction_year,month(transaction_date);

#22. find customers who have never made any transaction
select c.customer_id,c.customer_name from customers c where not exists(select 1 from accounts a join transactions t on a.account_id=t.account_id where a.customer_id=c.customer_id);

# 23. display inactive accounts
select * from accounts where status='Inactive';

#24. list the top 5 accounts by balance
select account_id,account_number,balance from accounts order by balance desc limit 5;

# 25. count transaction by type
select transaction_type,count(*) as transaction_count from transactions group by transaction_type;

# generate monthly transaction summaries
select year(transaction_date) as transaction_year,monthname(transaction_date) as month_name,count(*) as transaction_count,
sum(case when transaction_type='Deposit' then amount else 0 end) as total_deposits,
sum(case when transaction_type='Withdrawal' then amount else 0 end) as total_withdrawals,
sum(case when transaction_type='Transfer' then amount else 0 end) as total_transfers,
round(sum(amount),2) as total_transaction_amount from transactions
group by year(transaction_date),month(transaction_date),monthname(transaction_date) order by transaction_year,month(transaction_date);

#27. display account balances branch-wise
select b.branch_name,b.location as branch_city,count(a.account_id) as account_count,coalesce(sum(a.balance),0) as total_balance
from branches bleft join accounts a on b.branch_id=a.branch_id group by b.branch_id,b.branch_name,b.location;

# 28. display customer names in uppercase with rounded account balance
select upper(c.customer_name) as customer_name,a.account_number,round(a.balance,0) as rounded_balance
from customers join accounts a on c.customer_id=a.customer_id;

# 29. create a view for active accounts with customer and branch details
create or replace view active_account_details as
select a.account_id,a.account_number,c.customer_id,c.customer_name,at.account_type_name,a.balance,a.opening_date,a.status,
b.branch_name,b.location as branch_city,b.ifsc_code from accounts a
join customers c on a.customer_id=c.customer_id
join account_types at on a.account_type_id=at.account_type_id 
join branches b on a.branch_id=b.branch_id where a.status='Active';
select * from active_account_details;

#task 30: transfer ₹10,000 between two accounts
call transfer_money(101,102,10000.00);
select account_id,account_number,balance from accounts where account_id in(101,102);

#task 31: procedure to display accounts for a customer
call get_customer_accounts(1);

#task 32: procedure to display transactions for an account
call get_account_transactions(101);

#task 33: create a trigger to log new transactions

create table if not exists transaction_log(log_id int auto_increment primary key,transaction_id int not null,
account_id int not null,transaction_type varchar(20) not null,amount decimal(12,2) not null,transaction_date date not null,logged_at timestamp default current_timestamp);
select * from transaction_log;
insert into transactions_log values(1031,101,'Deposit',1000,'f2025-07-01','Sample Transfer');

-- task 34: create a trigger to prevent negative account balances
update accounts set balance=-500 where account_id=101;