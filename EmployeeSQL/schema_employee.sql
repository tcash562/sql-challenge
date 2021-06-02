DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS data_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  dept_no character varying(10),
  dept_name character varying(45) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
  emp_no integer NOT NULL,
  dept_no character varying(10),
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
  dept_no character varying(10),
  emp_no integer NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE employees(
  emp_no integer NOT NULL,
  birth_date date NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  gender character varying(45) NOT NULL,
  hire_date date DEFAULT ('now'::text)::date NOT NULL,
  PRIMARY KEY (emp_no)
);


CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE titles (
  emp_no integer NOT NULL,
  title varchar(255) NOT NULL,
  from_date date DEFAULT ('now'::text)::date NOT NULL,
  to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE titles 2 (
  title_id integer NOT NULL,
  title varchar(255) NOT NULL
);
