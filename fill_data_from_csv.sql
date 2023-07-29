-- Example, but it does not work because data was not preprocessed so I tried to preprocess it using Python :) --
COPY SUPPLIERS(suppliername, suppliercontact) 
FROM '/path/to/suppliers.csv' 
DELIMITER ',' 
CSV HEADER;
