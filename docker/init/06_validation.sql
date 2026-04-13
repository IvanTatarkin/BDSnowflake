SET client_encoding = 'UTF8';

SELECT 'rows in mock_data_raw' AS check_name
    , COUNT(*) AS actual_value
FROM mock_data_raw;

SELECT 'rows in fact_sales' AS check_name
    , COUNT(*) AS actual_value
FROM fact_sales;

SELECT 'broken foreign keys in fact_sales' AS check_name
    , COUNT(*) AS actual_value
FROM fact_sales fs
LEFT JOIN dim_customer c ON c.customer_id = fs.customer_id
LEFT JOIN dim_seller s ON s.seller_id = fs.seller_id
LEFT JOIN dim_store st ON st.store_id = fs.store_id
LEFT JOIN dim_supplier sup ON sup.supplier_id = fs.supplier_id
LEFT JOIN dim_product p ON p.product_id = fs.product_id
LEFT JOIN dim_date d ON d.date_id = fs.date_id
WHERE c.customer_id IS NULL
   OR s.seller_id IS NULL
   OR st.store_id IS NULL
   OR sup.supplier_id IS NULL
   OR p.product_id IS NULL
   OR d.date_id IS NULL;

SELECT 'mock_data_raw' AS table_name
    , COUNT(*) AS row_count
FROM mock_data_raw
UNION ALL
SELECT 'dim_country'
    , COUNT(*)
FROM dim_country
UNION ALL
SELECT 'dim_product_category'
    , COUNT(*)
FROM dim_product_category
UNION ALL
SELECT 'dim_pet_category'
    , COUNT(*)
FROM dim_pet_category
UNION ALL
SELECT 'dim_pet_type'
    , COUNT(*)
FROM dim_pet_type
UNION ALL
SELECT 'dim_pet_breed'
    , COUNT(*)
FROM dim_pet_breed
UNION ALL
SELECT 'dim_brand'
    , COUNT(*)
FROM dim_brand
UNION ALL
SELECT 'dim_material'
    , COUNT(*)
FROM dim_material
UNION ALL
SELECT 'dim_color'
    , COUNT(*)
FROM dim_color
UNION ALL
SELECT 'dim_size'
    , COUNT(*)
FROM dim_size
UNION ALL
SELECT 'dim_supplier_contact'
    , COUNT(*)
FROM dim_supplier_contact
UNION ALL
SELECT 'dim_date'
    , COUNT(*)
FROM dim_date
UNION ALL
SELECT 'dim_customer'
    , COUNT(*)
FROM dim_customer
UNION ALL
SELECT 'dim_seller'
    , COUNT(*)
FROM dim_seller
UNION ALL
SELECT 'dim_store'
    , COUNT(*)
FROM dim_store
UNION ALL
SELECT 'dim_supplier'
    , COUNT(*)
FROM dim_supplier
UNION ALL
SELECT 'dim_product'
    , COUNT(*)
FROM dim_product
UNION ALL
SELECT 'fact_sales'
    , COUNT(*)
FROM fact_sales
ORDER BY table_name;
