# agency table
ALTER TABLE agency   # Ensure that agency_name is mandatory
MODIFY agency_name VARCHAR(50) NOT NULL;

# car table
ALTER TABLE car   # Ensure that brand, model and car_status are mandatory
MODIFY brand VARCHAR(50) NOT NULL,
MODIFY model VARCHAR(50) NOT NULL,
MODIFY car_status VARCHAR(50) NOT NULL;

ALTER TABLE car   # Ensure that car_status is one of the predefined values: Available, Rented or Under Maintenance 
ADD CONSTRAINT CHK_car_status CHECK (car_status IN ('Available', 'Rented', 'Under Maintenance'));

# customer table
ALTER TABLE customer   # Ensure that email follows a valid regular expression
ADD CONSTRAINT CHK_email_format CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,4}$'));

# agency table
ALTER TABLE rental    # Ensure that agency_name, car_id, client_id and rental_status are mandatory
MODIFY agency_name VARCHAR(50) NOT NULL,
MODIFY car_id INT NOT NULL,
MODIFY customer_id INT NOT NULL;

ALTER TABLE rental   # Ensure that rental_status is one of the predefined values: Active, Completed or Canceled
ADD CONSTRAINT CHK_rental_status CHECK (rental_status IN ('Active', 'Completed', 'Canceled'));

ALTER TABLE rental   # Ensure that rental.return_date is posterior to rental.rental_date
ADD CONSTRAINT CHK_return_date_after_rental_date 
CHECK (return_date > rental_date);


SHOW TABLES;
DESCRIBE agency;
DESCRIBE car;
DESCRIBE customer;
DESCRIBE rental;