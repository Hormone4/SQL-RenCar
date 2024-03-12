INSERT INTO agency (agency_name, num_street, name_street, name_town) VALUES
  ('Paris Voitures', '12', 'street de la Liberté', 'Paris'),
  ('Côte d\'Azur Location', '25', 'Avenue des Palmiers', 'Nice'),
  ('Bordeaux Auto', '8', 'street Saint-Émilion', 'Bordeaux'),
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