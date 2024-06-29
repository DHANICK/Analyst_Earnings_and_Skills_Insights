/*
Question: What are the top skills based on salary? 
-Look at the average salary associated with each skill for Data Analyst positions.
-It reveals how different skills impact salary levels for Data Analysts and 
-Helps identify the most critically demanding skills to acquire or improve.".
*/


SELECT
   skills,
   ROUND (AVG(salary_year_avg), 0)  AS avg_salary
FROM 
   job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
   job_title_short = 'Data Analyst' 
   AND salary_year_avg IS NOT NULL
   AND job_work_from_home = TRUE
GROUP BY
   skills
ORDER BY
   avg_salary DESC
LIMIT 25


/*
Concise summary in three bullet points:

-Data Engineering & Big Data: High-paying roles require skills in tools like PySpark, Databricks,
 and Elasticsearch, reflecting a strong demand for handling large datasets and streamlining data workflows.

-Programming & Cloud: Expertise in modern languages (e.g., Swift, Golang)
 and cloud platforms (e.g., Kubernetes, GCP) is crucial, along with DevOps tools like Gitlab 
 and Jenkins for efficient data infrastructure and collaboration.

-Machine Learning & Analysis: Proficiency in machine learning tools (e.g., DataRobot, Scikit-learn)
 and data manipulation libraries (e.g., Pandas, Numpy) is highly valued, 
 emphasizing their role in predictive analytics and data insights.
/*