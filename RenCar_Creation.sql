CREATE DATABASE RenCar;
USE RenCar;

CREATE TABLE agency(
   agency_name VARCHAR(50) PRIMARY KEY,
   num_street INT,
   name_street VARCHAR(50),
   name_town VARCHAR(50)
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