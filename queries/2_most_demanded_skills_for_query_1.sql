/*
What are the most in-demand skills for data analysts from query 1?
- Join job postings to inner join table.
- Identify the all in-demand skills for a data analyst where the count is >= 5.
*/


-- checking the data
SELECT *
FROM skills_job_dim
LIMIT 100;

SELECT *
FROM skills_dim
LIMIT 100;


WITH remote_data_analyst_jobs AS (
    SELECT
        jpf.*,  -- Select all columns from job_postings_fact
        cd.name AS company_name
    FROM job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
        AND (
            job_title NOT LIKE '%Senior%'
            AND job_title NOT LIKE '%Sr%'
            AND job_title NOT LIKE '%Lead%'
            AND job_title NOT LIKE '%Principal%'
            AND job_title NOT LIKE '%Manager%'
            AND job_title NOT LIKE '%Director%'
        )
)


SELECT
    sd.skills,
    COUNT(sd.skill_id) AS demand_count,
    ROUND(AVG(rda.salary_year_avg),0) AS avg_salary
FROM remote_data_analyst_jobs AS rda
INNER JOIN skills_job_dim AS sjd ON rda.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
GROUP BY sd.skills
HAVING
    COUNT(sd.skill_id) >= 5
ORDER BY 
    demand_count DESC,
    avg_salary DESC
