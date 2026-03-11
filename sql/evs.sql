-- 
.tables
DELETE FROM customers;
INSERT INTO customers (customer_id, customer_name, subscription_type, signup_date)
VALUES
(1, 'Ahsan Khan', 'Basic', '2025-11-10'),
(2, 'Sara Ali', 'Premium', '2025-12-05'),
(3, 'Marco Rossi', 'Basic', '2026-01-15');
SELECT * FROM customers;


DELETE FROM stations;
INSERT INTO stations (station_id, station_name, city, charger_type, max_power_kw)
VALUES
(101, 'Roma Centro Station', 'Rome', 'DC Fast', 150),
(102, 'Milano Green Hub', 'Milan', 'AC', 22),
(103, 'Napoli Charge Point', 'Naples', 'DC Fast', 120);
SELECT * FROM stations;

--selecting specific column from customer table 

SELECT customer_name, subscription_type
FROM customers;

--selecting specific column from station table 
SELECT station_name, city FROM stations;

--show only the rows that match a condition
SELECT * FROM customers WHERE subscription_type = 'Premium';

---Show stations in Rome
SELECT * FROM stations WHERE city = 'Rome';

---sort the results show customers sorted by name
SELECT *
FROM customers
ORDER BY customer_name;
---- decensding order 
SELECT * 
FROM Stations 
ORDER BY max_power_kw DESC;

--- count total number of customers
SELECT COUNT(*) AS total_cutomers FROM customers;

SELECT COUNT(*) AS total_stations FROM stations;

---- average power of all stations
SELECT AVG(max_power_kw) AS average FROM stations;

--- add all numeric value 
SELECT SUM(max_power_kw) AS total_power FROM stations;

---- make summary for each catagories of subscription 
SELECT subscription_type, COUNT(*) AS total_customers 
From customers 
Group BY subscription_type;
---show average power for each charger type
SELECT charger_type, AVG(max_power_kw) AS average_power from stations group by charger_type;

---- join query 
SELECT c.customer_name, cs.cost_eur
FROM customers c
JOIN charging_sessions cs
ON c.customer_id = cs.customer_id;

INSERT INTO charging_sessions (session_id, customer_id, station_id, cost_eur)
VALUES
(1001, 1, 101, 18.40),
(1002, 2, 102, 11.70),
(1003, 1, 103, 20.50);
SELECT * FROM charging_sessions;


SELECT name
FROM sqlite_master
WHERE type = 'table';

SELECT c.customer_name, cs.cost_eur
FROM customers c
JOIN charging_sessions cs
ON c.customer_id = cs.customer_id;

SELECT s.city, cs.cost_eur
FROM charging_sessions cs
JOIN stations s
ON cs.station_id = s.station_id;








