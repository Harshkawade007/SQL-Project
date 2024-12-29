
WITH top_paying AS(
SELECT
    job_postings_fact.job_id,
    job_title,
    job_title_short,
   
    salary_year_avg,
    
    
    name as company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
   
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL and
    job_location = 'Anywhere' 
    
ORDER BY    
    salary_year_avg DESC
limit 10
)

SELECT 
    top_paying.*,
    skills
from top_paying
INNER JOIN skills_job_dim on top_paying.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

ORDER by salary_year_avg desc
limit 5

/* 
-*******RESULTS*******

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  }
]
*/