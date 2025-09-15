/*
- Find all domestic junior data jobs (not only data analyst).
*/

-- checking the data
SELECT *
FROM job_postings_fact
LIMIT 100;


SELECT 
    jpf.job_id,
    jpf.job_title,
    jpf.job_title_short,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.job_no_degree_mention,
    jpf.salary_year_avg,
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
    );

