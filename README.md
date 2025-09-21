# Data Job Postings Analysis 2023
Analyzing data (and software engineering) job postings from 2023 based on data collected by Luke Barousse for his SQL course. Here I analyze the data using SQL (PostgreSQL as ORDMBS) and graphs using Python to gain insights into remote junior data jobs and in my area, Israel.

**This is not current data (from 2025), this analysis is primarily intended for training and education.**

## About The Data
As mentioned above, this data was collected by Luke Barousse through [datanerd.tech](https://datanerd.tech/) in 2023 and is divided to 4 tables:


- **job_postings_fact**:

The main table with all the information about the job

| job_id | company_id | job_title_short | job_title                  | job_location         | job_via          | job_schedule_type | work_from_home | search_location         | job_posted_date      | no_degree_mention | health_insurance | job_country    | salary_rate | salary_year_avg | salary_hour_avg |
|--------|------------|-----------------|----------------------------|----------------------|------------------|------------------|----------------|-------------------------|----------------------|------------------|-----------------|----------------|-------------|----------------|----------------|
| 0      | 0          | Data Analyst    | Marketing Data Analyst     | Anywhere             | via LinkedIn     | Full-time        | true           | Serbia                  | 2023-09-25 17:46:06 | false            | false           | Serbia         | null        | null           | null           |
| 1      | 617        | Data Analyst    | Sr. Data Analyst           | West Bridgewater, MA | via Adzuna       | Full-time        | false          | New York, United States | 2023-03-02 09:00:54 | false            | true            | United States  | null        | null           | null           |
| 2      | 1364       | Data Analyst    | Data Analyst Data Translator | Naperville, IL    | via LinkedIn     | Full-time        | false          | Illinois, United States | 2023-04-26 21:02:49 | false            | false           | United States  | null        | null           | null           |
| 3      | 106974     | Data Engineer   | Data Engineer              | Canada               | via Trabajo.org  | Full-time        | false          | Canada                  | 2023-05-25 06:27:07 | false            | false           | Canada         | null        | null           | null           |
| 4      | 28182      | Data Engineer   | BI Data Engineer (m/w/d)   | Munich, Germany      | via KTLA Jobs    | Full-time        | false          | Germany                 | 2023-05-26 16:20:12 | true             | false           | Germany        | null        | null           | null           |

with job_id as the PRIMARY KEY and **787,686** <ins> different job postings </ins> (rows).


- **company_dim**:
  
Table for all the companies mentioned in the job_postings_fact table

| company_id | name                      | link                        | link_google                                                                                                                                       | thumbnail                                                                                                                             |
|------------|---------------------------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Cryptology                | null                        | https://www.google.com/search?sca_esv=568425080&gl=us&hl=en&q=Cryptology&sa=X&ved=0ahUKEwiLv6_v1seBAxUjVTUKHU8NDcEQmJACCL0J     | https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSasIwLJ4AgJ_x7d19N2iIdiuxJL519GTE6sxjWIeA&s                                   |
| 1          | Edraak                    | null                        | https://www.google.com/search?hl=en&gl=us&q=Edraak&sa=X&ved=0ahUKEwiQqpejrbiAAxWsFVkFHZnxCLY4ChCYkAII1Ak                        | https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy7BDVLI1v0TTiEd_1-A9erQIeLXnbzmstT3FzCrk&s                                   |
| 2          | Groupe ADP                | http://www.groupeadp.fr/    | https://www.google.com/search?gl=us&hl=en&q=Groupe+ADP&sa=X&ved=0ahUKEwix4rflpLOAAxVILVkFHaXmB9w4PBCYkAII-As                    | https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy7BDVLI1v0TTiEd_1-A9erQIeLXnbzmstT3FzCrk&s                                   |
| 3          | Interactive Resources - iR | null                        | https://www.google.com/search?q=Interactive+Resources+-+iR&sa=X&ved=0ahUKEwiRtI28yY_-AhVIMlkFHf_-CWo4WhCYkAIIlQo                | https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRy51d7d6kARXhB5XkjLXjztfqG6S3R1JAXhxxWMI&s                                   |
| 4          | Cybernetic Search         | null                        | https://www.google.com/search?gl=us&hl=en&q=Cybernetic+Search&sa=X&ved=0ahUKEwjElfiG-_j9AhXDRzABHcRICk8QmJACCLkJ                 | https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8Py43j7ySQpLYB4yBLsFWk5DYTbdR0z8TguNxdLI&s                                   |

with company_id as the PRIMARY KEY and **140,033** <ins> different companies </ins>.

The job_postings_fact table and company_dim table can be linked through company_id column.



- **skills_dim**:

Table for all the skills mentioned

| skill_id | skills | type        |
|----------|--------|-------------|
| 0        | sql    | programming |
| 1        | python | programming |
| 2        | nosql  | programming |
| 3        | scala  | programming |
| 4        | java   | programming |

with skill_id as PRIMARY KEY and **259** <ins> different skills. </ins>


- **skills_job_dim**:

Table to connect the required skills for each job posting

| job_id | skill_id |
|--------|----------|
| 0      | 0        |
| 0      | 1        |
| 0      | 181      |
| 0      | 182      |
| 0      | 183      |

with (job_id, skill_id) as PRIMARY KEY and **3669604** <ins> different combinations </ins>.
This table connect to job_postings_fact through job_id and skills_dim through skill_id.

Base on the different number of rows from job_postings_fact we can assume that each job require more than 1 skill, or about

$$\frac{\text{skills job dim number of rows}}{\text{job postings fact number of rows}} = \frac{3669604}{787686} \approx 4.66 $$

So lets assume that about 5 different skills is required per job


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
