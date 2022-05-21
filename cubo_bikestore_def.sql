CREATE DATABASE cubo_bikestore;
USE cubo_bikestore;

CREATE TABLE dim_products (
	product_id INT IDENTITY (1, 1) PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_name VARCHAR (255) NOT NULL,
	category_name VARCHAR (255) NOT NULL,
	model_year SMALLINT NOT NULL
);

CREATE TABLE dim_stores (
	store_id INT IDENTITY (1, 1) PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	city VARCHAR (255),
	state VARCHAR (10)
);

CREATE TABLE dim_times (
	time_id INT IDENTITY (1, 1) PRIMARY KEY,
	complete_date DATE NOT NULL,
	num_quarter INT NOT NULL,
	week_day VARCHAR(10) NOT NULL,
	month_name VARCHAR(10) NOT NULL
);

CREATE TABLE dim_staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL
);

CREATE TABLE fact_sales (
	product_id INT,
	store_id INT,
	time_id INT,
	staff_id INT,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	CONSTRAINT sales_id PRIMARY KEY (product_id, store_id, time_id, staff_id),
	FOREIGN KEY (product_id) REFERENCES dim_products (product_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES dim_stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (time_id) REFERENCES dim_times (time_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES dim_staffs (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
)