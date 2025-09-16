/*
Which companies have the most job postings for domestic junior data roles?
*/


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
    djd.company_name,
    COUNT(djd.job_id) AS job_postings_count
FROM domestic_junior_data_jobs AS djd
GROUP BY djd.company_name
ORDER BY job_postings_count DESC