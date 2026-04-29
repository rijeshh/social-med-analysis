drop table if exists social_med
create table social_med (
    age	int,
    gender varchar(20),
    screen_time FLOAT,
    platform_usage varchar(50),
    sleep_hours FLOAT,
    sc_before_sleep  FLOAT,
    academic_performance  FLOAT,
    physical_activity FLOAT	,
    social_interaction_level varchar(50),
    stress_level int,	
    anxiety_level int,	
    addiction_level int,	
    depression_label int

)