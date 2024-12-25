--SUBQUERY

SELECT *
FROM (
    SELECT * 
    from job_postings_fact
    where extract(month from job_posted_date) = 1
) as jan1_jobs 

--CTE
WITH jan2_jobs AS(
    SELECT *
    FROM job_postings_fact
    WHERE extract(month from job_posted_date) = 1
)

SELECT *
FROM jan2_jobs