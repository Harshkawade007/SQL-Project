


SELECT
     name as company_name,
     company_id
FROM company_dim
where company_id in (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
)

with company_job_count as(

    SELECT
        company_id,
        count(company_id) as job_count
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)

select 
   company_dim. name,
    company_job_count.job_count
from 
    company_dim
    left join company_job_count on company_dim.company_id = company_job_count.company_id
order BY
    job_count desc