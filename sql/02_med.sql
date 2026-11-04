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



-- Correct way for that (very important pattern)
-- Use a subquery:

SELECT *
FROM (
    SELECT
    month,
    store,
    sales,
    SUM(sales) OVER(
        PARTITION BY store
        ORDER BY month
    ) AS running_sales
    FROM sales_data
) t
WHERE month IN ('Jan', 'Feb');

-- // Basic filtering
SELECT
month,
store,
sales,
SUM(sales) OVER(
PARTITION BY store
ORDER BY month
) AS running_sales
FROM sales_data
WHERE month IN ('Jan', 'Feb');


-- ORDER BY with CASE
-- Useful when you want custom order.


SELECT *
FROM employees
ORDER BY
CASE
    WHEN dept = 'HR' THEN 1
    WHEN dept = 'IT' THEN 2
    ELSE 3
END;

-- ORDER BY with PARTITION BY

SELECT
name,
dept,
salary,
ROW_NUMBER() OVER(
PARTITION BY dept
ORDER BY salary DESC
) AS rank
FROM employees;


-- Correct way for that (very important pattern)
-- Use a subquery:


-- SELECT *
-- FROM (
--     SELECT
--     month,
--     store,
--     sales,
--     SUM(sales) OVER(
--         PARTITION BY store
--         ORDER BY month
--     ) AS running_sales
--     FROM sales_data
-- ) t
-- WHERE month IN ('Jan', 'Feb');

-- -- 5. Why this works
-- -- Step 1 (inside query):

-- -- 👉 SQL calculates running total on all months

-- -- Step 2 (outer query):

-- -- 👉 Then filters only Jan & Feb
-- -- 6. Difference summary
-- -- Approach	Behavior
-- -- WHERE before window	ignores previous data
-- -- WHERE after window (subquery)	keeps full history


-- 7. Simple intuition
-- Think like this:
-- Query 1 (WHERE inside)
-- 👉 "Give me Jan & Feb data, then calculate"
-- Query 2 (subquery)
-- 👉 "Calculate everything first, then show Jan & Feb"
-- 8. Small tip (very practical)
-- If your month is text like 'Jan', 'Feb', ordering may break.

-- Better to use:
-- ORDER BY 
-- CASE 
--   WHEN month = 'Jan' THEN 1
--   WHEN month = 'Feb' THEN 2
--   WHEN month = 'Mar' THEN 3
-- END

-- OR ideally use a proper date column.