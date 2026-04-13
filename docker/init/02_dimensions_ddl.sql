SET client_encoding = 'UTF8';

DROP TABLE IF EXISTS dim_country CASCADE;
CREATE TABLE dim_country (
    country_id BIGSERIAL PRIMARY KEY
    , country_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_product_category CASCADE;
CREATE TABLE dim_product_category (
    product_category_id BIGSERIAL PRIMARY KEY
    , product_category_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_color CASCADE;
CREATE TABLE dim_color (
    color_id BIGSERIAL PRIMARY KEY
    , color_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_size CASCADE;
CREATE TABLE dim_size (
    size_id BIGSERIAL PRIMARY KEY
    , size_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_brand CASCADE;
CREATE TABLE dim_brand (
    brand_id BIGSERIAL PRIMARY KEY
    , brand_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_material CASCADE;
CREATE TABLE dim_material (
    material_id BIGSERIAL PRIMARY KEY
    , material_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_pet_category CASCADE;
CREATE TABLE dim_pet_category (
    pet_category_id BIGSERIAL PRIMARY KEY
    , pet_category_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_pet_type CASCADE;
CREATE TABLE dim_pet_type (
    pet_type_id BIGSERIAL PRIMARY KEY
    , pet_type_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_pet_breed CASCADE;
CREATE TABLE dim_pet_breed (
    pet_breed_id BIGSERIAL PRIMARY KEY
    , pet_breed_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_supplier_contact CASCADE;
CREATE TABLE dim_supplier_contact (
    supplier_contact_id BIGSERIAL PRIMARY KEY
    , supplier_contact_name TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS dim_date CASCADE;
CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY
    , full_date DATE NOT NULL UNIQUE
    , calendar_year INTEGER NOT NULL
    , calendar_quarter INTEGER NOT NULL
    , calendar_month INTEGER NOT NULL
    , calendar_day INTEGER NOT NULL
    , month_name TEXT NOT NULL
);

DROP TABLE IF EXISTS dim_customer CASCADE;
CREATE TABLE dim_customer (
    customer_id BIGSERIAL PRIMARY KEY
    , customer_nk TEXT NOT NULL UNIQUE
    , source_customer_id INTEGER
    , first_name TEXT
    , last_name TEXT
    , age INTEGER
    , email TEXT
    , country_id BIGINT REFERENCES dim_country(country_id)
    , postal_code TEXT
    , pet_type_id BIGINT REFERENCES dim_pet_type(pet_type_id)
    , pet_name TEXT
    , pet_breed_id BIGINT REFERENCES dim_pet_breed(pet_breed_id)
);

DROP TABLE IF EXISTS dim_seller CASCADE;
CREATE TABLE dim_seller (
    seller_id BIGSERIAL PRIMARY KEY
    , seller_nk TEXT NOT NULL UNIQUE
    , source_seller_id INTEGER
    , first_name TEXT
    , last_name TEXT
    , email TEXT
    , country_id BIGINT REFERENCES dim_country(country_id)
    , postal_code TEXT
);

DROP TABLE IF EXISTS dim_store CASCADE;
CREATE TABLE dim_store (
    store_id BIGSERIAL PRIMARY KEY
    , store_nk TEXT NOT NULL UNIQUE
    , store_name TEXT
    , store_location TEXT
    , city TEXT
    , state TEXT
    , country_id BIGINT REFERENCES dim_country(country_id)
    , phone TEXT
    , email TEXT
);

DROP TABLE IF EXISTS dim_supplier CASCADE;
CREATE TABLE dim_supplier (
    supplier_id BIGSERIAL PRIMARY KEY
    , supplier_nk TEXT NOT NULL UNIQUE
    , supplier_name TEXT
    , supplier_contact_id BIGINT REFERENCES dim_supplier_contact(supplier_contact_id)
    , email TEXT
    , phone TEXT
    , address TEXT
    , city TEXT
    , country_id BIGINT REFERENCES dim_country(country_id)
);

DROP TABLE IF EXISTS dim_product CASCADE;
CREATE TABLE dim_product (
    product_id BIGSERIAL PRIMARY KEY
    , product_nk TEXT NOT NULL UNIQUE
    , source_product_id INTEGER
    , product_name TEXT
    , product_category_id BIGINT REFERENCES dim_product_category(product_category_id)
    , pet_category_id BIGINT REFERENCES dim_pet_category(pet_category_id)
    , brand_id BIGINT REFERENCES dim_brand(brand_id)
    , material_id BIGINT REFERENCES dim_material(material_id)
    , color_id BIGINT REFERENCES dim_color(color_id)
    , size_id BIGINT REFERENCES dim_size(size_id)
    , product_weight NUMERIC(12, 2)
    , product_price NUMERIC(12, 2)
    , product_quantity INTEGER
    , product_description TEXT
    , product_rating NUMERIC(4, 2)
    , product_reviews INTEGER
    , product_release_date DATE
    , product_expiry_date DATE
);

DROP TABLE IF EXISTS fact_sales CASCADE;
CREATE TABLE fact_sales (
    fact_sales_id BIGSERIAL PRIMARY KEY
    , raw_id BIGINT NOT NULL UNIQUE REFERENCES mock_data_raw(raw_id)
    , date_id INTEGER NOT NULL REFERENCES dim_date(date_id)
    , customer_id BIGINT NOT NULL REFERENCES dim_customer(customer_id)
    , seller_id BIGINT NOT NULL REFERENCES dim_seller(seller_id)
    , store_id BIGINT NOT NULL REFERENCES dim_store(store_id)
    , supplier_id BIGINT NOT NULL REFERENCES dim_supplier(supplier_id)
    , product_id BIGINT NOT NULL REFERENCES dim_product(product_id)
    , sale_quantity INTEGER NOT NULL
    , sale_total_price NUMERIC(12, 2) NOT NULL
);
