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
    