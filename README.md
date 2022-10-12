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
  
  images.githubusercontent.com/111800568/195434926-67e46a7a-63b9-4615-ae0a-163158eb25d6.png">
    
  **List of retiring employees without duplicates**
    - The table includes the employee number, first name, last name, title, and from-date & to-date.
    - Displays a list of employees who will retire in the coming years.
    - The query returns 90398 rows.
    
  <img width="496" alt="Screen Shot 2022-10-12 at 15 45 06" src="https://user-images.githubusercontent.com/111800568/195435240-b13e59a8-b434-44f4-bcfd-ca247b0375fa.png">
  
  **Number of retiring employees by title**
    - The table includes employees’ titles and their sum.
    - Displays list of employees who will retire in the coming years.
    
  <img width="249" alt="Screen Shot 2022-10-12 at 15 47 00" src="https://user-images.githubusercontent.com/111800568/195435446-a01ca60f-5aa3-4a5f-b52b-ea7884afa5db.png">



