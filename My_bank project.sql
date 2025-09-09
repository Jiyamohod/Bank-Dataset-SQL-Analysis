create database mybankdb;
use mybankdb;
select * from customers;
select * from Accounts;
select * from Transactions;
select * from Loans;
select * from Creditcards;
select * from branches;
select * from Atms;

select count(*) as totalcustomers from customers;
select count(*) as totalAccount from Accounts;
select count(*) as totalcustomers from Transactions;
select sum(amount) as totalloansamount from Loans;
select sum(creditlimit) as totalcreditlimit from Creditcards;

select * from accounts where status='Active';
select * from Transactions where transactionDate>'2023-01-15';
select * from loans where interestRate > 5.0;
select * from creditcards where Balance > Creditlimit;

select c.customerId, c.name ,c.age,a.AccountNumber, a.accountType,a.Balance
from customers c
join Accounts a on c.customerid=a.customerID;

select t.transactionid,t.transactiondate,t.Amount,t.Type,t.Description,a.AccountNumber,a.AccountType,c.Name AS CustomerName
from Transactions t
join accounts a on t.AccountNumber=a.AccountNumber
join customers c ON a.customerID=c.CustomerID; 

select c.Name,l.Amount as loanAmount
from customers c
join Loans l on c.customerID=l.customerID
order by l.Amount DESC
limit 10;

set SQL_SAFE_UPDATES = 0;
delete from accounts
where status='Inactive';

select c.customerid,c.name,count(a.accountnumber) as numaccounts
from customers c
join accounts a on c.customerid=a.customerid
group by c.customerid,c.name
having count(a.accountnumber)>1;
select substring(Name,1,3) as firstthreecharactersofname
from customers;
select substring_index(Name,' ',1) as FistName,
substring_index(Name,' ',-1) as LastName
from customers;

select * from customers
where mod(customerid,2)!=0;

select distinct amount
from loans L1
where 5=(
select count(distinct Amount)
from loans L2
where L2.amount>=L1.amount);

select max(amount) as secoundhighestloan
from loans
where amount <(
select max(Amount)
from loans
);

select customerid
from accounts
where status='inactive';

select * from customers
limit 1;

select now()  as currentdatetime;
create table customersclone like customers;
insert into customersclone select * from customers;
select customerid,
datediff(enddate,curdate()) as DaysRemaining 
from loans
where EndDate > Curdate();
select accountnumber,max(transactiondate) as latesttransactiondate
from transactions
group by accountnumber;
select avg(age) as averageage
from customers;
select accountnumber,balance
from accounts
where balance < 25000
and opendate <='2022-01-01';
select * from loans
where enddate >=curdate()
and status='Active';
select accountnumber,sum(amount) as totalamount
from transactions
where month(transactiondate)=6
and year(transactiondate)=2023
group by accountnumber;
select customerid,avg(balance) as averagecreditcardbalance
from creditcards
group by customerid;
select location,count(*) as numberofinactiveatms
from atms
where status='out of service'
group by location;
select name,age,
case when age<30 then 'below 30'
when age between 30 and 60 then '30 to 60'
else 'above 60'
end as age_group
from customers;
  

 
