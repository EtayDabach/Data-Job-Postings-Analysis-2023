# Data Job Postings Analysis 2023
Analyzing data (and software engineering) job postings from 2023 based on data collected by Luke Barousse for his SQL course. Here I analyze the data using SQL (PostgreSQL as ORDMBS) and graphs using Python to gain insights into remote junior data jobs and in my area, Israel.

**This is not current data (from 2025), this analysis is primarily intended for training and education.**


## Tools Used For The Analysis
- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Python (NumPy, Pandas, Matplotlib)**
- **Git**

## The Analysis 
**Will be added soon**

```sql
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
```

![top 10 most demanded skills for domestic junior](assets/imgs/4_top_10_most_demanded_skills_for_domestic_junior_data_jobs_barh.png)


## Insights
**Will be added soon**
