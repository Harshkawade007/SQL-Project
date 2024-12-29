# **INTRODUCTION**

Welcome to the data-driven journey into the job market! This project delves into the realm of **data analyst roles**, uncovering insights about top-paying jobs, in-demand skills, and where the sweet spot of high demand meets lucrative salaries in data analytics.

Explore the SQL queries used in this project here: [Project SQL Folder](/project_sql/)

---

# **BACKGROUND**

This project was born from the need to better understand the data analyst job market. By identifying high-paying roles and must-have skills, the goal is to streamline the process for others in finding the best opportunities in this exciting field.

### **Key Questions Explored:**

1. Which data analyst jobs offer the highest pay?  
2. What skills are essential for these top-paying roles?  
3. Which skills are in the highest demand for data analysts?  
4. Which skills directly correlate with higher salaries?  
5. What are the most strategic skills to learn for career growth?  

---

# **TOOLS USED**

To tackle this project effectively, I leveraged the following tools:

- **SQL**: The cornerstone for analyzing the database and extracting valuable insights.  
- **PostgreSQL**: A robust database management system, perfectly suited for handling job posting data.  
- **Visual Studio Code**: My preferred editor for database queries and project management.  
- **Git & GitHub**: Essential for version control, collaboration, and sharing my SQL scripts and analysis.  

---

# **THE ANALYSIS**

Each query in this project addresses a specific aspect of the data analyst job market. Here's a breakdown of how I approached the analysis:

### 1. **Top-Paying Data Analyst Jobs**

To pinpoint the most lucrative roles, I analyzed job postings based on average yearly salary and remote availability. The results highlight the highest-paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL and
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT
    10;
```

#### **Insights:**
- Salaries range from $184,000 to $650,000, reflecting the potential for significant earnings.  
- Companies like Meta, SmartAsset, and AT&T stand out as top employers.  
- Job titles vary, from **Data Analyst** to **Director of Analytics**, showcasing diverse opportunities.  

---

### 2. **Skills for Top-Paying Jobs**

This query explores the specific skills required for the highest-paying roles by joining job postings with skill data.

```sql
WITH top_paying AS (
    SELECT
        job_postings_fact.job_id,
        job_title,
        job_title_short,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
        LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL and
        job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying.*,
    skills
FROM top_paying
    INNER JOIN skills_job_dim on top_paying.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
LIMIT 5;
```

#### **Insights:**
- **SQL** is the most frequently required skill for high-paying roles, followed by **Python** and **Tableau**.  
- Advanced technical skills like **R**, **Snowflake**, and **Excel** also play a key role.  

---

### 3. **In-Demand Skills for Data Analysts**

This query identifies the most frequently requested skills in job postings.

```sql
SELECT
    skills,
    count(skills_job_dim.job_id) as demand
FROM
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand DESC
LIMIT 5;
```

#### **Top Skills:**
- **SQL** and **Excel** remain foundational.  
- Programming skills like **Python** and visualization tools such as **Tableau** and **Power BI** are increasingly critical.  

| **Skill**   | **Demand Count** |
| ----------- | ---------------: |
| SQL         |             7,291 |
| Excel       |             4,611 |
| Python      |             4,330 |
| Tableau     |             3,745 |
| Power BI    |             2,609 |

---

### 4. **Skills Associated with Higher Salaries**

This query explores the relationship between skills and average salaries.

```sql
SELECT
    skills,
    round(avg(salary_year_avg),0) as Average_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    Average_salary DESC
LIMIT 10;
```

#### **Insights:**
- Big Data and Machine Learning skills (e.g., **PySpark**, **Pandas**) lead to higher salaries.  
- Cloud computing tools (e.g., **AWS**, **Snowflake**) are in demand and command competitive salaries.  

| **Skill**       | **Average Salary ($)** |
| --------------- | ---------------------: |
| PySpark         |                208,172 |
| Couchbase       |                160,515 |
| GitLab          |                154,500 |

---

# WHAT I LEARNED

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# CONCLUSION

### Insights

From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
