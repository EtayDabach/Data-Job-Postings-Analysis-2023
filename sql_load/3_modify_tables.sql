/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

Possible Errors: 
- ERROR >>  duplicate key value violates unique constraint "company_dim_pkey"
- ERROR >> could not open file "C:\Users\...\company_dim.csv" for reading: Permission denied

1. Ensure PostgreSQL server is running
2. Apply steps to create database and load table schemas
            - 1_create_database.sql
            - 2_create_tables.sql
3. Open pgAdmin
4. In Object Explorer (left-hand pane), navigate to `sql_job_postings_2023` database
5. Right-click `sql_job_postings_2023` and select `PSQL Tool`
            - This opens a terminal window to write the following code
6. Get the absolute file path of your csv files
            1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
7. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '[Insert File Path/company_dim.csv]' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path/skills_dim.csv]' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path/job_postings_fact.csv]' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path/skills_job_dim.csv]' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/


COPY company_dim
FROM '[Insert File Path]'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '[Insert File Path]'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '[Insert File Path]'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '[Insert File Path]'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');



-- Test the data load by querying the tables (limit to 100 rows)
SELECT * FROM skills_dim LIMIT 100;
SELECT * FROM skills_job_dim LIMIT 100;
SELECT * FROM job_postings_fact LIMIT 100;
SELECT * FROM company_dim LIMIT 100;