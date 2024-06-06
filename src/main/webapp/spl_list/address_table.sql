use odbo;

CREATE TABLE address_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    longitude DOUBLE NOT NULL,
    latitude DOUBLE NOT NULL,
    start_time TIME,
    end_time TIME,
    capacity INT,
    time VARCHAR(255),
    price_per_30min INT NOT NULL,
    notes VARCHAR(255),
    location VARCHAR(255),
    height_limit VARCHAR(255),
    vehicle_type VARCHAR(255),
    image BLOB,
    seller_id VARCHAR(255)
);