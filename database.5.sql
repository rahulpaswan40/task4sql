CREATE TABLE manufacturers (
    mfg_id INT PRIMARY KEY,
    mfg_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

INSERT INTO manufacturers (mfg_id, mfg_name, country)
VALUES
(10, 'Toyoda', 'Japan'),
(20, 'VeeW', 'Germany'),
(30, 'Fordo', 'USA');

SELECT * FROM manufacturers;


CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    year INT,
    price NUMERIC(10, 2),
    mfg_id INT REFERENCES manufacturers(mfg_id)
);

INSERT INTO cars (model_name, year, price, mfg_id)
VALUES
('Corolla', 2024, 25000.00, 10),
('Golf', 2023, 31000.00, 20),
('Mustang', 2024, 45000.00, 30),
('Prius', 2024, 28500.00, 10),
('Passat', 2023, 35500.00, 20);

SELECT * FROM cars;


SELECT
    c.model_name,
    c.year,
    c.price,
    m.mfg_name AS manufacturer,
    m.country
FROM
    cars c
JOIN
    manufacturers m ON c.mfg_id = m.mfg_id
ORDER BY
    m.mfg_name, c.year DESC;


DROP TABLE cars;
DROP TABLE manufacturers;
