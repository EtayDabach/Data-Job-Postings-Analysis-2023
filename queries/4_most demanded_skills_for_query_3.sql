/*
What are the most in-demand skills for junior data jobs from query 3?
- Join job postings to inner join table.
- Identify the all in-demand skills for all junior data jobs where the count is >= 5.
-*- Only the count is needed, no average salary (most of the postings have null on salary ). -*-
*/


-- checking the data
SELECT *
FROM skills_job_dim
LIMIT 100;

SELECT *
FROM skills_dim
LIMIT 100;


WITH domestic_junior_data_jobs AS (
    SELECT
        jpf.*,  -- Select all columns from job_postings_fact
        cd.name AS company_name
    FROM job_postings_fact AS jpf
    INNER JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE
    job_country = 'Israel'
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
    COUNT(sd.skill_id) AS demand_count
FROM domestic_junior_data_jobs AS djd
INNER JOIN skills_job_dim AS sjd ON djd.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
GROUP BY sd.skills
HAVING
    COUNT(sd.skill_id) >= 5
ORDER BY
    demand_count DESC