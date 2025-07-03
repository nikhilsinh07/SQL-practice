SELECT quarter1_job_postings.job_title_short,
quarter1_job_postings.job_location,
quarter1_job_postings.job_via,
quarter1_job_postings.salary_year_avg,
quarter1_job_postings.job_posted_date::Date
from(
SELECT * 
from january_jobs
UNION ALL
SELECT *
from february_jobs
Union ALL
select *
from march_jobs)
as quarter1_job_postings
where quarter1_job_postings.salary_year_avg > 70000 AND
quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY salary_year_avg