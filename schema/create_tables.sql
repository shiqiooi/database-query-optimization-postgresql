--  Dimension tables
CREATE TABLE categories (
  categoryid   INT PRIMARY KEY,
  categoryname VARCHAR(45)
);

CREATE TABLE countries (
  countryid    INT PRIMARY KEY,
  countryname  VARCHAR(45),
  countrycode  VARCHAR(2)
);

CREATE TABLE cities (
  cityid     INT PRIMARY KEY,
  cityname   VARCHAR(45),
  zipcode    NUMERIC(5,0),
  countryid  INT REFERENCES countries(countryid)
);

CREATE TABLE customers (
  customerid     INT PRIMARY KEY,
  firstname      VARCHAR(45),
  middleinitial  VARCHAR(10),   -- allow longer than 1 to avoid rejects
  lastname       VARCHAR(45),
  cityid         INT REFERENCES cities(cityid),
  address        VARCHAR(200)   -- safer length
);

CREATE TABLE employees (
  employeeid     INT PRIMARY KEY,
  firstname      VARCHAR(45),
  middleinitial  VARCHAR(10),
  lastname       VARCHAR(45),
  birthdate      DATE,
  gender         VARCHAR(10),
  cityid         INT REFERENCES cities(cityid),
  hiredate       DATE
);

CREATE TABLE products (
  productid     INT PRIMARY KEY,
  productname   VARCHAR(200),
  price         NUMERIC(10,4),
  categoryid    INT REFERENCES categories(categoryid),
  class         VARCHAR(15),
  modifydate    TIMESTAMP,
  resistant     VARCHAR(15),
  isallergic    VARCHAR(10),
  vitalitydays  NUMERIC(10,2)
);

--  Fact table
CREATE TABLE sales (
  salesid            INT PRIMARY KEY,
  salespersonid      INT REFERENCES employees(employeeid),
  customerid         INT REFERENCES customers(customerid),
  productid          INT REFERENCES products(productid),
  quantity           INT,
  discount           NUMERIC(10,2),
  totalprice         NUMERIC(10,2),
  salesdate          TIMESTAMP,
  transactionnumber  VARCHAR(25)
);
