
-- Compare average stress_level, anxiety_level, and addiction_level by platform.

SELECT
    platform_usage,
    ROUND(AVG(stress_level)::numeric,2) AS avg_stress_level,
    ROUND(AVG(anxiety_level)::numeric,2) AS avg_anxiety_level,
    ROUND(AVG(addiction_level)::numeric,2) AS avg_addiction_level
FROM
    social_med
GROUP BY
    platform_usage;

-- Find average sleep hours for users who use social media before sleep for more than 2 hours.

SELECT
    sc_before_sleep,
    ROUND(AVG(sleep_hours)::numeric,2) AS avg_sleep_hours
FROM
    social_med
WHERE
    sc_before_sleep > 2
GROUP BY
    sc_before_sleep;


-- Group users into age groups: 13-15, 16-17, 18-19, then calculate average screen time.
-- Find which platform has the highest average addiction level.
-- Compare academic performance between high, medium, and low social interaction groups.
-- Find the percentage of depressed users by gender.
-- Find users whose screen time is above the overall average.
-- Calculate average physical activity by platform.
-- Find whether students with sleep below 6 hours have higher average stress.
-- Create a summary table showing platform, user count, average screen time, 
--  average sleep, average stress, and average academic performance.