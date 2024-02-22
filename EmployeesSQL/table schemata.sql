create table departments(
dept_no varchar not null,
dept_name varchar not null,
primary key(dept_no))

create table dept_emp(
emp_no integer not null,
dept_no varchar not null,
primary key(emp_no,dept_no),
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no))

create table dept_manager(
dept_no varchar not null,
emp_no integer not null,
primary key (dept_no, emp_no),
foreign key(dept_no) references departments(dept_no),
foreign key(emp_no) references employees(emp_no))

create table employees(
emp_no integer not null,
emp_title_id varchar not null,
birth_date date not null,
first_name varchar not null,
last_name varchar not null,
sex varchar not null,
hire_date date not null,
primary key(emp_no),
foreign key(emp_title_id) references titles(title_id))

create table salaries(
emp_no integer not null,
salary integer not null,
primary key(emp_no),
foreign key(emp_no) references employees(emp_no))

create table titles(
title_id varchar not null,
title varchar not null,
primary key(title_id))