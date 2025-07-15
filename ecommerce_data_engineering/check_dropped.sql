-- check if there're orders dropped`
SELECT DISTINCT o.order_id
FROM olist_data o
LEFT JOIN order_time_and_value v ON o.order_id = v.order_id
WHERE v.order_id IS NULL;

--Are they dropped because of the date? Yes!
SELECT DISTINCT order_id
FROM olist_data
WHERE TO_CHAR(order_purchase_timestamp, 'YYYY-MM') NOT IN (
  '2016-09', '2016-12', '2018-09', '2018-10'
)
AND order_id IN (
  SELECT DISTINCT o.order_id
  FROM olist_data o
  LEFT JOIN order_time_and_value v ON o.order_id = v.order_id
  WHERE v.order_id IS NULL
);
