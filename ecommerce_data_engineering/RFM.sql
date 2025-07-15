-- create Recency
CREATE VIEW RFM_recency AS
WITH max_date AS (
    SELECT MAX(d) AS max_d FROM order_time_and_value
),
last_order AS (
    SELECT 
        customer_unique_id,
        MAX(d) AS last_order_date
    FROM order_time_and_value
    GROUP BY customer_unique_id
)
SELECT 
    l.customer_unique_id,
    (m.max_d - l.last_order_date) AS recency
FROM last_order l, max_date m;

-- create Frequency
CREATE VIEW RFM_frequency AS
SELECT
	customer_unique_id,
	total_orders AS frequency
FROM customer_total_value

-- create Monetary
CREATE VIEW rfm_monetary AS
SELECT 
	customer_unique_id,
	round(total_spent::numeric,2) AS Monetary
FROM customer_total_value

-- combine RFM
CREATE VIEW RFM_base AS
SELECT
    r.customer_unique_id,
    r.recency,
    f.frequency,
    m.monetary
FROM rfm_recency r
JOIN rfm_frequency f ON r.customer_unique_id = f.customer_unique_id
JOIN rfm_monetary m ON r.customer_unique_id = m.customer_unique_id;

-- create RFM score
CREATE VIEW rfm_scored AS
SELECT
	customer_unique_id,
    recency,
	frequency,
    monetary,

    -- scoring:
	6 - NTILE(5) OVER (ORDER BY recency) AS r_score,   
	NTILE(5) OVER (ORDER BY frequency) AS f_score,     
    NTILE(5) OVER (ORDER BY monetary) AS m_score       

FROM rfm_base