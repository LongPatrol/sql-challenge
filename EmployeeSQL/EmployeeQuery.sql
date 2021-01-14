--Creating Tables

CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY NOT NULL
	, title VARCHAR(255)
	)
;

CREATE TABLE salaries(
	emp_no INTEGER PRIMARY KEY NOT NULL 
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
	dept_no VARCHAR(255) NOT NULL
	, emp_no INTEGER PRIMARY KEY NOT NULL
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	)
;

--checking table imports
select * from titles
limit 5
;

select * from salaries
limit 5
;

select * from employees
limit 5
;

select * from departments
limit 5
;

select * from dept_emp
limit 5
;

select * from dept_manager
limit 5
; 

--First question: List employee number, last name, first name, sex and salary for each employee
select emp.emp_no
	, emp.last_name
	, emp.first_name
	, emp.sex
	, s.salary
from employees emp
	left join salaries s
	on emp.emp_no = s.emp_no
;

--Second question: List first name, last name, and hire date for employees that were hired in 1986
select first_name, last_name, hire_date
from employees emp
WHERE EXTRACT(YEAR FROM hire_date) = '1986'
;

--Third question: List manager of each department with the department number, department name,
-- manager's employee number, last name, and first name
select dm.dept_no, dpts.dept_name, dm.emp_no, emp.last_name, emp.first_name
from dept_manager dm
	left join departments dpts
	on dm.dept_no = dpts.dept_no
	left join employees emp
	on dm.emp_no = emp.emp_no
;

--4th question: List the department of each employee with: employee number, last name, first name,
--and department name
select emp.emp_no, emp.last_name, emp.first_name, dpts.dept_name
from employees emp
	left join dept_emp de
	on emp.emp_no = de.emp_no
	left join departments dpts
	on de.dept_no = dpts.dept_no
;

--5th question: list first name, last name and sex for employees with the first name Hercules
-- and the last name beginning with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name LIKE 'B%'
;

--6th question: list all employees in the sales department, including their employee number
-- last name, first name, and department name
select emp.emp_no, emp.last_name, emp.first_name, dpts.dept_name
from departments dpts
	left join dept_emp de
	on dpts.dept_no = de.dept_no
	left join employees emp
	on de.emp_no = emp.emp_no
where dpts.dept_name = 'Sales'
;

--7th question: list all employees in the sales AND development departments
--, including their employee number, last name, first name, and department name
select emp.emp_no, emp.last_name, emp.first_name, dpts.dept_name
from departments dpts
	left join dept_emp de
	on dpts.dept_no = de.dept_no
	left join employees emp
	on de.emp_no = emp.emp_no
where dpts.dept_name in ('Sales', 'Development')
;

--8th question: In desc order, list the frequency count of employee last names
select last_name, count(*) as frequency_count
from employees
group by last_name
order by frequency_count desc
;


