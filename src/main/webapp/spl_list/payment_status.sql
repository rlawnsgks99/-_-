use odbo;

CREATE TABLE payment_status (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- ���� ���� ID (�ڵ� ����)
    buyer_id VARCHAR(255),        -- ������ ID
    nickname VARCHAR(255),               -- �ּ� �̸�
    seller_id VARCHAR(255),       -- �Ǹ��� ID
    payment_time DATETIME,        -- ���� �ð�
    startTime VARCHAR(255),      -- �̿� ���� �ð�
    duration INT,                 -- �̿� �Ⱓ (��)
    address_id INT,               -- �ּ� ID
    status VARCHAR(255) NOT NULL           -- ���� ����
);