------------Count the total number of records in the dataset--------------
SELECT 
    COUNT(*) AS total_records
FROM 
    social_med;

----------Find the number of male and female participants------------

SELECT 
    gender,
    COUNT(*) AS gender_count
FROM 
    social_med
GROUP BY 
    gender;

--------------Show the minimum, maximum, and average age-----------

SELECT 
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    ROUND(AVG(age) ,0) AS avg_age
FROM social_med;

------Count users by platform_usage-----------------

SELECT 
    platform_usage,
    COUNT(*) AS count
FROM 
    social_med
GROUP BY 
    platform_usage;

----------------Find the average screen_time for each platform------------

SELECT 
    platform, 
    AVG(screen_time) AS avg_screen_time
FROM 
    social_med
GROUP BY 
    platform;

-----------Find the average sleep_hours by gender-----------------

SELECT
    gender,
    ROUND(AVG(sleep_hours)::numeric,2) as average_sleep_hours  -- since sleep_hours is a float, 
                                                               -- ROUND(float,int) is not supported so we cast it to numeric before rounding
FROM
    social_med
GROUP BY
    gender;

----------------Count users by social_interaction_level----------

SELECT 
    social_interaction_level,
    COUNT(*) AS total_count
FROM 
    social_med
GROUP BY 
    social_interaction_level;

-----Find how many users are marked with depression_label = 1-----------

SELECT 
    COUNT(*) AS depressed_users_lvl=1
FROM 
    social_med
WHERE 
    depression_label = 1;

------Show the top 10 users with the highest screen_time-----------

SELECT
    age,
    ROUND(AVG(screen_time)::numeric,2) AS avg_screen_time
FROM 
    social_med
GROUP BY
    age
ORDER BY 
    avg_screen_time DESC
LIMIT 10;

-------------Find the average academic performance of all students-----------------

SELECT
    age,
    ROUND(AVG(academic_performance)::numeric,2) AS avg_academic_performance
FROM
    social_med
GROUP BY
    age
