--Count of AI vs Non-AI roles 

SELECT
    SUM(CASE WHEN role = 'AI_Role' THEN 1 ELSE 0 END) AS ai_roles,
    SUM(CASE WHEN role = 'Non_AI_Role' THEN 1 ELSE 0 END) AS non_ai_roles
FROM
    job_postings;


--Top industries posting AI-related jobs

SELECT
    industry,
    COUNT(*) AS ai_job_count
FROM
    job_postings
WHERE
    role = 'AI_Role'
GROUP BY
    industry
ORDER BY
    ai_job_count DESC
LIMIT 10;

---Trend of AI job postings over months

SELECT
    TO_CHAR(posting_date, 'MM') AS month,
    COUNT(*) AS ai_job_count
FROM
    job_postings
WHERE
    role = 'AI_Role'
GROUP BY
    TO_CHAR(posting_date, 'MM')
ORDER BY
    month;

---Industries hiring the most junior-level roles (0–2 years)

SELECT
	industry,
	experience_level
FROM
	job_postings
WHERE
	experience_level = '0-2';

--Locations with the highest number of AI jobs

SELECT
    location,
    COUNT(*) AS ai_job_count
FROM
    job_postings
WHERE
    role = 'AI_Role'
GROUP BY
    location
ORDER BY
    ai_job_count DESC;

--Industries with increasing AI adoption over time

SELECT
    industry,
    posting_date,
    COUNT(*) AS ai_job_count
FROM
    job_postings
WHERE
    role = 'AI_Role'
GROUP BY
    industry, 
	posting_date
ORDER BY
    industry, 
	posting_date;

--Domain-specific AI adoption comparison

SELECT
    domain_specific,
    COUNT(*) FILTER (WHERE role = 'AI_Role') AS ai_roles,
    COUNT(*) FILTER (WHERE role = 'Non_AI_Role') AS non_ai_roles
FROM
    job_postings
GROUP BY
    domain_specific;




