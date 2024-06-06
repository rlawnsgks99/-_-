use odbo;

CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    user_pw VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    user_sex ENUM('³²', '¿©') NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_tel VARCHAR(255) NOT NULL
);