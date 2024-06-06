use odbo;

CREATE TABLE payment_status (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- 결제 상태 ID (자동 증가)
    buyer_id VARCHAR(255),        -- 구매자 ID
    nickname VARCHAR(255),               -- 주소 이름
    seller_id VARCHAR(255),       -- 판매자 ID
    payment_time DATETIME,        -- 결제 시간
    startTime VARCHAR(255),      -- 이용 시작 시간
    duration INT,                 -- 이용 기간 (분)
    address_id INT,               -- 주소 ID
    status VARCHAR(255) NOT NULL           -- 결제 상태
);