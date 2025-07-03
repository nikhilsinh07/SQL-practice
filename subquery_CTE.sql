with remote_job_count AS(
select
skill_id,
count(*) as skill_count
from skills_job_dim as skills_to_job
Inner JOIN job_postings_fact as job_posting on job_posting.job_id = skills_to_job.job_id
where job_posting.job_work_from_home = TRUE AND job_title_short = 'Data Analyst'
GROUP BY skill_id)

SELECT
skills.skill_id,
skills as skill_name,
skill_count
from remote_job_count
INNER JOIN skills_dim as skills on skills.skill_id = remote_job_count.skill_id
ORDER BY skill_count DESC
limit 5;