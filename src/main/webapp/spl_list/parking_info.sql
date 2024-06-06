use odbo;

CREATE TABLE parking_info (
  id INT AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(255) NOT NULL,
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  parking_nickname VARCHAR(255) NOT NULL,
  parking_capacity INT NOT NULL,
  parking_time VARCHAR(255) NOT NULL,
  price INT NOT NULL,
  notes TEXT,
  location VARCHAR(255) NOT NULL,
  height_limit VARCHAR(255) NOT NULL,
  vehicle_type VARCHAR(255) NOT NULL,
  image BLOB
);