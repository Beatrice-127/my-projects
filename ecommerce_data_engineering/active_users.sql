-- DAU
SELECT 
	d AS Date,
	COUNT(customer_unique_id) AS DAU 
FROM order_time_and_value
GROUP BY d;

-- MAU
SELECT 
    TO_CHAR(d, 'YYYY-MM') AS month,
    COUNT(DISTINCT customer_unique_id) AS MAU
FROM order_time_and_value
GROUP BY TO_CHAR(d, 'YYYY-MM')
ORDER BY month;

-- HAU
SELECT 
    h AS hour,
    COUNT(DISTINCT customer_unique_id) AS HAU
FROM order_time_and_value
GROUP BY h
ORDER BY hour;

-- order per hour
SELECT 
    h AS hour,
    COUNT(order_id) AS "order per hour"
FROM order_time_and_value
GROUP BY h
ORDER BY hour;

-- quarter GMV
SELECT
	TO_CHAR(d, 'YYYY') || '-Q' || EXTRACT(QUARTER FROM d) AS year_quarter,
	SUM(total_order_value) as "quarter GMV"
FROM
	order_time_and_value
GROUP BY year_quarter
ORDER BY year_quarter

-- month GMV
SELECT 
    TO_CHAR(d, 'YYYY-MM') AS month,
    SUM(total_order_value) AS "Monthly GMV"
FROM order_time_and_value
GROUP BY TO_CHAR(d, 'YYYY-MM')
ORDER BY month;

-- quarter ARPU
SELECT 
	TO_CHAR(d, 'YYYY') || '-Q' || EXTRACT(QUARTER FROM d) AS year_quarter,
    round(sum(total_order_value)/count(customer_unique_id),2) AS "Quarterly ARPU"
FROM order_time_and_values
GROUP BY TO_CHAR(d, 'YYYY') || '-Q' || EXTRACT(QUARTER FROM d)
ORDER BY year_quarter;

-- daily ARPU
SELECT 
	d as Date,
	round(sum(total_order_value)/count(customer_unique_id),2) AS "Daily ARPU"
FROM order_time_and_value
GROUP BY d
ORDER BY d;
