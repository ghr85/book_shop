-- table drops start with most dependencies to least dependencies
DROP TABLE products_to_orders;
DROP TABLE orders;
DROP TABLE users;
DROP TABLE products_to_regions;
DROP TABLE products;
DROP TABLE brands;
DROP TABLE manufacturers_to_distributors;
DROP TABLE manufacturers;
DROP TABLE distributors;
DROP TABLE regions;
DROP TABLE categories;

-- table creation starts with least to most dependencies
CREATE TABLE regions(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

CREATE TABLE distributors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  postcode VARCHAR(10),
  gen_tel VARCHAR(20),
  email VARCHAR(255)
);

CREATE TABLE manufacturers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  postcode VARCHAR(10),
  gen_tel VARCHAR(20),
  gen_email VARCHAR(255),
  order_tel VARCHAR(20),
  order_email VARCHAR(255),
  order_url VARCHAR(255)
);

CREATE TABLE manufacturers_to_distributors(
  id SERIAL4 PRIMARY KEY,
  manufacturer_id INT4 REFERENCES manufacturers(id) ON DELETE CASCADE,
  distributor_id INT4 REFERENCES distributors(id) ON DELETE CASCADE
);

CREATE TABLE brands(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  distributor_id INT4 REFERENCES distributors(id) ON DELETE CASCADE
);

CREATE TABLE products(
  id SERIAL PRIMARY KEY,
  product_name varchar(255) NOT NULL,
  product_size varchar(255) NOT NULL,
  pip_code varchar(8) NOT NULL,
  units NUMERIC(3,1) NOT NULL,
  fresh BOOLEAN,
  brand_id INT4 REFERENCES brands(id) ON DELETE CASCADE,
  category_id INT4 REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE products_to_regions(
  id SERIAL PRIMARY KEY,
  product_id INT4 REFERENCES products(id) ON DELETE CASCADE,
  region_id INT4 REFERENCES regions(id) ON DELETE CASCADE
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_names VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  dob DATE NOT NULL,
  gender VARCHAR(20) NOT NULL,
  age INT4 NOT NULL,
  tel VARCHAR(20),
  address VARCHAR(255),
  postcode VARCHAR(10),
  allowance INT4,
  region INT4 REFERENCES regions(id) ON DELETE CASCADE,
  breastfeeding BOOLEAN,
  trimester3 BOOLEAN,
  chi_number INT8,
  role VARCHAR(255)
);

CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  created_date DATE NOT NULL,
  submitted_date DATE,
  submitted BOOLEAN,
  user_id INT4 REFERENCES users(id) ON DELETE CASCADE,
  received BOOLEAN,
  part_received BOOLEAN,
  date_created DATE NOT NULL,
  date_modified DATE
);

CREATE TABLE products_to_orders(
  id SERIAL PRIMARY KEY,
  product_id INT4 REFERENCES products(id) ON DELETE CASCADE,
  order_id INT4 REFERENCES orders(id) ON DELETE CASCADE
);


--configue a UK datestyle
ALTER DATABASE villous SET datestyle TO "ISO, DMY";
