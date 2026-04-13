SET client_encoding = 'UTF8';
SET datestyle = 'ISO, MDY';

INSERT INTO dim_country (country_name)
SELECT DISTINCT country_name
FROM (
    SELECT NULLIF(TRIM(customer_country), '') AS country_name FROM mock_data_raw
    UNION
    SELECT NULLIF(TRIM(seller_country), '') AS country_name FROM mock_data_raw
    UNION
    SELECT NULLIF(TRIM(store_country), '') AS country_name FROM mock_data_raw
    UNION
    SELECT NULLIF(TRIM(supplier_country), '') AS country_name FROM mock_data_raw
) AS countries
WHERE country_name IS NOT NULL;

INSERT INTO dim_product_category (product_category_name)
SELECT DISTINCT NULLIF(TRIM(product_category), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(product_category), '') IS NOT NULL;

INSERT INTO dim_color (color_name)
SELECT DISTINCT NULLIF(TRIM(product_color), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(product_color), '') IS NOT NULL;

INSERT INTO dim_size (size_name)
SELECT DISTINCT NULLIF(TRIM(product_size), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(product_size), '') IS NOT NULL;

INSERT INTO dim_brand (brand_name)
SELECT DISTINCT NULLIF(TRIM(product_brand), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(product_brand), '') IS NOT NULL;

INSERT INTO dim_material (material_name)
SELECT DISTINCT NULLIF(TRIM(product_material), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(product_material), '') IS NOT NULL;

INSERT INTO dim_pet_category (pet_category_name)
SELECT DISTINCT NULLIF(TRIM(pet_category), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(pet_category), '') IS NOT NULL;

INSERT INTO dim_pet_type (pet_type_name)
SELECT DISTINCT NULLIF(TRIM(customer_pet_type), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(customer_pet_type), '') IS NOT NULL;

INSERT INTO dim_pet_breed (pet_breed_name)
SELECT DISTINCT NULLIF(TRIM(customer_pet_breed), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(customer_pet_breed), '') IS NOT NULL;

INSERT INTO dim_supplier_contact (supplier_contact_name)
SELECT DISTINCT NULLIF(TRIM(supplier_contact), '')
FROM mock_data_raw
WHERE NULLIF(TRIM(supplier_contact), '') IS NOT NULL;

INSERT INTO dim_date (
    date_id,
    full_date,
    calendar_year,
    calendar_quarter,
    calendar_month,
    calendar_day,
    month_name
)
SELECT DISTINCT
    TO_CHAR(sale_date, 'YYYYMMDD')::INTEGER AS date_id,
    sale_date AS full_date,
    EXTRACT(YEAR FROM sale_date)::INTEGER AS calendar_year,
    EXTRACT(QUARTER FROM sale_date)::INTEGER AS calendar_quarter,
    EXTRACT(MONTH FROM sale_date)::INTEGER AS calendar_month,
    EXTRACT(DAY FROM sale_date)::INTEGER AS calendar_day,
    TO_CHAR(sale_date, 'Month') AS month_name
FROM mock_data_raw
WHERE sale_date IS NOT NULL;

INSERT INTO dim_customer (
    customer_nk,
    source_customer_id,
    first_name,
    last_name,
    age,
    email,
    country_id,
    postal_code,
    pet_type_id,
    pet_name,
    pet_breed_id
)
SELECT DISTINCT
    md5(
        concat_ws(
            '||',
            COALESCE(TRIM(customer_first_name), ''),
            COALESCE(TRIM(customer_last_name), ''),
            COALESCE(TRIM(customer_email), ''),
            COALESCE(TRIM(customer_country), ''),
            COALESCE(TRIM(customer_postal_code), ''),
            COALESCE(TRIM(customer_pet_type), ''),
            COALESCE(TRIM(customer_pet_name), ''),
            COALESCE(TRIM(customer_pet_breed), ''),
            COALESCE(customer_age::TEXT, '')
        )
    ) AS customer_nk,
    sale_customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    dc.country_id,
    NULLIF(TRIM(customer_postal_code), ''),
    dpt.pet_type_id,
    customer_pet_name,
    dpb.pet_breed_id
FROM mock_data_raw m
LEFT JOIN dim_country dc
    ON dc.country_name = NULLIF(TRIM(m.customer_country), '')
LEFT JOIN dim_pet_type dpt
    ON dpt.pet_type_name = NULLIF(TRIM(m.customer_pet_type), '')
LEFT JOIN dim_pet_breed dpb
    ON dpb.pet_breed_name = NULLIF(TRIM(m.customer_pet_breed), '');

INSERT INTO dim_seller (
    seller_nk,
    source_seller_id,
    first_name,
    last_name,
    email,
    country_id,
    postal_code
)
SELECT DISTINCT
    md5(
        concat_ws(
            '||',
            COALESCE(TRIM(seller_first_name), ''),
            COALESCE(TRIM(seller_last_name), ''),
            COALESCE(TRIM(seller_email), ''),
            COALESCE(TRIM(seller_country), ''),
            COALESCE(TRIM(seller_postal_code), '')
        )
    ) AS seller_nk,
    sale_seller_id,
    seller_first_name,
    seller_last_name,
    seller_email,
    dc.country_id,
    NULLIF(TRIM(seller_postal_code), '')
FROM mock_data_raw m
LEFT JOIN dim_country dc
    ON dc.country_name = NULLIF(TRIM(m.seller_country), '');

INSERT INTO dim_store (
    store_nk,
    store_name,
    store_location,
    city,
    state,
    country_id,
    phone,
    email
)
SELECT DISTINCT
    md5(
        concat_ws(
            '||',
            COALESCE(TRIM(store_name), ''),
            COALESCE(TRIM(store_location), ''),
            COALESCE(TRIM(store_city), ''),
            COALESCE(TRIM(store_state), ''),
            COALESCE(TRIM(store_country), ''),
            COALESCE(TRIM(store_phone), ''),
            COALESCE(TRIM(store_email), '')
        )
    ) AS store_nk,
    store_name,
    store_location,
    store_city,
    NULLIF(TRIM(store_state), ''),
    dc.country_id,
    store_phone,
    store_email
FROM mock_data_raw m
LEFT JOIN dim_country dc
    ON dc.country_name = NULLIF(TRIM(m.store_country), '');

INSERT INTO dim_supplier (
    supplier_nk,
    supplier_name,
    supplier_contact_id,
    email,
    phone,
    address,
    city,
    country_id
)
SELECT DISTINCT
    md5(
        concat_ws(
            '||',
            COALESCE(TRIM(supplier_name), ''),
            COALESCE(TRIM(supplier_contact), ''),
            COALESCE(TRIM(supplier_email), ''),
            COALESCE(TRIM(supplier_phone), ''),
            COALESCE(TRIM(supplier_address), ''),
            COALESCE(TRIM(supplier_city), ''),
            COALESCE(TRIM(supplier_country), '')
        )
    ) AS supplier_nk,
    supplier_name,
    dsc.supplier_contact_id,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    dc.country_id
FROM mock_data_raw m
LEFT JOIN dim_supplier_contact dsc
    ON dsc.supplier_contact_name = NULLIF(TRIM(m.supplier_contact), '')
LEFT JOIN dim_country dc
    ON dc.country_name = NULLIF(TRIM(m.supplier_country), '');

INSERT INTO dim_product (
    product_nk,
    source_product_id,
    product_name,
    product_category_id,
    pet_category_id,
    brand_id,
    material_id,
    color_id,
    size_id,
    product_weight,
    product_price,
    product_quantity,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date
)
SELECT DISTINCT
    md5(
        concat_ws(
            '||',
            COALESCE(TRIM(product_name), ''),
            COALESCE(TRIM(product_category), ''),
            COALESCE(TRIM(pet_category), ''),
            COALESCE(TRIM(product_brand), ''),
            COALESCE(TRIM(product_material), ''),
            COALESCE(TRIM(product_color), ''),
            COALESCE(TRIM(product_size), ''),
            COALESCE(product_weight::TEXT, ''),
            COALESCE(product_price::TEXT, ''),
            COALESCE(product_quantity::TEXT, ''),
            COALESCE(product_description, ''),
            COALESCE(product_rating::TEXT, ''),
            COALESCE(product_reviews::TEXT, ''),
            COALESCE(product_release_date::TEXT, ''),
            COALESCE(product_expiry_date::TEXT, '')
        )
    ) AS product_nk,
    sale_product_id,
    product_name,
    dpc.product_category_id,
    dpet.pet_category_id,
    db.brand_id,
    dm.material_id,
    dc.color_id,
    ds.size_id,
    product_weight,
    product_price,
    product_quantity,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date
FROM mock_data_raw m
LEFT JOIN dim_product_category dpc
    ON dpc.product_category_name = NULLIF(TRIM(m.product_category), '')
LEFT JOIN dim_pet_category dpet
    ON dpet.pet_category_name = NULLIF(TRIM(m.pet_category), '')
LEFT JOIN dim_brand db
    ON db.brand_name = NULLIF(TRIM(m.product_brand), '')
LEFT JOIN dim_material dm
    ON dm.material_name = NULLIF(TRIM(m.product_material), '')
LEFT JOIN dim_color dc
    ON dc.color_name = NULLIF(TRIM(m.product_color), '')
LEFT JOIN dim_size ds
    ON ds.size_name = NULLIF(TRIM(m.product_size), '');
