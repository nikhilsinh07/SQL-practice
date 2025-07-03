SELECT
count(job_id) as job_count,
CASE
 when job_location = 'Anywhere' then 'Remote'
 when job_location = 'New York, NY' then 'Local'
 else 'On-site'
 end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by location_category;