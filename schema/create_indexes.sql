-- FK indexes for faster joins
CREATE INDEX IF NOT EXISTS idx_sales_customerid
  ON sales(customerid);

CREATE INDEX IF NOT EXISTS idx_sales_productid
  ON sales(productid);

CREATE INDEX IF NOT EXISTS idx_sales_salespersonid
  ON sales(salespersonid);

-- Time-based predicate optimisation
CREATE INDEX IF NOT EXISTS idx_sales_salesdate
  ON sales(salesdate);
