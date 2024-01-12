-- Create the library table
CREATE TABLE library (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- Create the school table
CREATE TABLE school (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(100)
);

-- Create the library_loans table

CREATE TABLE library_loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    student_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES library(book_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Create the library_fines table
CREATE TABLE library_fines (
    fine_id INT PRIMARY KEY,
    loan_id INT,
    fine_amount DECIMAL(5,2),
    FOREIGN KEY (loan_id) REFERENCES library_loans(loan_id)
);


-- pass in data to the created tables
INSERT INTO school VALUES
(1, 'School of Computer Science'),
(2, 'School of Business'),
(3, 'School of Arts');
INSERT INTO departments VALUES
(1, 'Computer Science', 1),
(2, 'Business', 2),
(3, 'Arts', 3);
INSERT INTO students VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Cindy', 3);
INSERT INTO books VALUES
(1, 'Introduction to Algorithms', 'Clayton', 'Computer Science'),
(2, 'Database Systems', 'Clayton', 'Computer Science'),
(3, 'The Art of Computer Programming', 'Clayton', 'Computer Science'),
(4, 'The Art of War', 'Sun Tzu', 'Arts'),
(5, 'The Art of Business', 'Clayton', 'Business');
INSERT INTO library_loans VALUES
(1, 1, 1, '2019-01-01', '2019-01-08'),
(2, 2, 1, '2019-01-01', '2019-01-08'),
(3, 3, 1, '2019-01-01', '2019-01-08'),
(4, 4, 1, '2019-01-01', '2019-01-08'),
(5, 5, 1, '2019-01-01', '2019-01-08'),
(6, 1, 2, '2019-01-01', '2019-01-08'),
(7, 2, 2, '2019-01-01', '2019-01-08'),
(8, 3, 2, '2019-01-01', '2019-01-08'),
(9, 4, 2, '2019-01-01', '2019-01-08'),
(10, 5, 2, '2019-01-01', '2019-01-08'),
(11, 1, 3, '2019-01-01', '2019-01-08'),
(12, 2, 3, '2019-01-01', '2019-01-08'),
(13, 3, 3, '2019-01-01', '2019-01-08'),
(14, 4, 3, '2019-01-01', '2019-01-08'),
(15, 5, 3, '2019-01-01', '2019-01-08');
INSERT INTO library_fines VALUES
(1, 1, 1.00),
(2, 2, 2.00),
(3, 3, 3.00),
(4, 4, 4.00),
(5, 5, 5.00),
(6, 6, 6.00),
(7, 7, 7.00),
(8, 8, 8.00),
(9, 9, 9.00),
(10, 10, 10.00),
(11, 11, 11.00),
(12, 12, 12.00),
(13, 13, 13.00),
(14, 14, 14.00),
(15, 15, 15.00);
```
### Exercise 1: Basic SQL Queries
1. Write a query to find the names of all students.
```sql
SELECT student_name FROM students;
```
2. Write a query to find the names of all students who are enrolled in the School of Computer Science.
```sql
SELECT student_name FROM students WHERE department_id = 1;
```
3. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans);
```
4. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton'));
```
5. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming'));
```
6. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War'));
```
7. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business'));
```
8. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms'));
```
9. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems'));
```
10. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science'));
```
11. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English'));
```
12. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese'));
```
13. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics'));
```
14. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics' AND book_title != 'The Art of Physics'));
```
15. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics and are not borrowing The Art of Chemistry.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics' AND book_title != 'The Art of Physics' AND book_title != 'The Art of Chemistry'));
```
16. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics and are not borrowing The Art of Chemistry and are not borrowing The Art of Biology.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics' AND book_title != 'The Art of Physics' AND book_title != 'The Art of Chemistry' AND book_title != 'The Art of Biology'));
```
17. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics and are not borrowing The Art of Chemistry and are not borrowing The Art of Biology and are not borrowing The Art of History.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics' AND book_title != 'The Art of Physics' AND book_title != 'The Art of Chemistry' AND book_title != 'The Art of Biology' AND book_title != 'The Art of History'));
```
18. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and is not The Art of Computer Programming and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics and are not borrowing The Art of Chemistry and are not borrowing The Art of Biology and are not borrowing The Art of History and are not borrowing The Art of Geography.
```sql
SELECT student_name FROM students WHERE department_id = 1 AND student_id IN (SELECT student_id FROM library_loans WHERE book_id IN (SELECT book_id FROM library WHERE author = 'Clayton' AND book_title != 'The Art of Computer Programming' AND book_title != 'The Art of War' AND book_title != 'The Art of Business' AND book_title != 'Introduction to Algorithms' AND book_title != 'Database Systems' AND book_title != 'The Art of Computer Science' AND book_title != 'The Art of English' AND book_title != 'The Art of Chinese' AND book_title != 'The Art of Mathematics' AND book_title != 'The Art of Physics' AND book_title != 'The Art of Chemistry' AND book_title != 'The Art of Biology' AND book_title != 'The Art of History' AND book_title != 'The Art of Geography'));
```
19. Write a query to find the names of all students who are enrolled in the School of Computer Science and are borrowing a book that is written by Clayton and are not borrowing The Art of War and are not borrowing The Art of Business and are not borrowing Introduction to Algorithms and are not borrowing Database Systems and are not borrowing The Art of Computer Science and are not borrowing The Art of English and are not borrowing The Art of Chinese and are not borrowing The Art of Mathematics and are not borrowing The Art of Physics and are not borrowing The Art of Chemistry and are not borrowing The Art of Biology and are not borrowing The Art of History and are not borrowing The Art of Geography.
```sql
