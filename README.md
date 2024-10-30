# Employee-Database-Analysis-with-SQL

This repository contains a comprehensive set of SQL queries designed to manage and analyze employee data within a fictional company. The queries demonstrate essential SQL skills, from basic data retrieval to advanced operations, and cover common business scenarios for employee management, salary processing, and project assignments.

📑 **Project Overview**

The project involves two primary tables:
**_EmployeeDetails:_** Stores employee information, including employee ID, name, manager ID, joining date, and city.
**_EmployeeSalary:_** Maintains employee salary details, including project assignments, base salary, and variable components.

**📊 Schema Diagram**

![Employee DB Schema](https://github.com/user-attachments/assets/b0d3433a-c5dd-4b82-b135-a08e057c98f7)

**🗄️ Relationships**

There is a one-to-many relationship between EmployeeDetails and EmployeeSalary based on the EmpId, meaning one employee can have multiple salary records (e.g., for different projects).

The ManagerId in EmployeeDetails creates a self-referential relationship within the same table, indicating that an employee can be a manager for other employees.

**📊 Key SQL Functions and Techniques**

1. **_Data Filtering:_** Using JOIN, WHERE, and conditional statements to retrieve specific subsets of data (e.g., employees by city, project, or salary range).

2. **_Data Transformation:_** Using functions like REPLACE, CONCAT, SUBSTRING, and COALESCE to manipulate and format data.
Aggregations: Utilizing COUNT, MAX, MIN, AVG, and GROUP BY for summarized insights, like project-wise employee counts or salary statistics.

3. **_Date Functions:_** Filtering by specific years and retrieving current date-time.

4. **_Subqueries and Self-Joins:_** Fetching hierarchical data (e.g., employees who are also managers).

5. **_Data Cleaning:_** Removing spaces and handling duplicate records.

**📌 Featured Queries**

**_Employee and Manager Records:_** Identify employees with or without project assignments and locate employees based on manager IDs.

**_Advanced Analysis:_** Determine employees with salaries within specific ranges, project-wise employee counts, and occurrences of specific characters in names, finding the nth highest salary.

**_Data Validation:_** Identify discrepancies between tables by checking records unique to each.
