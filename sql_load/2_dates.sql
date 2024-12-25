SELECT  
    EXTRACT(MONTH FROM job_posted_date) as month,
    count(job_id) as jobs
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    jobs desc