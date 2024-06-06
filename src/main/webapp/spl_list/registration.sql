use 

CREATE TABLE registration (
  re_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20),
  address VARCHAR(50),
  details VARCHAR(200),
  image VARCHAR(100),
  parking_hours VARCHAR(50),
  PRIMARY KEY (re_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;