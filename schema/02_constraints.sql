-- PRIMARY KEYS
ALTER TABLE categories ADD CONSTRAINT pk_categories PRIMARY KEY (categoryid);
ALTER TABLE countries  ADD CONSTRAINT pk_countries  PRIMARY KEY (countryid);
ALTER TABLE cities     ADD CONSTRAINT pk_cities     PRIMARY KEY (cityid);
ALTER TABLE customers  ADD CONSTRAINT pk_customers  PRIMARY KEY (customerid);
ALTER TABLE employees  ADD CONSTRAINT pk_employees  PRIMARY KEY (employeeid);
ALTER TABLE products   ADD CONSTRAINT pk_products   PRIMARY KEY (productid);
ALTER TABLE sales      ADD CONSTRAINT pk_sales      PRIMARY KEY (salesid);

-- FOREIGN KEYS
ALTER TABLE cities
  ADD CONSTRAINT fk_cities_country FOREIGN KEY (countryid) REFERENCES countries(countryid);

ALTER TABLE customers
  ADD CONSTRAINT fk_customers_city FOREIGN KEY (cityid) REFERENCES cities(cityid);

ALTER TABLE employees
  ADD CONSTRAINT fk_employees_city FOREIGN KEY (cityid) REFERENCES cities(cityid);

ALTER TABLE products
  ADD CONSTRAINT fk_products_category FOREIGN KEY (categoryid) REFERENCES categories(categoryid);

ALTER TABLE sales
  ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customerid) REFERENCES customers(customerid);

ALTER TABLE sales
  ADD CONSTRAINT fk_sales_employee FOREIGN KEY (salespersonid) REFERENCES employees(employeeid);

ALTER TABLE sales
  ADD CONSTRAINT fk_sales_product FOREIGN KEY (productid) REFERENCES products(productid);
