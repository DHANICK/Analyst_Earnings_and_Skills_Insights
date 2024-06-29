/* 
Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest-paying Data Analyst jobs from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job 
-seekers understand which skills to develop that align with top salaries
*/

WITH  top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        NAME as company_name,
        salary_year_avg,
        job_posted_date
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg

/*
SQL & Python: Essential for data analysis and manipulation, dominating job requirements.
Tableau: Key for data visualization and presenting insights effectively.
R: Crucial for complex statistical analysis.
Excel: Fundamental for data manipulation and reporting tasks.
Snowflake: Important for cloud-based data warehousing solutions.
Advanced Tools: Power BI, Gitlab, Bitbucket, 
and Jira are valuable for their collaborative and analytical functionalities.
*/