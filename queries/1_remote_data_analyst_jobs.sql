/*
- Identify all data analyst roles that are available remotely.
- Do not include senior or leadership positions.
- Focus on job postings with specified annual salaries (remove null values).
*/

-- checking the data
SELECT *
FROM job_postings_fact
LIMIT 100;


SELECT
    jpf.job_title,
    jpf.job_title_short,
    jpf.job_location,
    jpf.search_location,
    jpf.job_schedule_type,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.salary_year_avg,
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
ORDER BY salary_year_avg DESC;

