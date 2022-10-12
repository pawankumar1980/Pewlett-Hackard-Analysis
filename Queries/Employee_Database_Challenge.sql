--Deliverable 1: 
---------------------------------------------------------------------------------------------------------------------
--The Number of Retiring Employees by Title.

SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
		rt.emp_no,
        rt.first_name,
	    rt.last_name,
        rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date ='9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles

--Table 3
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

-----------------------------------------------------------------------------------------------------------------------------
--Deliverable 2: 
-----------------------------------------------------------------------------------------------------------------------------
--The Employees Eligible for the Mentorship Program.
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligibilty

------------------------------------------------------------------------------
-- Deliverable 3
-----------------------------------------------------------------------------------

-- Roles to be filled when the silver Tsunami begins to impact

--Roles per Staff and Departament: 

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles_department

-- How many roles will need to be fill per title and department?

SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO rolls_to_fill
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

SELECT * FROM rolls_to_fill


-- Senior, experienced staff ready to mentor next generation

SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO mentoring_probables
FROM (SELECT title, dept_name from unique_titles_department) as ut
WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

SELECT * FROM mentoring_probables
