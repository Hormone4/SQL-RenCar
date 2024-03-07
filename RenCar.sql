DROP DATABASE RenCar;
CREATE DATABASE RenCar;
USE RenCar;

CREATE TABLE agency(
   agency_name VARCHAR(50) PRIMARY KEY,
   num_rue INT,
   nom_rue VARCHAR(50),
   nom_ville VARCHAR(50)
);

CREATE TABLE car(
   car_id INT PRIMARY KEY,
   brand VARCHAR(50),
   model VARCHAR(50),
   car_year INT,
   car_status VARCHAR(50)   # Available, Rented, Under Maintenance...
);

CREATE TABLE customer(
   customer_id INT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(50),
   phone VARCHAR(20)
);

CREATE TABLE rental(
   rental_id INT PRIMARY KEY,
   agency_name VARCHAR(50),
   car_id INT,
   customer_id INT,
   rental_date DATE,
   return_date DATE,
   rental_status VARCHAR(50),   # Active, Completed or Canceled
   FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
   FOREIGN KEY(car_id) REFERENCES car(car_id),
   FOREIGN KEY(agency_name) REFERENCES agency(agency_name)
);

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



INSERT INTO agency (agency_name, num_rue, nom_rue, nom_ville) VALUES
  ('Paris Voitures', '12', 'Rue de la Liberté', 'Paris'),
  ('Côte d\'Azur Location', '25', 'Avenue des Palmiers', 'Nice'),
  ('Bordeaux Auto', '8', 'Rue Saint-Émilion', 'Bordeaux'),
  ('Montpellier Location', '17', 'Place de la Comédie', 'Montpellier'),
  ('Strasbourg Cars', '5', 'Quai des Bateliers', 'Strasbourg'),
  ('Marseille Auto Services', '22', 'Boulevard de la Canebière', 'Marseille')
;
INSERT INTO car (car_id, brand, model, car_year, car_status) VALUES
  (1, 'Toyota', 'Camry', 2020, 'Available'),
  (2, 'Honda', 'Civic', 2019, 'Available'),
  (3, 'Ford', 'Focus', 2018, 'Rented'),
  (4, 'Chevrolet', 'Malibu', 2021, 'Rented'),
  (5, 'Nissan', 'Altima', 2022, 'Available'),
  (6, 'Volkswagen', 'Jetta', 2020, 'Available'),
  (7, 'Mercedes', 'Class B', 2021, 'Rented'),
  (8, 'Nissan', 'Juke', 2022, 'Available'),
  (9, 'Mercedes', 'Class A', 2020, 'Available')
;
INSERT INTO customer (customer_id, first_name, last_name, email, phone) VALUES
  (1, 'Alice', 'Johnson', 'alice@email.com', '555-1234'),
  (2, 'Bob', 'Smith', 'bob@email.com', '555-5678'),
  (3, 'Charlie', 'Davis', 'charlie@email.com', '555-9876'),
  (4, 'Diana', 'Miller', 'diana@email.com', '555-4321'),
  (5, 'Ethan', 'Taylor', 'ethan@email.com', '555-8765'),
  (6, 'Fiona', 'Anderson', 'fiona@email.com', '555-2345')
;
INSERT INTO rental (rental_id, agency_name, car_id, customer_id, rental_date, return_date, rental_status) VALUES
  (1, 'Paris Voitures', 1, 1, '2024-03-05', '2024-03-10', 'Completed'),
  (2, 'Paris Voitures', 2, 2, '2024-03-08', '2024-03-12', 'Active'),
  (3, 'Côte d\'Azur Location', 3, 3, '2024-03-10', '2024-03-15', 'Completed'),
  (4, 'Montpellier Location', 4, 4, '2024-03-12', '2024-03-18', 'Active'),
  (5, 'Montpellier Location', 5, 5, '2024-03-15', '2024-03-20', 'Active'),
  (6, 'Strasbourg Cars', 6, 6, '2024-03-18', '2024-03-25', 'Active')
;


SELECT * FROM agency;
SELECT * FROM car;
SELECT * FROM customer;
SELECT * FROM rental;



#  Have the information about the available cars 
SELECT * FROM car WHERE car_status LIKE 'Available';

#  Have the information about the unavailable cars 
SELECT * FROM car WHERE car_status LIKE 'Rented';

# information about the person who rents the car and from which agency he rented it.
SELECT first_name, last_name, email, phone, agency.agency_name, num_rue, nom_rue, nom_ville FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN car ON rental.car_id = car.car_id
INNER JOIN agency ON rental.agency_name = agency.agency_name
WHERE car_status LIKE 'Rented';

