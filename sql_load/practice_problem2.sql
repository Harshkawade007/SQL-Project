
WITH jobs as(
SELECT *
FROM jan_jobs
UNION
SELECT *
FROM feb_jobs
UNION
SELECT *
FROM march_jobs
)
Select
    job_title_short,
    job_location, job_via, job_posted_date::date,
    salary_year_avg
from
    jobs
where
    salary_year_avg > 70000 and job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg desc
