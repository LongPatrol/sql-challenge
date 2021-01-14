CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY NOT NULL
	, title VARCHAR(255)
	)
;

CREATE TABLE salaries(
	emp_no VARCHAR(255) PRIMARY KEY NOT NULL 
	, salary INTEGER
	)
;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL
	, emp_title VARCHAR(255) NOT NULL
	, FOREIGN KEY (emp_title) REFERENCES titles(title_id)
	, birth_date DATE
	, first_name VARCHAR(255)
	, last_name VARCHAR(255)
	, sex VARCHAR(1)
	, hire_date DATE
	)
;


--need to create department table first
/*
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL
	, dept_no VARCHAR(255) NOT NULL
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES 
	)
*/