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
	emp_no INTEGER PRIMARY KEY NOT NULL
	, emp_title VARCHAR(255) NOT NULL
	, FOREIGN KEY (emp_title) REFERENCES titles(title_id)
	, birth_date DATE
	, first_name VARCHAR(255)
	, last_name VARCHAR(255)
	, sex VARCHAR(1)
	, hire_date DATE
	)
;

CREATE TABLE departments(
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL
	, dept_name VARCHAR(255)
	)
;

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL
	, dept_no VARCHAR(255) NOT NULL
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	, PRIMARY KEY (emp_no, dept_no)
	)
;

CREATE TABLE dept_manager(
	emp_no INTEGER PRIMARY KEY NOT NULL
	, dept_no VARCHAR(255) NOT NULL
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	)
;
