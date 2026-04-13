SET client_encoding = 'UTF8';
SET datestyle = 'ISO, MDY';

INSERT INTO fact_sales (
    raw_id
    , date_id
    , customer_id
    , seller_id
    , store_id
    , supplier_id
    , product_id
    , sale_quantity
    , sale_total_price
)
SELECT
    m.raw_id
    , TO_CHAR(m.sale_date, 'YYYYMMDD')::INTEGER AS date_id
    , c.customer_id
    , s.seller_id
    , st.store_id
    , sup.supplier_id
    , p.product_id
    , m.sale_quantity
    , m.sale_total_price
FROM mock_data_raw m
INNER JOIN dim_customer c
    ON c.customer_nk = md5(
        concat_ws(
            '||'
            , COALESCE(TRIM(m.customer_first_name), '')
            , COALESCE(TRIM(m.customer_last_name), '')
            , COALESCE(TRIM(m.customer_email), '')
            , COALESCE(TRIM(m.customer_country), '')
            , COALESCE(TRIM(m.customer_postal_code), '')
            , COALESCE(TRIM(m.customer_pet_type), '')
            , COALESCE(TRIM(m.customer_pet_name), '')
            , COALESCE(TRIM(m.customer_pet_breed), '')
            , COALESCE(m.customer_age::TEXT, '')
        )
    )
INNER JOIN dim_seller s
    ON s.seller_nk = md5(
        concat_ws(
            '||'
            , COALESCE(TRIM(m.seller_first_name), '')
            , COALESCE(TRIM(m.seller_last_name), '')
            , COALESCE(TRIM(m.seller_email), '')
            , COALESCE(TRIM(m.seller_country), '')
            , COALESCE(TRIM(m.seller_postal_code), '')
        )
    )
INNER JOIN dim_store st
    ON st.store_nk = md5(
        concat_ws(
            '||'
            , COALESCE(TRIM(m.store_name), '')
            , COALESCE(TRIM(m.store_location), '')
            , COALESCE(TRIM(m.store_city), '')
            , COALESCE(TRIM(m.store_state), '')
            , COALESCE(TRIM(m.store_country), '')
            , COALESCE(TRIM(m.store_phone), '')
            , COALESCE(TRIM(m.store_email), '')
        )
    )
INNER JOIN dim_supplier sup
    ON sup.supplier_nk = md5(
        concat_ws(
            '||'
            , COALESCE(TRIM(m.supplier_name), '')
            , COALESCE(TRIM(m.supplier_contact), '')
            , COALESCE(TRIM(m.supplier_email), '')
            , COALESCE(TRIM(m.supplier_phone), '')
            , COALESCE(TRIM(m.supplier_address), '')
            , COALESCE(TRIM(m.supplier_city), '')
            , COALESCE(TRIM(m.supplier_country), '')
        )
    )
INNER JOIN dim_product p
    ON p.product_nk = md5(
        concat_ws(
            '||'
            , COALESCE(TRIM(m.product_name), '')
            , COALESCE(TRIM(m.product_category), '')
            , COALESCE(TRIM(m.pet_category), '')
            , COALESCE(TRIM(m.product_brand), '')
            , COALESCE(TRIM(m.product_material), '')
            , COALESCE(TRIM(m.product_color), '')
            , COALESCE(TRIM(m.product_size), '')
            , COALESCE(m.product_weight::TEXT, '')
            , COALESCE(m.product_price::TEXT, '')
            , COALESCE(m.product_quantity::TEXT, '')
            , COALESCE(m.product_description, '')
            , COALESCE(m.product_rating::TEXT, '')
            , COALESCE(m.product_reviews::TEXT, '')
            , COALESCE(m.product_release_date::TEXT, '')
            , COALESCE(m.product_expiry_date::TEXT, '')
        )
    )
WHERE m.sale_date IS NOT NULL;
