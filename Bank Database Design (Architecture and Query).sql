
----1.	Create a database for a banking application called “Bank?
create database Bank

use Bank

---2. create tables
---the talbes without fk

--A1
create table UserSecurityQuestions
(
UserSecurityQuestionID int not null primary key, 
UserSecurityQuestion varchar(50) not null
)

--A2
create table SavingsInterestRates
(
InterestSavingsRateID int not null primary key, 
InterestSavingsRateValue numeric(9,9),
InterestSavingsRateDescription varchar(20) not null 
)

---A3
create table FailedTransactionErrorType
(
FailedTransactionErrorTypeID int not null primary key, 
FailedTransactionErDescription varchar(50) not null 
)

---A4
create table AccountType
(
AccountTypeID int not null primary key, 
AccountTypeDescription varchar(30) not null 
)

---A5
create table AccountStatusType
(
AccountStatusTypeID int not null primary key, 
AccountStatusTypeDescription varchar(30) not null 
)

---A6
create table LoginErrorLog
(
ErrorLogID int not null primary key, 
ErrorTime datetime not null,
FailedTransactionXML nvarchar(30) not null 
)

---A7
create table TransactionType
(
TransactionTypeId int not null primary key, 
TransactionTypeName char(10) not null,
TransactionTypeDescription varchar(30) not null,
TransactionfeeAmount float
)

---A8
create table Employee
(
EmployeeID int not null primary key, 
EmployeeFirstName varchar(25) not null,
EmployeeMiddleInitial char(1) not null,
EmployeeLastName varchar(25) not null,
EmployeeIsManager int 
)


---A9
create table UserLogins
(
UserLoginID int not null primary key, 
UserLogin char(15) not null,
UserPassword varchar(20) not null 
)
----the tables with fk
---B1
create table UserSecurityAnswers
(
UserLoginID int not null Primary key references UserLogins(UserLoginID), 
UserSecurityAnswer varchar(25) not null,
UserSecurityQuestionId int not null references UserSecurityQuestions(UserSecurityQuestionID)
)

---B2
create table Account
(
AccountID int not null Primary key, 
CurrentBalance int,
AccountTypeID int not null references AccountType(AccountTypeID),
AccountStatusTypeID int not null references AccountStatusType(AccountStatusTypeID),
InterestSavingsRateID int not null references SavingsInterestRates(InterestSavingsRateID)
)

---B3

create table Customer
(
 CustomerID int not null Primary key, 
 CustomerAddress1 varchar(30) not null,
 CustomerAddress2 varchar(30) not null,
 CustomerFirstName varchar(30) not null,
 CustomerMiddleInitial char(1) not null,
 CustomerLastName varchar(30) not null,
 City varchar(20) not null,
 State char(2) not null,
 ZipCode char(10) not null,
 EmailAddress varchar(40) not null,
 HomePhone char(10) not null,
 CellPhone char(10) not null,
 WorkPhone char(10) not null,
 SSN char(9) not null,
 UserLoginID int not null references UserLogins(UserLoginID)
)

---B4

create table OverDraftLog
(
AccountID int not null primary key references Account(AccountID),
OverdraftDate datetime,
OverdraftAmount float,
OverdraftTransactionXML nvarchar(30) not null
)

---B5
create table FailedTransactionLog
(
FailedTransactionID int not null primary key,
FailedTransactionErrorTypeID int not null references FailedTransactionErrorType(FailedTransactionErrorTypeID),
FailedTransactionErrorTime datetime,
FailedTransactionXML nvarchar(30) not null
)

----B6
create table [Customer-Account]
(
 AccountID int not null references Account(AccountID),
 CustomerID int not null references Customer(CustomerID)
)

---B7
create table [Login-Account]
(
 UserLoginID int not null references UserLogins(UserLoginID),
 AccountID int not null references Account(AccountID)
)

---B8
create table TransactionLog
(
TransactionID int not null primary key,
TransactionDate datetime,
TransactionTypeID int not null references TransactionType(TransactionTypeId),
TransactionAmount float,
NewBalance float,
AccountID int not null references Account(AccountID),
CustomerID int not null references Customer(CustomerID),
EmployeeID int not null references Employee(EmployeeID),
UserLoginID int not null references UserLogins(UserLoginID)
)

---insert data into the tables

--A1 Insert data into UserSecurityQuestions table
select * from UserSecurityQuestions

Insert into UserSecurityQuestions values (1, 'USQaa')
Insert into UserSecurityQuestions values (2, 'USQbb')
Insert into UserSecurityQuestions values (3, 'USQcc')
Insert into UserSecurityQuestions values (4, 'USQdd')
Insert into UserSecurityQuestions values (5, 'USQee')

--A2 Insert data into SavingsInterestRates table
select * from SavingsInterestRates

Insert into SavingsInterestRates values (1, 0.5523, 'RateMedium')
Insert into SavingsInterestRates values (2, 0.1067, 'RateLow')
Insert into SavingsInterestRates values (3, 0.2321, 'RateLow')
Insert into SavingsInterestRates values (4, 0.3218, 'RateMedium')
Insert into SavingsInterestRates values (5, 0.6119, 'RateHigh')


---A3  Insert data into FailedTransactionErrorType table
select * from FailedTransactionErrorType

Insert into FailedTransactionErrorType values (1011, 'error')
Insert into FailedTransactionErrorType values (1012, 'Invalid Username')
Insert into FailedTransactionErrorType values (1013, 'Invalid Pin Number')
Insert into FailedTransactionErrorType values (1014, 'Invalid Answer')
Insert into FailedTransactionErrorType values (1015, 'Time Expired Please Try Again')


--A4 Insert data into AccountType table
select * from AccountType

Insert into AccountType values (510, 'Savings')
Insert into AccountType values (520, 'Chequing')
Insert into AccountType values (530, 'Investment')
Insert into AccountType values (540, 'Credit')
Insert into AccountType values (550, 'Other')


--A5 Insert data into AccountStatusType table

select * from AccountStatusType

Insert into AccountStatusType values (701, 'Account is normal')
Insert into AccountStatusType values (702, 'New Account')
Insert into AccountStatusType values (703, 'Accout is changing')
Insert into AccountStatusType values (704, 'Account Exception')
Insert into AccountStatusType values (705, 'Account Freeze')

--A6 Insert data into LoginErrorLog table

select * from LoginErrorLog

Insert into LoginErrorLog values (6001, '2020-05-10 11:40:20', 'XML123')
Insert into LoginErrorLog values (6002, '2019-11-08 20:12:12','XML456')
Insert into LoginErrorLog values (6003, '2020-05-23 12:56:38', 'XML789')
Insert into LoginErrorLog values (6004, '2020-07-19 09:11:56', 'XML101112')
Insert into LoginErrorLog values (6005, '2019-03-21 16:27:21', 'XML131415')


--A7 Insert data into TransactionType table
select * from TransactionType

Insert into TransactionType values (1701, 'TransTN_aa', 'Fee123', 10)
Insert into TransactionType values (1702, 'TransTN_bb','Fee456', 20)
Insert into TransactionType values (1703, 'TransTN_cc', 'Fee789', 30)
Insert into TransactionType values (1704, 'TransTN_dd', 'Fee101112', 40)
Insert into TransactionType values (1705, 'TransTN_ee', 'Fee131415', 50)


--A8 Insert data into Employee table
select * from Employee

Insert into Employee values (808001, 'Mike', 'W','Bush', 1)
Insert into Employee values (808002, 'Jack','N','Hale', 0)
Insert into Employee values (808003, 'Jean', 'M','Pattinson', 1)
Insert into Employee values (808004, 'Mary', 'T', 'White', 1)
Insert into Employee values (808005, 'Cathy', 'J', 'Brown', 0)

--A9 Insert data into UserLogins table
select * from UserLogins

Insert into UserLogins values (9001, 'AAA', 'a1a1a1a1')
Insert into UserLogins values (9002, 'BBB', 'b2b2b2b2')
Insert into UserLogins values (9003, 'CCC', 'c3c3c3c3')
Insert into UserLogins values (9004, 'DDD', 'd4d4d4d4')
Insert into UserLogins values (9005, 'EEE', 'e5e5e5e5')
Insert into UserLogins values (9006, 'FFF', 'f6f6f6f6')
Insert into UserLogins values (9007, 'GGG', 'g7g7g7g7')

--B1 Insert data into UserSecurityAnswers table
select * from UserSecurityAnswers

Insert into UserSecurityAnswers values (9001, 'USA_AAA', 2)
Insert into UserSecurityAnswers values (9002, 'USA_BBB', 1)
Insert into UserSecurityAnswers values (9003, 'USA_CCC', 3)
Insert into UserSecurityAnswers values (9004, 'USA_DDD', 3)
Insert into UserSecurityAnswers values (9005, 'USA_EEE', 5)
Insert into UserSecurityAnswers values (9006, 'USA_FFF', 4)
Insert into UserSecurityAnswers values (9007, 'USA_GGG', 2)


--B2 Insert data into Account table
select * from Account

Insert into Account values (22001, 4000, 520, 701, 2)
Insert into Account values (22002, 3800, 530, 705, 4)
Insert into Account values (22003, 5600, 510, 703, 1)
Insert into Account values (22004, 7000, 520, 702, 5)
Insert into Account values (22005, 1900, 550, 704, 5)
Insert into Account values (22006, 6500, 520, 702, 3)
Insert into Account values (22007, 7900, 510, 701, 2)

--B3 Insert data into Customer table
select * from Customer

Insert into Customer values (32001, 'CAdd1_a', 'CAdd2_X', 'Rona', 'S', 'Franklin','Ottawa', 'ON','H3Z 2Y7',  'RR@','111-2233','100-2000', '322-3222', 'SSN1', 9001)
Insert into Customer values (32002, 'CAdd1_b', 'CAdd2_Y', 'Edward', 'T', 'Martin', 'Vancouver', 'BC', 'B5S 6N3', 'EE@', '222-3344','300-4000', '655-6555','SSN2', 9002)
Insert into Customer values (32003, 'CAdd1_c', 'CAdd2_z', 'Tom', 'D', 'Cooper', 'Duncan','BC','J7D 8V2E','TT@','333-4466', '500-6000', '733-7333','SSN3', 9003)
Insert into Customer values (32004, 'CAdd1_d', 'CAdd2_r','Shelly', 'W', 'Thompson', 'Toronto', 'ON','L6T 2R9', 'SS@','555-6677', '700-8000', '855-8555', 'SSN4', 9004)
Insert into Customer values (32005, 'CAdd1_e', 'CAdd2_s','Hellen', 'w', 'Cheers', 'Waterloo', 'ON','I3K 3M1', 'HH@', '666-7788','900-1000', '922-9222', 'SSN5', 9005)
Insert into Customer values (32006, 'CAdd1_f', 'CAdd2_t','Joan', 'D', 'Washinton', 'Toronto', 'ON','A3K 2J6', 'JJ@', '555-7788','300-1000', '822-7222', 'SSN6', 9006)
Insert into Customer values (32007, 'CAdd1_g', 'CAdd2_u','Will', 'T', 'Trump', 'Markham', 'ON','S36 8J9', 'ww@', '111-7788','470-1000', '653-7222', 'SSN7', 9007)
--B4 Insert data into OverDraftLog table
select * from OverDraftLog

Insert into OverDraftLog values (22001, '2021-03-15', 1867, 'OT_XML1')
Insert into OverDraftLog values (22002, '2021-01-23', 2980, 'OT_XML2')
Insert into OverDraftLog values (22003, '2021-02-16', 3358, 'OT_XML3')
Insert into OverDraftLog values (22004, '2021-04-09', 2719, 'OT_XML4')
Insert into OverDraftLog values (22005, '2021-02-27', 572, 'OT_XML5')

--B5 Insert data into FailedTransactionLog table
select * from FailedTransactionLog

Insert into FailedTransactionLog values (5201, 1011, '2021-04-15', 'FT_XML1')
Insert into FailedTransactionLog values (5202, 1011, '2021-01-25', 'FT_XML2')
Insert into FailedTransactionLog values (5203, 1012, '2021-01-30', 'FT_XML3')
Insert into FailedTransactionLog values (5204, 1015, '2021-03-07', 'FT_XML4')
Insert into FailedTransactionLog values (5205, 1013, '2021-03-22', 'FT_XML5')


--B6 Insert data into Customer_Account table
select * from [Customer-Account]

Insert into [Customer-Account] values (22001, 32004)
Insert into [Customer-Account] values (22002, 32003)
Insert into [Customer-Account] values (22003, 32002)
Insert into [Customer-Account] values (22004, 32002)
Insert into [Customer-Account] values (22005, 32001)
Insert into [Customer-Account] values (22002, 32001)
Insert into [Customer-Account] values (22004, 32005)
Insert into [Customer-Account] values (22003, 32001)
Insert into [Customer-Account] values (22006, 32006)
Insert into [Customer-Account] values (22007, 32007)

--B7 Insert data into Login-Account table
select * from [Login-Account]

Insert into [Login-Account] values (9001, 22001)
Insert into [Login-Account] values (9004, 22001)
Insert into [Login-Account] values (9003, 22004)
Insert into [Login-Account] values (9002, 22002)
Insert into [Login-Account] values (9005, 22003)
Insert into [Login-Account] values (9003, 22005)
Insert into [Login-Account] values (9006, 22005)
Insert into [Login-Account] values (9007, 22002)


--B8 Insert data into TransactionLog table
select * from TransactionLog

Insert into TransactionLog values (8201, '2020-12-6', 1703, 503, 2703, 22001, 32003, 808003, 9001)
Insert into TransactionLog values (8202, '2020-11-2', 1705, 430, 5630, 22005, 32005, 808001, 9003)
Insert into TransactionLog values (8203, '2020-01-17', 1702, 1009, 8320, 22001, 32003, 808003, 9004)
Insert into TransactionLog values (8204, '2020-06-20', 1702, 280, 4500, 22003, 32002, 808001, 9002)
Insert into TransactionLog values (8205, '2020-09-12', 1701, 935, 9179, 22001, 32003, 808002, 9005)


----phase 2
use bank


---Q1 Create a view to get all customers with checking account from ON province
select * from Customer
select * from Account
select * from AccountType
select * from [Customer-Account]

create view customer_ckAcc_ON
as
select CustomerFirstName, CustomerMiddleInitial, CustomerLastName, state, AccountTypeDescription
from Customer
join [Customer-Account]
on Customer.CustomerID = [Customer-Account].CustomerID
join Account
on [Customer-Account].AccountID = Account.AccountID
join AccountType
on Account.AccountTypeID = AccountType.AccountTypeID
where Customer.State = 'ON' and AccountType.AccountTypeDescription = 'Chequing'

select * from customer_ckAcc_ON

----Q2 Create a view to get all customers with total account balance greater than 5000

select * from Customer
select * from Account
select * from [Customer-Account]

create view customer_AccBalance
as
select CustomerFirstName, CustomerMiddleInitial, CustomerLastName, sum(CurrentBalance) as Total_Balance
from Customer
join [Customer-Account]
on [Customer-Account].CustomerID = Customer.CustomerID
join Account
on [Customer-Account].AccountID = Account.AccountID
group by customer.CustomerID, CustomerFirstName, CustomerMiddleInitial, CustomerLastName
having sum(Account.CurrentBalance) > 5000

select * from customer_AccBalance

---Q3 Create a view to get counts of checking and savings accounts by customer.
select * from Customer
select * from Account
select * from [Customer-Account]
select * from AccountType

create view customerAccount_Number
as
select CustomerFirstName, CustomerMiddleInitial, CustomerLastName, AccountTypeDescription, count(AccountTypeDescription) as Number_CustomerAccount
from Customer
join [Customer-Account]
on [Customer-Account].CustomerID = Customer.CustomerID
join Account
on [Customer-Account].AccountID = Account.AccountID
join AccountType
on Account.AccountTypeID = AccountType.AccountTypeID
group by Customer.CustomerID, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, AccountTypeDescription
having AccountType.AccountTypeDescription = 'chequing' or AccountType.AccountTypeDescription = 'savings'



select * from customerAccount_Number order by CustomerFirstName


---Q4 Create a view to get any particular user’s login and password using AccountId. 

select * from Account
select * from UserLogins
select * from [Login-Account]

create view User_Login
as
select Account.AccountID, userlogins.userlogin, userlogins.UserPassword
from [Login-Account]
join UserLogins
on [Login-Account].UserLoginID = UserLogins.UserLoginID
join Account 
on Account.AccountID = [Login-Account].AccountID
group by Account.AccountID, userlogins.userlogin, userlogins.UserPassword

select * from User_Login 


---Q5 Create a view to get all customers?overdraft amount. 


select * from Account
select * from [Customer-Account]
select * from Customer
select * from OverDraftLog


create view customer_overdraftAmount
as
select CustomerFirstName, CustomerMiddleInitial, CustomerLastName, Sum(OverDraftLog.overdraftAmount) as Customer_OverdraftAmount
from Account
join [Customer-Account]
on [Customer-Account].AccountID = Account.AccountID
join Customer
on Customer.CustomerID = [Customer-Account].CustomerID
join OverDraftLog
on Account.AccountID = OverDraftLog.AccountID
group by CustomerFirstName, CustomerMiddleInitial, CustomerLastName

select * from customer_overdraftAmount


---Q6 Create a stored procedure to add “User_?as a prefix to everyone’s login (username).

select * from UserLogins

Create Procedure Addprefix_Userlogin
as
Begin
   select UserLogin, 'User_' + Userlogin as UserName from UserLogins
 
End 

execute Addprefix_Userlogin

---Q7 Create a stored procedure that accepts AccountId as a parameter and returns customer’s full name. 
select * from Customer
select * from [Customer-Account]


Create Procedure spGetCustomerFullnameByAccountId
@AccountId int,
@CustomerFullname nvarchar(30) Output
as
Begin
  Select @CustomerFullname = CustomerFirstName+'.'+CustomerMiddleInitial+'.'+CustomerLastName
   from Customer
   join [Customer-Account]
   on Customer.CustomerID = [Customer-Account].CustomerID
   where [Customer-Account].AccountID = @AccountId
End 

Declare @CustomerFullname nvarchar(30)
Execute spGetCustomerFullnameByAccountId 22002, @CustomerFullname out
Print 'CustomerFullname = ' + @CustomerFullname


---Q8 Create a stored procedure that takes a deposit as a parameter and updates CurrentBalance value for that particular account. 
select * from Account

Create Procedure spUpdateCurrentBalance_deposit
@Deposit int, @AccountID int
as
Begin
   Update Account set CurrentBalance = CurrentBalance + @Deposit 
   where AccountID = @AccountID
End 

Execute spUpdateCurrentBalance_deposit 2500, 22001


---Q9 Create a stored procedure that takes a withdrawal amount as a parameter and updates CurrentBalance value for that particular account.

select * from Account

Create Procedure spUpdateCurrentBalance_withdraw
@Deposit int, @AccountID int
as
Begin
   Update Account set CurrentBalance = CurrentBalance - @Deposit 
   where AccountID = @AccountID
End 

Execute spUpdateCurrentBalance_withdraw 2500, 22001

---Q10 Write a query to remove SSN column from Customer table. 

---create a new query

use bank

select * from Customer

alter table Customer drop column SSN

select * from Customer