DROP TABLE items;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  ID SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE items (
  ID SERIAL8  PRIMARY KEY,
  manufacturer_id INT8 REFERENCES manufacturers(id) ON DELETE CASCADE,
  component VARCHAR(255),
  cost INT8,
  price INT8,
  margin INT8,
  quantity INT8,
  low_stock INT8,
  critical_stock INT8
);
