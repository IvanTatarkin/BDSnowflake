SET client_encoding = 'UTF8';
SET datestyle = 'ISO, MDY';

-- загружаю каждый файл отдельно, чтобы было проще понять откуда какие строки пришли

COPY mock_data_raw (
    source_row_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code,
    customer_pet_type,
    customer_pet_name,
    customer_pet_breed,
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code,
    product_name,
    product_category,
    product_price,
    product_quantity,
    sale_date,
    sale_customer_id,
    sale_seller_id,
    sale_product_id,
    sale_quantity,
    sale_total_price,
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email,
    pet_category,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
)
FROM '/data/raw/MOCK_DATA.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA.csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (1).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (1).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (2).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (2).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (3).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (3).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (4).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (4).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (5).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (5).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (6).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (6).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (7).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (7).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (8).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (8).csv' WHERE source_file_name = '';

COPY mock_data_raw (
    source_row_id, customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code, customer_pet_type, customer_pet_name,
    customer_pet_breed, seller_first_name, seller_last_name, seller_email, seller_country,
    seller_postal_code, product_name, product_category, product_price, product_quantity,
    sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity,
    sale_total_price, store_name, store_location, store_city, store_state, store_country,
    store_phone, store_email, pet_category, product_weight, product_color, product_size,
    product_brand, product_material, product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date, supplier_name, supplier_contact,
    supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
FROM '/data/raw/MOCK_DATA (9).csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
UPDATE mock_data_raw SET source_file_name = 'MOCK_DATA (9).csv' WHERE source_file_name = '';
