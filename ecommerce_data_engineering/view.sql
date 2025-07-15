-- get order time datas
CREATE TABLE order_time AS
SELECT 
	order_id,
	customer_id,
	customer_unique_id,
    EXTRACT(YEAR FROM order_purchase_timestamp) AS y,
    EXTRACT(QUARTER FROM order_purchase_timestamp) AS q,
    EXTRACT(MONTH FROM order_purchase_timestamp) AS m,
    DATE(order_purchase_timestamp) AS d,
    EXTRACT(HOUR FROM order_purchase_timestamp) AS h
FROM olist_data
WHERE TO_CHAR(order_purchase_timestamp, 'YYYY-MM') NOT IN ('2016-09', '2016-12', '2018-09', '2018-10'); -- outfier

-- calculate order value
CREATE VIEW order_total_summary AS
SELECT
    order_id,
    SUM(price) AS total_product_value,
    SUM(freight_value) AS total_freight,
    SUM(price + freight_value) AS total_order_value
FROM olist_data
GROUP BY order_id;

-- view with customer info
CREATE VIEW order_with_customer_summary AS
SELECT
    o.order_id,
    d.customer_id,
    d.customer_unique_id,
    o.total_product_value,
    o.total_freight,
    o.total_order_value
FROM order_total_summary o
JOIN (
    SELECT DISTINCT order_id, customer_id, customer_unique_id
    FROM olist_data
) d ON o.order_id = d.order_id;

--view of customer total value:
CREATE VIEW customer_total_value AS
SELECT
    customer_unique_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_order_value) AS total_spent,
    SUM(total_freight) AS total_freight_paid
FROM order_with_customer_summary
GROUP BY customer_unique_id
ORDER BY total_spent DESC;

-- combine value and time
CREATE VIEW order_time_and_value AS
SELECT
	a.order_id,
	a.customer_id,
	a.customer_unique_id,
	round(a.total_order_value::numeric, 2) as total_order_value,
	y,q,m,d,h
	FROM order_with_customer_summary a
	INNER JOIN order_time b
	ON a.order_id=b.order_id;