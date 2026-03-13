-- Library System Management SQL Project
-- CREATE DATABASE library;
-- Create table "Branch"

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(55),
            contact_no VARCHAR(15)
);


ALTER TABLE branch
MODIFY COLUMN contact_no VARCHAR(20);

-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10), -- FK 
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "books"
DROP TABLE IF EXISTS BOOKS;
CREATE TABLE BOOKS(
isbn varchar(20) PRIMARY KEY,
book_title varchar(75),	
category varchar(20),
rental_price float,
status  varchar(15),
author	varchar(35),
publisher varchar(55)
);


ALTER TABLE BOOKS
MODIFY COLUMN category VARCHAR(20);


-- create table "Members"
DROP TABLE IF EXISTS members;
create table members

(
          member_id varchar(10) PRIMARY KEY,
          member_name VARCHAR(25),
          member_address VARCHAR(75),
          reg_date DATE 
);


-- CREATE TABLE "ISSUESSTATUS"
DROP TABLE IF EXISTS issued_status ;
CREATE TABLE issued_status
(
               issued_id VARCHAR(10) PRIMARY KEY,
               issued_member_id	 VARCHAR(30), -- FK 
               issued_book_name	VARCHAR(75),
               issued_date	DATE,
               issued_book_isbn	VARCHAR(25), -- FK 
               issued_emp_id VARCHAR(10) -- FK 
   );            
               
    
-- -- Create table "ReturnStatus"

DROP TABLE IF EXISTS return_status;
CREATE TABLE  return_status
  (      
               return_id VARCHAR(10) PRIMARY KEY,	
               issued_id	VARCHAR(30),
               return_book_name	VARCHAR(75),
               return_date	DATE,
               return_book_isbn VARCHAR(20)
    );           

-- FOREIGN KEY 
ALTER TABLE  issued_status
ADD CONSTRAINT  fk_members 
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE  issued_status
ADD CONSTRAINT  fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE  issued_status
ADD CONSTRAINT  fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);


 ALTER TABLE  employees 
 ADD CONSTRAINT  fk_branch
 FOREIGN KEY (branch_id)
 REFERENCES branch(branch_id);

ALTER TABLE  return_status
ADD CONSTRAINT  fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


ALTER TABLE branch
MODIFY COLUMN contact_no VARCHAR(20);



select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from return_status;
select * from  members;

-- after import the data sucessfuly solve the problem ststement



-- ### 2. CRUD Operations

--   Task 1. Create a New Book Record

-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')


-- Task 2: Update an Existing Member's Address


UPDATE members 
SET member_address = '126 Main St'
WHERE member_id = 'C101';
SELECT * FROM members;


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

SELECT * FROM issued_status;
DELETE FROM issued_status
WHERE issued_id = 'IS104';

SELECT * FROM
 issued_status
where issued_id = 'IS104'

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status
where issued_emp_id = 'E101'


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_emp_id
-- count(issued_id) as total_book_issued
from  issued_status
 group by issued_emp_id
 having count(issued_id)> 1
 
 - ### 3. CTAS (Create Table As Select)
-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
-- select * from books;
-- select * from issued_status;

CREATE TABLE book_count 
AS
SELECT 
b.isbn,
b.book_title,
count(iss.issued_id) AS no_issued
FROM books AS b
JOIN issued_status AS iss
ON iss.issued_book_isbn = b.isbn
group by 1,2;

select * from book_count;




-- ### 4. Data Analysis & Findings
-- Task 7. **Retrieve All Books in a Specific Category:

select * from books 
where category= 'Children';
-- Task 8: Find Total Rental Income by Category:



-- Task 9. **List Members Who Registered in the Last 180 Days**:

SELECT * 
FROM members
WHERE reg_date >= current_date()- INTERVAL 180 DAY;

SELECT current_date()



-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:
select * 
from employees e
join branch b
    on e. branch_id= b.branch_id 
join employees 2 
     on e.emp_id = e2.emp_id

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
-- Task 12: Retrieve the List of Books Not Yet Returned

