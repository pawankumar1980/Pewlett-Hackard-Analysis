# Pewlett-Hackard-Analysis
## Overview

This analysis aims to prepare Pewlett-Hackard, a company with 300k plus employees, for the upcoming “silver tsunami.” Many employees will begin retiring rapidly in the next few years, and the company wants to prepare for retirement packages, open positions and employee training. As a part of this preparation, the company wants to accomplish
   - Identify the retiring employees & group them title-wise.
   - Identify the employees eligible for participation in the mentorship program.
   - Roles to fill - grouped by title and department
   - Identify the number of qualified, retirement-ready employees to mentor the next generation grouped by title and department<img width="668" alt="Screen Shot 2022-10-12 at 15 41 17" src="https://user-

   
## Background

The process of data finalization involved
   - The creation of an ERD (Entity Relationship Diagram) to map out the database schema and relationships.
   - Importing the company data into the database (CSV files). The data types and restrictions defined in the database ensure integrity and reliable        analysis.
   - Use SQL to communicate with the database and retrieve the information. Further data segmentation was done using the relevant filters and creating        custom tables.
   

## Results

  **List of retiring employees**
    - The table includes the employee number, first name, last name, title, and from-date & to-date.
    - Displays a list of employees who will retire in the coming years.
    - Returns more than 133k rows on a query. This is because it includes.
  
  <img width="668" alt="Screen Shot 2022-10-12 at 15 41 17" src="https://user-images.githubusercontent.com/111800568/195435764-d4310c18-bfe6-4389-ae8d-ef78d6e4e446.png">

    
  **List of retiring employees without duplicates**
    - The table includes the employee number, first name, last name, title, and from-date & to-date.
    - Displays a list of employees who will retire in the coming years.
    - The query returns 90398 rows.
    
  <img width="496" alt="Screen Shot 2022-10-12 at 15 45 06" src="https://user-images.githubusercontent.com/111800568/195435240-b13e59a8-b434-44f4-bcfd-ca247b0375fa.png">
  
  **Number of retiring employees by title**
    - The table includes employees’ titles and their sum.
    - Displays list of employees who will retire in the coming years.
    
  <img width="249" alt="Screen Shot 2022-10-12 at 15 47 00" src="https://user-images.githubusercontent.com/111800568/195435446-a01ca60f-5aa3-4a5f-b52b-ea7884afa5db.png">


## Summary
   
   The above reports give a good insight into the number of employees that are about to retire and hold specific titles. The additional breakdown department-wise will give a better understanding. In order to retrieve department name information, merged additional table departments into existing table retirement_titles with the inner join. After removing the duplicates, with the DISTINCT ON command, the table was ready to be used for additional queries.
   
```
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
   
 ```
   
   
<img width="689" alt="Screen Shot 2022-10-12 at 16 00 46" src="https://user-images.githubusercontent.com/111800568/195437670-bd4f284c-1d21-4116-a84a-f26d16ec15e7.png">

   
** Roles that will be filled as the "silver tsunami" begins to impact.
   
   The table of retirement titles contains all the information about the employees that are about to retire in the next four years. To get the number of positions that will be open in the next four years, I ran an additional query that breaks down how many staff will retire per department.
   
 ```
 
 SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO rolls_to_fill
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;
   
 ```
   
<img width="396" alt="Screen Shot 2022-10-12 at 16 01 39" src="https://user-images.githubusercontent.com/111800568/195439831-d194e72c-9233-41ea-81bd-59e6354369c8.png">

   
** Qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett-Hackard employees
   
I assumed that the mentors would be senior employees from departments. Basis this, ran a query with an additional filter that returns only employees in higher positions. With the command WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager'), the results include only staff in higher positions.
   
```
   SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO mentoring_probables
FROM (SELECT title, dept_name from unique_titles_department) as ut
WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;
   
 ```
 
<img width="396" alt="Screen Shot 2022-10-12 at 16 01 39" src="https://user-images.githubusercontent.com/111800568/195442254-2e361f12-703d-4e42-a91b-9c15ef9b8785.png">

 
 
   
   
   
