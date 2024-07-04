USE Final_Project;

DROP TABLE collision_info;

CREATE TABLE collision_info (
	accident_index BIGINT PRIMARY KEY,
    accident_year INT,
    longitude DECIMAL (10,8),
    latitude DECIMAL (11,8),
    accident_severity CHAR (20),
    day_of_week CHAR (10),
    time TIME,
    accident_month CHAR(20),
    region CHAR (40),
    local_authority_ons_district VARCHAR(40)
);

DROP TABLE vehicle_info;

CREATE TABLE vehicle_info (  
    vehicle_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	accident_index BIGINT, 
    vehicle_type CHAR (10),
    sex_of_driver CHAR (10),
    age_band_of_driver CHAR (10),
    FOREIGN KEY (accident_index) REFERENCES collision_info(accident_index)
);

DROP TABLE casualty_info;

CREATE TABLE casualty_info(
	casualty_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	accident_index BIGINT, 
    casualty_class CHAR (10),
    sex_of_casualty CHAR (10),
    age_band_of_casualty CHAR (10),
    casualty_severity CHAR (20),
    FOREIGN KEY (accident_index) REFERENCES collision_info(accident_index)
);
    