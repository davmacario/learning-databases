DROP TABLE IF EXISTS album;
CREATE TABLE expenses (
    id SERIAL PRIMARY KEY,
    description VARCHAR,
    amount NUMERIC,
    date DATE
);

INSERT INTO expenses (description, amount, date) VALUES ("Groceries", 50.00, "2024-04-14");

SELECT * FROM expenses;
