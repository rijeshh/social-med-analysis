DROP TABLE IF EXISTS social_med; -- if any table with same name exists, drop it first


-- table creation

CREATE TABLE social_med (
    age INT,
    gender VARCHAR(20),
    screen_time FLOAT,
    platform_usage VARCHAR(50),
    sleep_hours FLOAT,
    sc_before_sleep FLOAT,
    academic_performance FLOAT,
    physical_activity FLOAT,
    social_interaction_level VARCHAR(50),
    stress_level INT,
    anxiety_level INT,
    addiction_level INT,
    depression_label INT
);
