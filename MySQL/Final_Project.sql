-- Setting the working database
USE Final_Project;

-- Create a table displaying the number of accidents each year
CREATE TABLE accident_by_year AS
SELECT accident_year AS year, COUNT(*) AS accident_count
FROM collision_info
GROUP BY accident_year
ORDER BY accident_year;

SELECT * FROM accident_by_year;

-- Create a table displaying total number of accidents for each month
CREATE TABLE accident_by_month AS
SELECT 
	accident_month,
    COUNT(*) AS accident_count
FROM
	collision_info
GROUP BY 
	accident_month
ORDER BY
	CASE accident_month
		WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        When 'December' THEN 12
	END;
    
SELECT * FROM accident_by_month;

-- Create a table displaying the number of accidents by time of day
CREATE TABLE accident_time AS
SELECT 
	accident_year AS year,
	HOUR(time) AS hour_of_day,
	COUNT(*) AS accident_count
FROM
	collision_info
GROUP BY
	year,
	hour_of_day
ORDER BY
	year,
    hour_of_day;

SELECT * FROM accident_time;

-- Calculate vehicles involved in each accident as a percentage
CREATE TEMPORARY TABLE vehicle_involved AS
SELECT 
    accident_index,
    GROUP_CONCAT(vehicle_type ORDER BY vehicle_type SEPARATOR ', ') AS involved_vehicles
FROM 
    vehicle_info
GROUP BY 
    accident_index
HAVING 
    COUNT(vehicle_type) > 1 AND COUNT(vehicle_type) < 3;

CREATE TABLE vehicles_involved_percentage AS
SELECT 
    involved_vehicles,
    COUNT(*) AS group_count,
    (COUNT(*) / (SELECT COUNT(*) FROM vehicle_involved)) * 100 AS percentage_of_total
FROM 
    vehicle_involved
GROUP BY 
    involved_vehicles
ORDER BY 
    group_count DESC;
    
SELECT * FROM vehicles_involved_percentage;

-- Create a table displaying accidents by day of week for every hour
CREATE TABLE accident_day_of_week_hourly AS
SELECT 
    day_of_week,
    HOUR(time) AS hour_of_day,
    COUNT(*) AS count_of_accidents_hourly
FROM 
    collision_info
GROUP BY
    day_of_week,
    hour_of_day
ORDER BY
    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END,
    hour_of_day;

SELECT * FROM accident_day_of_week_hourly;

-- Create a table displaying the total number of accidents by day of the week
CREATE TABLE accident_day_of_week AS
SELECT 
	day_of_week,
    COUNT(*) AS accident_count
FROM 
	collision_info
GROUP BY
	day_of_week
ORDER BY
	CASE day_of_week
		WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
	END;
    
SELECT * FROM accident_day_of_week;

-- Create a table displaying the total number of accidents by accident severity (i.e., fatal vs. serious injuries vs. slight injuries)
CREATE TABLE accident_severity AS
SELECT 
    ca.casualty_severity,
    COUNT(ca.casualty_id) AS total_casualties
FROM
    collision_info c
JOIN
    casualty_info ca ON c.accident_index = ca.accident_index
GROUP BY
    ca.casualty_severity
ORDER BY
    ca.casualty_severity;

SELECT * FROM accident_severity;

 -- Create a table displaying the total number of accidents by the type of vehicle
CREATE TABLE accident_transport_type AS
SELECT
	vehicle_type,
    COUNT(*) AS count_of_transport_type
FROM
	vehicle_info
GROUP BY vehicle_type;

SELECT * FROM accident_transport_type;

-- Create a table displaying the total number of accidents by region in the UK
CREATE TABLE accident_by_region AS
SELECT 
	region,
    COUNT(*) AS count_of_accidents
FROM
	collision_info
GROUP BY
	region
ORDER BY
	count_of_accidents DESC;
    
SELECT * FROM accident_by_region;
    
-- Create a table displaying the total number of accidents by district in the UK
CREATE TABLE accidents_by_ons AS
SELECT 
	local_authority_ons_district AS code,
    COUNT(*) AS count_of_accidents
FROM
	collision_info
GROUP BY
	code
ORDER BY
	count_of_accidents DESC;
    
SELECT * FROM accidents_by_ons;

-- Create a table displaying the total number of fatalities each year by gender
CREATE TABLE fatalities_by_year_and_gender AS
SELECT 
    c.accident_year AS year,
    ca.sex_of_casualty AS gender,
    COUNT(ca.casualty_id) AS total_fatalities
FROM
    collision_info AS c
JOIN
    casualty_info AS ca ON c.accident_index = ca.accident_index
WHERE
    ca.casualty_severity = 'Fatal'
GROUP BY
    year, gender
ORDER BY
    year, gender;

SELECT * FROM fatalities_by_year_and_gender;

-- Create a table displaying the total number of fatalities for each age band. 
CREATE TABLE fatalities_age_distribution AS
SELECT 
    ca.age_band_of_casualty, 
    ca.sex_of_casualty,
    COUNT(ca.casualty_id) AS count_of_casualties
FROM 
    casualty_info ca
JOIN 
    collision_info c ON ca.accident_index = c.accident_index
WHERE 
    ca.casualty_severity = 'Fatal'
GROUP BY 
    ca.age_band_of_casualty, 
    ca.sex_of_casualty
ORDER BY 
    ca.age_band_of_casualty, 
    ca.sex_of_casualty;

SELECT * FROM fatalities_age_distribution;

-- Create a table displaying the fatalities in different regions of the UK by casualty class, year and gender.
CREATE TABLE regional_fatalities_by_casualty_class_year_gender AS
SELECT
	collision_info.region,
    collision_info.accident_year,
    casualty_info.sex_of_casualty,
    casualty_info.casualty_class,
    COUNT(*) AS count_of_fatalities
FROM 
    collision_info
JOIN
    casualty_info ON collision_info.accident_index = casualty_info.accident_index
WHERE 
    casualty_info.casualty_severity = 'Fatal'
GROUP BY
    collision_info.region, collision_info.accident_year, casualty_info.sex_of_casualty, casualty_info.casualty_class
ORDER BY
    collision_info.region, collision_info.accident_year, casualty_info.sex_of_casualty, casualty_info.casualty_class;

SELECT * FROM regional_fatalities_by_casualty_class_year_gender;

-- Create a table containing the longitude and latitude of each accidents in London to plot on a map
CREATE TABLE accident_density AS
SELECT
	longitude,
    latitude,
    accident_index
FROM collision_info
WHERE
	region = "Greater London";
    
SELECT * FROM accident_density;
