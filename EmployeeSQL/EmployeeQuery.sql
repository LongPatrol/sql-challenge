CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY
	, title VARCHAR(255))
;

CREATE TABLE salaries(
	emp_no VARCHAR(255) PRIMARY KEY
	, salary INTEGER)
;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY
	, emp_title VARCHAR(255)
	, birth_date DATE
	, first_name VARCHAR(255)
	, last_name VARCHAR(255)
	, sex VARCHAR(1)
	, hire_date DATE)