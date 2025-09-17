/*
The 8 query reveals to me that some senior jobs are misclassified as junior jobs (not mentioned as senior in job_title, but only in the job_title_short).
So I will add here a condition to filter out senior jobs from job_title_short as well, but I will not change the previous queries. 
It is only 5 out of 3263 jobs that are misclassified, less than 1% of the data.
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
        job_title_short NOT LIKE '%Senior%'
        AND job_title NOT LIKE '%Senior%'
        AND job_title NOT LIKE '%Sr%'
        AND job_title NOT LIKE '%Lead%'
        AND job_title NOT LIKE '%Principal%'
        AND job_title NOT LIKE '%Manager%'
        AND job_title NOT LIKE '%Director%'
    )
)

SELECT 
    djd.job_title_short,
    COUNT(djd.job_id) AS job_postings_count
FROM domestic_junior_data_jobs AS djd
GROUP BY djd.job_title_short
ORDER BY job_postings_count DESC;



-- Previous results:
/*
[
  {
    "job_title_short": "Data Analyst",
    "job_postings_count": "819"
  },
  {
    "job_title_short": "Data Engineer",
    "job_postings_count": "700"
  },
  {
    "job_title_short": "Data Scientist",
    "job_postings_count": "548"
  },
  {
    "job_title_short": "Software Engineer",
    "job_postings_count": "523"
  },
  {
    "job_title_short": "Business Analyst",
    "job_postings_count": "393"
  },
  {
    "job_title_short": "Machine Learning Engineer",
    "job_postings_count": "178"
  },
  {
    "job_title_short": "Cloud Engineer",
    "job_postings_count": "97"
  },
  {
    "job_title_short": "Senior Data Scientist",
    "job_postings_count": "4"
  },
  {
    "job_title_short": "Senior Data Engineer",
    "job_postings_count": "1"
  }
]
*/



-- Updated results:
/*
[
  {
    "job_title_short": "Data Analyst",
    "job_postings_count": "819"
  },
  {
    "job_title_short": "Data Engineer",
    "job_postings_count": "700"
  },
  {
    "job_title_short": "Data Scientist",
    "job_postings_count": "548"
  },
  {
    "job_title_short": "Software Engineer",
    "job_postings_count": "523"
  },
  {
    "job_title_short": "Business Analyst",
    "job_postings_count": "393"
  },
  {
    "job_title_short": "Machine Learning Engineer",
    "job_postings_count": "178"
  },
  {
    "job_title_short": "Cloud Engineer",
    "job_postings_count": "97"
  }
]
*/
