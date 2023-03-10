-- Creation of Beacat Bank Schema
Create SCHEMA Bearcat_Bank;
USE Bearcat_Bank;

-- Drop Schema

-- DROP SCHEMA Bearcat_Bank;

-- For reference, IDs
-- Customer: 10000
-- Application: 1000
-- Employee: 5000
-- Transaction: 500

-- Creation of Bearcat Bank Tables

-- Drop Table

-- DROP TABLE tb_Employee;

Create Table CustomerProfile (
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
Password VARCHAR(50) NOT NULL,
CustomerName VARCHAR (30) NOT NULL,
CustomerPhoneNumber VARCHAR (50) NOT NULL,
CustomerEmail VARCHAR (50) NOT NULL,
CustomerStatus VARCHAR(50) NOT NULL,
CustomerProfileDate Date NOT NULL,
CardType VARCHAR(20),
CardNumber VARCHAR(50),
CardExpiryDate DATE
)AUTO_INCREMENT=10000;


Create Table tb_Account (
AccountID INT AUTO_INCREMENT not null unique,
AccountBalance Int NOT NULL,
RountingNum VARCHAR (50) NOT NULL,
AccountType VARCHAR (50) NOT NULL,
CustomerID int NOT NULL,
Primary Key (AccountID),
foreign key (CustomerID) references CustomerProfile(CustomerID)
)AUTO_INCREMENT=200000;

create table tb_Employee (
EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
EmployeeName VARCHAR(50) NOT NULL,
EmployeeType VARCHAR(40) NOT NULL,
EmpPhoneNum INT NOT NULL,
EmpEmailAddress VARCHAR(70) NOT NULL,
BuildingNumber INT NOT NULL,
ManagerID INT,
FOREIGN KEY(ManagerID) References tb_Employee(EmployeeID)
)AUTO_INCREMENT=5000;

Create table tb_Application (
App_ProductID INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT NOT NULL,
ProductType VARCHAR(1) NOT NULL,
EmployeeID INT NOT NULL,
ApplicationAmount DECIMAL(9,2) NOT NULL,
IsApproved BOOLEAN NOT NULL,
ApplicationDate DATE NOT NULL,
FOREIGN KEY(CustomerID) References CustomerProfile(CustomerID),
FOREIGN KEY (EmployeeID) References tb_Employee(EmployeeID)
);

CREATE TABLE tb_Building (
	BuildingNumber INT PRIMARY KEY,
	BuildingAddress VARCHAR(50) NOT NULL,
	BuildingPhoneNumber VARCHAR(50) NOT NULL
);

CREATE TABLE tb_ATM (
	ATMID INT PRIMARY KEY,
	ATMLocation VARCHAR(50) NOT NULL,
	BuildingNum INT,
	FOREIGN KEY(BuildingNum) REFERENCES tb_Building(BuildingNumber)
);

CREATE TABLE tb_Loan (
	LoanID INT PRIMARY KEY,
	LoanDescr VARCHAR(100) NOT NULL,
    LoanType VARCHAR(30) NOT NULL,
	LoanInterest DECIMAL(5,2) NOT NULL,
    LoanPeriod INT NOT NULL,
    CHECK (LoanPeriod >= 1 AND LoanPeriod <= 20),
    FOREIGN KEY (LoanID) REFERENCES tb_Application(App_ProductID)
);

-- DROP TABLE tb_Loan;

CREATE TABLE tb_Investment (
	InvestmentID INT PRIMARY KEY,
	InvestmentDescr VARCHAR(100) NOT NULL,
    InvestmentType VARCHAR(30) NOT NULL,
	InvestmentInterest DECIMAL(5,2) NOT NULL,
	FOREIGN KEY (InvestmentID) REFERENCES tb_Application(App_ProductID)
);

Create Table tb_Transaction (
TransactionID INT AUTO_INCREMENT,
TransactionDate DATE,
TransactionType VARCHAR (6) NOT NULL,
TransactionDescr VARCHAR(50) NOT NULL,
TransactionAmount DECIMAL (10,2) NOT NULL,
ATMID INT NOT NULL,
AccountID INT NOT NULL,
CustomerID INT NOT NULL,
Primary Key (TransactionID),
foreign key (ATMID) references tb_ATM(ATMID),
foreign key (AccountID) references tb_Account(AccountID),
foreign key (CustomerID) references CustomerProfile(CustomerID)
)AUTO_INCREMENT=500;

-- DROP TABLE tb_Transaction;

CREATE TABLE tb_Ticket (
TicketID INT AUTO_INCREMENT Primary key,
TicketType Varchar(30) NOT NULL,
TicketRaisedDate Date,
Description Varchar(300) NOT NULL,
TicketResolvedDate Date,
CustomerID INT NOT NULL,
EmployeeID INT NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES CustomerProfile(CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES tb_Employee(EmployeeID)
);

-- DROP TABLE tb_Ticket;

-- Insertions into Tables

INSERT INTO CustomerProfile (Password, CustomerName, CustomerPhoneNumber,
CustomerEmail, CustomerStatus, CustomerProfileDate, CardType, CardNumber, CardExpiryDate)
VALUES
('Teams@7', 'Shrinidhi Shetty','5139697585','shri@mail.uc.edu','active','2020-01-05','Credit','0421-4321-4982-3233', '2023-12-01'),
('Teams@8', 'Radhika Adwant','5138642165','radh@mail.uc.edu','not active','2020-01-05','Debit','9538-3921-4402-5323', '2023-12-01'),
('Teams@9', 'Andrew Smith','5139875565','andre@mail.uc.edu','active','2020-01-05','Debit','9938-1010-4444-5373', '2023-12-01'),
('Teams@10', 'alexander duncan','5139997865','mahajasl@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2023-12-01'),
('Teams@11', 'priyanka patil','5139997865','mahajasl@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2023-12-01'),
('Teams@12', 'Snehal Mahajan','5139997865','mahajasl@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2024-12-01'),
('Teams@13', 'Apurva shriwastwa','5139752665','apurva@mail.uc.edu','not active','2020-01-05','Credit','9668-3431-4402-5521', '2024-12-01'),
('Teams@14', 'Arun Kumar','513654485','arun@mail.uc.edu','active','2020-01-05','Debit','6758-1111-4402-5033', '2024-12-01'),
('Teams@15', 'Snehal patil','5139997865','snepatil@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2024-12-01'),
('Teams@16', 'Snehal lokhande','5139997865','snehal@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2024-12-01'),
('Teams@17', 'yanran liu','5139997865','yanran@mail.uc.edu','active','2020-01-05','Credit','9938-3121-4642-5033', '2025-12-01'),
('Teams@18', 'Krunal shivagan','5132227675','shiva@mail.uc.edu','not active','2020-01-05','Debit','5432-7777-5422-5033', '2025-12-01'),
('Teams@19', 'Ritika Mahajan','5132215865','ritika@mail.uc.edu','active','2020-01-05','Debit','9938-3663-2402-5033', '2025-12-01'),
('Teams@20', 'Ritu Mahajan ','5133927165','ritu@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2025-12-01'),
('Teams@21', 'Yash Karve','5138069465','yash@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2026-12-01'),
('Teams@22', 'Dhruval Cheda','513234265','dhruval@mail.uc.edu','active','2020-01-05','Credit','9938-3321-4402-5033', '2026-12-01'),
('Teams@23', 'Sheeba Shetty','513092865','sheeba@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2026-12-01'),
('Teams@24', 'Ramesh Patil','5130958665','ramesh@mail.uc.edu','active','2020-01-05','Credit','9938-3321-4402-5033', '2026-12-01'),
('Teams@25', 'Rohit Bhoite','5134396865','rohit@mail.uc.edu','active','2020-01-05','Debit','9938-3321-4402-5033', '2024-12-01'),
('Teams@26', 'Archana Shetty','5148377585','arc@mail.uc.edu','active','2020-01-05','Credit','0421-4321-45743-3233', '2024-12-01');

insert into tb_Employee (EmployeeName, EmployeeType, EmpPhoneNum, EmpEmailAddress,BuildingNumber,ManagerID)
values ('Snehal', 'Manager', '583233223', 'sneh@mail.uc.edu', 101, 5000),
('Kabira', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Julie', 'Manager', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Thanmayee', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101, 5000),
('Simran', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Apurva', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Priyanka', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Varsha', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Krishnaja', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Reshma', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Bob', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Marley', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Tim', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Adam', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Jack', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('John', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Justin', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Tina', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Sita', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Meena', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000),
('Radha', 'Clerk', '583233223', 'sneh@mail.uc.edu', 101,5000);

SELECT * from CustomerProfile;

INSERT INTO tb_Account (AccountID, AccountBalance, RountingNum, AccountType, CustomerID)
Values 
(200000, 2229218, '444444', 'Savings', 10000),
(200001, 39402892, '333333', 'Checking', 10001),
(200002, 939232, '111111', 'Savings', 10002),
(200003, 9281098, '222222', 'Savings', 10003),
(200004, 92392, '555555', 'Savings', 10004),
(200005, 23131, '666666', 'Checking', 10019),
(200006, 2322022, '777777', 'Checking', 10005),
(200007, 3443322, '773322', 'Checking', 10006),
(200008, 3424222, '336688', 'Checking', 10007),
(200009, 555533, '112222', 'Checking', 10008),
(200010, 19282, '553333', 'Savings', 10009),
(200011, 3827271, '998888', 'Savings', 10010),
(200012, 857574, '889999', 'Savings', 10011),
(200013, 28281, '778888', 'Savings', 10012),
(200014, 958573, '667777', 'Checking', 10013),
(200015, 1183722, '556666', 'Checking', 10014),
(200016, 756462, '445555', 'Checking', 10015),
(200017, 2828364, '334444', 'Checking', 10016),
(200018, 985743, '223333', 'Checking', 10017),
(200019, 129372, '112222', 'Savings', 10018);

SELECT * from tb_Account;

INSERT INTO tb_Building(BuildingNumber, BuildingAddress, BuildingPhoneNumber) values(101, "Clifton Ave",5139990000);

INSERT INTO tb_Application (CustomerID, ProductType, EmployeeID, ApplicationAmount, IsApproved, ApplicationDate)
values (10001, 'L', 5001, 200.55, 0,'2022-11-20'),
(10002, 'L', 5002, 2000, 0,'2022-11-21'),
(10003, 'L', 5002, 1700, 0,'2022-11-22'),
(10004, 'L', 5002, 500, 0,'2022-11-23'),
(10005, 'L', 5003, 3000, 0,'2022-11-24'),
(10016, 'I', 5009, 200, 0,'2022-11-25'),
(10017, 'I', 5009, 300, 0,'2022-11-26'),
(10018, 'I', 5009, 400, 0,'2022-11-27'),
(10019, 'I', 5009, 500, 0,'2022-11-28'),
(10011, 'I', 5009, 250, 0,'2022-11-29'),
(10006, 'L', 5004, 4000, 0,'2022-11-30'),
(10007, 'L', 5005, 2000, 0,'2022-11-30'),
(10008, 'L', 5006, 5000, 0,'2022-12-01'),
(10009, 'L', 5007, 3000, 0,'2022-12-01'),
(10010, 'L', 5008, 2000, 0,'2022-12-01'),
(10012, 'I', 5009, 400, 0,'2022-11-01'),
(10013, 'I', 5009, 1000, 0,'2022-11-02'),
(10014, 'I', 5009, 800, 0,'2022-11-03'),
(10015, 'I', 5009, 900, 0,'2022-11-04'),
(10000, 'I', 5009, 1200, 0,'2022-11-05');

INSERT INTO tb_Loan(LoanID, LoanDescr, LoanType, LoanInterest, LoanPeriod) values(1, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 1),
(2, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 2),
(3, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 3),
(4, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 4),
(5, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 5),
(11, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 4),
(12, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 2),
(13, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 3),
(14, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 1),
(15, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 10);

INSERT INTO tb_Investment(InvestmentID, InvestmentDescr, InvestmentType, InvestmentInterest) values(6, "Mutual Fnds Investment", "Mutual Funds", 10.20),
(7, "Mutual Fnds Investment", "Mutual Funds", 10.20),
(8, "Mutual Fnds Investment", "Mutual Funds", 10.20),
(9, "Mutual Fnds Investment", "Mutual Funds", 10.20),
(10, "Sysematic Inv Plan Investment", "SIP", 10.20),
(16, "Sysematic Inv Plan Investment", "SIP", 10.20),
(17, "Sysematic Inv Plan Investment", "SIP", 10.20),
(18, "Securitites", "Securitites", 10.20),
(19, "Bonds", "Bonds", 10.20),
(20, "Term Inv", "Term Investment", 10.20);

INSERT INTO tb_ATM(ATMID, ATMLocation, BuildingNum) values(200, "Clifton Ave 1st Floor",101),
(201, "Clifton Ave UC",101),
(202, "Clifton Ave 2nd Floor",101),
(203, "Clifton Ave 3rd Floor",101),
(204, "Clifton Ave 4th Floor",101),
(205, "Clifton Ave 5th Floor",101),
(206, "Clifton Ave 6th Floor",101),
(207, "Burnett Woods", null),
(208, "Blue Ash", null),
(209, "Riddle Road", null),
(210, "Thompson Heights", null),
(211, "Mason", null),
(212, "Calhoun Street", null),
(213, "McMillan Street", null),
(214, "Campus Green Garage", null),
(215, "Jefferson Avenue", null),
(216, "Vine Street", null),
(217, "Probasco", null),
(218, "Stratford Avenue", null),
(219, "Ludlow", null);


INSERT INTO tb_Transaction (TransactionDate, TransactionType, TransactionDescr, TransactionAmount, ATMID, AccountID, CustomerID)
Values
(01/02/2022, 'Debit', 'Check','30828.2',200,200000,10000),
(01/02/2022, 'Credit', 'Check','305352',201, 200001,10001),
(01/02/2022, 'Debit', 'Direct deposit','21442',202, 200002,10002),
(01/02/2022, 'Credit', 'Direct deposit','100',203, 200003,10003),
(01/02/2022, 'Debit', 'Check','10837.87',200,200004, 10004),
(01/02/2022, 'Debit', 'Check','44737',206,200005, 10005),
(01/02/2022, 'Debit', 'Direct deposit','10101',207, 200006,10006),
(01/02/2022, 'Credit', 'Check','111303',209,200007, 10007),
(01/02/2022, 'Debit', 'Check','54838',210,200008, 10008),
(01/02/2022, 'Credit', 'Check','31132',201,200009, 10009),
(01/02/2022, 'Debit', 'Check','90901',202,200010, 10010),
(01/02/2022, 'Debit', 'Direct deposit','330494',203, 200011,10011),
(01/02/2022, 'Credit', 'Check','11132',204, 200012,10012),
(01/02/2022, 'Debit', 'Direct deposit','90899',205, 200013,10013),
(01/02/2022, 'Debit', 'Direct deposit','30828.2',201, 200014,10014),
(01/02/2022, 'Debit', 'Direct deposit','30828.2',202, 200015,10015),
(01/02/2022, 'Debit', 'Check','30828.2',210, 200016,10016),
(01/02/2022, 'Credit', 'Direct deposit','30828.2',211, 200017,10017),
(01/02/2022, 'Debit', 'Direct deposit','22121',212, 200018,10018),
(01/02/2022, 'Credit', 'Check','7592',213, 200019,10019);

INSERT INTO tb_Ticket (TicketID, TicketType, TicketRaisedDate, Description, TicketResolvedDate, CustomerID, EmployeeID)
Values (1, 'InternetBanking', '2022-09-13', 'Ticket for Internet Banking', '2022-09-13',10000,5000),
					  (2, 'ATM', '2022-09-17', 'Ticket for ATM Issue', '2022-09-19',10001,5001),
					  (3, 'Application', '2022-09-24', 'Ticket for Application Issue', '2022-09-25',10002,5002),
					  (4, 'Transaction', '2022-09-26', 'Ticket for Transaction Issue', '2022-09-26',10003,5003),
					  (5, 'Account', '2022-09-27', 'Ticket for Account Issue', '2022-09-28',10004,5004),
					  (6, 'Maintenance', '2022-09-28', 'Ticket for Maintenance Issue', '2022-09-28',10005,5005),
					  (7, 'BranchChange', '2022-09-29', 'Ticket for BranchChange', '2022-09-30',10006,5006),
					  (8, 'DemandDraft', '2022-09-30', 'Ticket for DemandDraft Issue', '2022-09-30',10007,5007),
					  (9, 'Loan', '2022-10-02', 'Ticket for Loan Issue', '2022-10-05',10008,5008),
					  (10, 'AddressChange', '2022-10-07', 'Ticket for AddressChange', '2022-10-07',10009,5009),
					  (11, 'Application', '2022-10-09', 'Ticket for Application Issue', '2022-10-11',10010,5010),
					  (12, 'Account', '2022-10-12', 'Ticket for Account Issue', '2022-10-13',10011,5011),
					  (13, 'Transaction', '2022-10-15', 'Ticket for Transaction Issue', '2022-10-17',10012,5012),
					  (14, 'ATM', '2022-10-19', 'Ticket for ATM Issue', '2022-10-21',10013,5013),
					  (15, 'Maintenance', '2022-10-22', 'Ticket for Maintenance Issue', '2022-10-25',10014,5014),
					  (16, 'Loan', '2022-10-27', 'Ticket for Loan Issue', '2022-10-29',10015,5015),
					  (17, 'NameChange', '2022-10-28', 'Ticket for NameChange', '2022-10-29',10016,5016),
					  (18, 'Cheque', '2022-10-30', 'Ticket for Cheque Issue', '2022-10-31',10017,5017),
					  (19, 'Loan', '2022-11-01', 'Ticket for Loan Issue', '2022-11-05',10018,5018),
					  (20, 'InternetBanking', '2022-11-08', 'Ticket for Internet Banking Issue', '2022-11-12',10019,5019);



-- CUSTOMER SCREENS 

-- Register (New Customer Registration)

INSERT INTO CustomerProfile (Password, CustomerName, CustomerPhoneNumber, CustomerEmail, CustomerStatus, CustomerProfileDate, CardType, CardNumber, CardExpiryDate) 
VALUES ('Teams@New','Shrinidhi Shetty','5139697585','shri@mail.uc.edu','active','2020-01-10','Credit','0439-0290-0900-7654', '2026-12-01');

-- withdraw cash at ATM
INSERT INTO tb_Transaction (TransactionDate, TransactionType, TransactionDescr, TransactionAmount, ATMID, AccountID, CustomerID)
Values ('2022-11-30', 'Credit', 'Cash withdrawal', 5000, 200, 200001,10001);


-- Direct deposit cash at ATM
INSERT INTO tb_Transaction (TransactionDate, TransactionType, TransactionDescr, TransactionAmount, ATMID, AccountID, CustomerID)
Values ('2022-11-30', 'Debit', 'Direct deposit', 2000, 200, 200001,10001);

-- Check deposit at ATM

INSERT INTO tb_Transaction (TransactionDate, TransactionType, TransactionDescr, TransactionAmount, ATMID, AccountID, CustomerID)
Values ('2022-11-30', 'Debit', 'Check', 2000, 200, 200001,10001);

-- View Balance at ATM and on Customer Portal for Customer

SELECT CustomerProfile.CustomerName, tb_Account.CustomerID, tb_Account.AccountType as AccountType, tb_Account.AccountID as AccountID,
       (SUM(CASE WHEN tb_Transaction.TransactionType = 'DEBIT' THEN tb_Transaction.TransactionAmount ELSE 0 END) -
       SUM(CASE WHEN tb_Transaction.TransactionType = 'CREDIT' THEN tb_Transaction.TransactionAmount ELSE 0 END)) AS Balance
FROM tb_Account INNER JOIN tb_Transaction ON tb_Account.CustomerID = tb_Transaction.CustomerID INNER JOIN CustomerProfile ON 
tb_Account.CustomerID = CustomerProfile.CustomerID;


-- Apply Loan at ATM and on Customer Portal
INSERT INTO tb_Application (CustomerID, ProductType, EmployeeID, ApplicationAmount, IsApproved, ApplicationDate)values ('10003', 'L', '5001', '58827', 0,'2022-11-30') ;

INSERT INTO tb_Loan(LoanID, LoanDescr, LoanType, LoanInterest, LoanPeriod) values(21, "Car Loan taken with a loan period of 10 years", "Car Loan", 10.20, 5);


-- Apply Investment at ATM and on Customer Portal

INSERT INTO tb_Application (CustomerID, ProductType, EmployeeID, ApplicationAmount, IsApproved, ApplicationDate)values ('10003', 'I', '5001', '58827', 0,'2022-11-30') ;

INSERT INTO tb_Investment(InvestmentID, InvestmentDescr, InvestmentType, InvestmentInterest) values (22, "Mutual Fnds Investment", "Mutual Funds", 7.50);

-- View CustomerProfile

select * from CustomerProfile;

-- Display the first screen after logging into Customer Portal: 

select * from CustomerProfile where CustomerID=Login;
select * from tb_Investment where CustomerID=Login;
select * from tb_Loans where CustomerID=Login;
select * from tb_Card where CustomerID=Login;



-- Group Data by Year and Quarter from the transactions table for Analysis of Trends

SELECT  EXTRACT(YEAR FROM TransactionDate) AS Year,
        EXTRACT(QUARTER FROM TransactionDate) AS Quarter,
        COUNT(TransactionAmount) AS Number_of_Transactions
FROM tb_Transaction
GROUP BY EXTRACT(YEAR FROM TransactionDate), EXTRACT(QUARTER FROM TransactionDate)
ORDER BY EXTRACT(YEAR FROM TransactionDate) ASC, EXTRACT(QUARTER FROM TransactionDate);

-- View Customer Transactions

Select T.TransactionID, t.TransactionDate, t.TransactionDescr, T.TransactionAmount, T.AccountID, C.CustomerID, C.CustomerName
FROM tb_Transaction T, tb_Account A, CustomerProfile C
WHERE T.AccountID = A.AccountID AND A.CustomerID = C.CustomerID AND C.CustomerID = 10001;

-- View Approved Loans

Select L.*, A.CustomerID, A.ApplicationDate, A.isApproved FROM tb_Application A, tb_Loan L
WHERE  A.App_ProductID = L.LoanID AND A.CustomerID = 10001 AND A.isApproved = 1 AND A.ProductType = 'L';

-- View Approved Investments

Select I.*, A.CustomerID, A.ApplicationDate, A.isApproved FROM tb_Application A, tb_Investment I
WHERE A.App_ProductID = I.InvestmentID AND CustomerID = 10016 AND isApproved = 1 AND A.ProductType = 'I';



-- STAFF SCREENS

-- Add Customer

INSERT INTO CustomerProfile (Password, CustomerName, CustomerPhoneNumber, CustomerEmail, CustomerStatus, CustomerProfileDate, CardType, CardNumber, CardExpiryDate) 
VALUES ('Teams@NewCust','Blake Lively','5139697585','blake@mail.uc.edu','active','2020-01-10','Credit','0439-0290-0900-7654', '2026-12-01');

-- Delete Customer

DELETE FROM CustomerProfile WHERE CustomerID = '10001';

-- Update Customer Details (here updating CustomerStatus)

UPDATE CustomerProfile SET CustomerStatus = 'inactive' WHERE CustomerID = '10019';

-- Generate Loan Report 

select * from tb_Loan where LoanID IS NOT NULL;

-- Generate Investment Report 

select * from tb_Investment where InvestmentID IS NOT NULL;

-- Generate Employees Report 

Create View EmpReport as 
select * from tb_Employee
inner join tb_Building
on  tb_Employee.BuildingNumber = tb_Building.BuildingNumber;

Select * from EmpReport;

-- View Staff details managed by a particular Manager

SELECT M.EmployeeName as ManagerName, E.EmployeeName as EmployeeName, E.EmployeeID as EmployeeID, E.EmpPhoneNum as 'Employee Contact'
FROM tb_Employee E, tb_Employee M
WHERE E.ManagerID = M.EmployeeID;

-- Approve Loan for Customer ID 10001

select * from tb_Application where CustomerID = 10001 and ProductType = 'L';

update tb_Application
set isApproved = 1
where ProductType = 'L' and CustomerID = 10001 AND App_ProductID = 1;

-- View Approved Loans

Select L.*, A.CustomerID, A.ApplicationDate, A.isApproved FROM tb_Application A, tb_Loan L
WHERE  A.App_ProductID = L.LoanID AND A.CustomerID = 10001 AND A.isApproved = 1 AND A.ProductType = 'L';

-- Approve Investemnt for Customer

select * from tb_Application where CustomerID = 10016 and ProductType = 'I';

update tb_Application
set isApproved = 1
where ProductType = 'I' and CustomerID = 10016 AND App_ProductID = 6;

-- View Approved Investments

Select I.*, A.CustomerID, A.ApplicationDate, A.isApproved FROM tb_Application A, tb_Investment I
WHERE A.App_ProductID = I.InvestmentID AND CustomerID = 10016 AND isApproved = 1 AND A.ProductType = 'I';

-- View Employee Report

CREATE VIEW EmployeeView AS
SELECT *
FROM tb_Employee;

SELECT * FROM EmployeeView;


