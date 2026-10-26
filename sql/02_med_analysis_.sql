
--------------Compare average stress_level, anxiety_level, and addiction_level by platform.

SELECT
    platform_usage,
    ROUND(AVG(stress_level)::numeric,2) AS avg_stress_level,
    ROUND(AVG(anxiety_level)::numeric,2) AS avg_anxiety_level,
    ROUND(AVG(addiction_level)::numeric,2) AS avg_addiction_level
FROM
    social_med
GROUP BY
    platform_usage;

------------Find average sleep hours for users who use social media before sleep for more than 2 hours.

SELECT
    sc_before_sleep,
    ROUND(AVG(sleep_hours)::numeric,2) AS avg_sleep_hours
FROM
    social_med
WHERE
    sc_before_sleep > 2
GROUP BY
    sc_before_sleep;


-------------Group users into age groups: 13-15, 16-17, 18-19, then calculate average screen time.
SELECT
    CASE
        WHEN age BETWEEN 13 and 15 THEN '13 to 15'
        WHEN age BETWEEN 16 and 17 THEN '16 to 17'
        WHEN age BETWEEN 18 and 19 THEN '18 to 19'
        ELSE 'Other'
    END AS age_group,
    ROUND(AVG(screen_time)::numeric,2) AS avg_screen_time
FROM
    social_med
GROUP BY
    age_group
ORDER BY
    age_group;


---------Find which platform has the highest average addiction level---------------

SELECT
    platform_usage,
    ROUND(AVG(addiction_level)::numeric,2) as avg_addition_lvl
FROM
    social_med
GROUP BY
    platform_usage
ORDER BY
    avg_addition_lvl DESC;
    
--------Compare academic performance between high, medium, and low social interaction groups--------

SELECT
    ROUND(AVG(academic_performance)::numeric,2) AS avg_academic_performance,
    social_interaction_level
FROM
    social_med
GROUP BY
    social_interaction_level
ORDER BY
    avg_academic_performance DESC;


----------- Find the percentage of depressed users by gender---------------------------


WITH depressed_users as (
SELECT
    
    SUM(CASE 
            WHEN depression_label=1 AND
                 LOWER(gender) = 'male' THEN 1 ELSE 0 END ) as depressed_male,
    SUM(CASE 
            WHEN depression_label=1 AND
                 LOWER(gender) = 'female' THEN 1 ELSE 0 END ) as depressed_female,
    SUM(case 
            WHEN depression_label=1 THEN 1 ELSE 0 END) as total_depressed
FROM
    social_med)

SELECT
    ROUND(depressed_male*100.0/NULLIF(total_depressed,0),2) as depressed_male_percentage,
    ROUND(depressed_female*100.0/NULLIF(total_depressed,0),2) as depressed_female_percentage
FROM
    depressed_users;


-----------users whose screen time is above the overall average-------------

SELECT
    age,
    gender,
    screen_time
    -- ROUND(AVG(screen_time):: numeric,2) AS avg_screen_time
FROM
    social_med
WHERE
    screen_time > (
                    SELECT
                        AVG(screen_time)
                    FROM
                        social_med
                  )
-- GROUP BY
--     age,
--     gender
ORDER BY 
    age ASC

------------------user with higher screen time that that of avg screen time within the group of same age

with agee as (
SELECT
    age,
    gender,
    screen_time,
    ROUND(AVG(screen_time) OVER (PARTITION BY age)::numeric,2) AS avg_screen_time
FROM
    social_med)

SELECT
    -- *
    age,
    count (*) as total_user
FROM
    agee
WHERE
    screen_time > avg_screen_time
GROUP BY
    age



-----------------Calculate average physical activity by platform-----------------

SELECT
    platform_usage,
    ROUND(AVG(physical_activity)::numeric,2) AS avg_physical_activity
FROM
    social_med
GROUP BY
    platform_usage;



------Find whether students with sleep below 6 hours have higher average stress------------

SELECT
    CASE 
        WHEN sleep_hours < 6 THEN 'Below 6 hours'
        ELSE '6 hours or more'
    END AS sleep_category,
    ROUND(AVG(stress_level)::numeric,2) AS avg_stress_level
FROM
    social_med  
GROUP BY
    sleep_category;


--------Create a summary table showing platform, user count, average screen time------

SELECT
    platform_usage,
    COUNT(*) AS user_count,
    ROUND(AVG(screen_time)::numeric,2) AS avg_screen_time
FROM
    social_med  
GROUP BY
    platform_usage
ORDER BY
    avg_screen_time DESC; 
    


--------average sleep, average stress, and average academic performance------------

SELECT
    ROUND(AVG(sleep_hours)::numeric,2) AS avg_sleep_hours,
    ROUND(AVG(stress_level)::numeric,2) AS avg_stress_level,
    ROUND(AVG(academic_performance)::numeric,2) AS avg_academic_performance
FROM
    social_med;




SELECT
    CASE
        SUM(WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
        SUM(WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female_count
    END
FROM
    social_med;
--------average sleep, average stress, and average academic performance------------

SELECT
    ROUND(AVG(sleep_hours)::numeric,2) AS avg_sleep_hours,
    ROUND(AVG(stress_level)::numeric,2) AS avg_stress_level,
    ROUND(AVG(academic_performance)::numeric,2) AS avg_academic_performance
FROM
    social_med;




SELECT
    CASE
        SUM(WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
        SUM(WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female_count
    END
FROM
    social_med;