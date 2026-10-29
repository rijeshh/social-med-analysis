-- medium level sql

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
