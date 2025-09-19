/*
What is the junior job postings count per country?
*/


SELECT 
    job_country,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE
    job_title_short NOT LIKE '%Senior%'
    AND job_title NOT LIKE '%Senior%'
    AND job_title NOT LIKE '%Sr%'
    AND job_title NOT LIKE '%Lead%'
    AND job_title NOT LIKE '%Principal%'
    AND job_title NOT LIKE '%Manager%'
    AND job_title NOT LIKE '%Director%'
GROUP BY job_country
ORDER BY 
    job_count DESC