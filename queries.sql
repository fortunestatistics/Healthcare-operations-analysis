-- SQL Queries for Analyzing Hospital Wait Times Data

-- 1. Query to find average wait time for each department
SELECT department, AVG(wait_time) as average_wait_time
FROM hospital_wait_times
GROUP BY department;

-- 2. Query to find total number of patients waited in each department
SELECT department, COUNT(*) as total_patients
FROM hospital_wait_times
GROUP BY department;

-- 3. Query to find maximum wait time recorded in a specific department
SELECT MAX(wait_time) as maximum_wait_time
FROM hospital_wait_times
WHERE department = 'Emergency';

-- 4. Query to find wait times over the last month
SELECT *
FROM hospital_wait_times
WHERE wait_time_date >= DATEADD(month, -1, GETDATE());