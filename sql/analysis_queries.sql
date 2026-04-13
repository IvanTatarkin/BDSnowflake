SELECT COUNT(*) AS total_rows
FROM mock_data_raw;

SELECT
    COUNT(*) AS all_rows
    , COUNT(DISTINCT source_row_id) AS distinct_source_ids
FROM mock_data_raw;

SELECT
    COUNT(DISTINCT sale_customer_id) AS customers_in_source
    , COUNT(DISTINCT sale_seller_id) AS sellers_in_source
    , COUNT(DISTINCT sale_product_id) AS products_in_source
FROM mock_data_raw;

SELECT product_category
    , COUNT(*) AS cnt
FROM mock_data_raw
GROUP BY product_category
ORDER BY cnt DESC;

SELECT pet_category
    , COUNT(*) AS cnt
FROM mock_data_raw
GROUP BY pet_category
ORDER BY cnt DESC;

SELECT customer_country
    , COUNT(*) AS cnt
FROM mock_data_raw
GROUP BY customer_country
ORDER BY cnt DESC
LIMIT 10;

SELECT
    MIN(sale_date) AS first_sale_date
    , MAX(sale_date) AS last_sale_date
FROM mock_data_raw;

SELECT
    MIN(sale_total_price) AS min_sale_total
    , MAX(sale_total_price) AS max_sale_total
    , ROUND(AVG(sale_total_price), 2) AS avg_sale_total
FROM mock_data_raw;

SELECT
    SUM(CASE WHEN customer_email IS NULL THEN 1 ELSE 0 END) AS customer_email_nulls
    , SUM(CASE WHEN seller_email IS NULL THEN 1 ELSE 0 END) AS seller_email_nulls
    , SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS product_name_nulls
    , SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS sale_date_nulls
FROM mock_data_raw;

SELECT *
FROM mock_data_raw
LIMIT 10;
