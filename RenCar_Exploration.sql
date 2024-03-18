# FOR THE AGENCY
# Have the number of available cars
SELECT COUNT(*) AS Number_of_cars FROM car WHERE car_status LIKE 'Available';

#  Have the information about the available cars 
SELECT * FROM car WHERE car_status LIKE 'Available';

#  Have the information about the unavailable cars 
SELECT * FROM car WHERE car_status LIKE 'Rented';

# Have the information about the customers who currently rent a car and from which agency they rented it.
SELECT first_name, last_name, email, phone, agency.agency_name FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN car ON rental.car_id = car.car_id
INNER JOIN agency ON rental.agency_name = agency.agency_name
WHERE car_status LIKE 'Rented';


# FOR THE CUSTOMER
# Have the information about the available cars from a certain brand
SELECT * FROM car WHERE car_status LIKE 'Available' AND brand LIKE "Mercedes";

# Have the information about when to return the rented car
SELECT first_name, last_name, return_date
FROM rental INNER JOIN customer
ON rental.customer_id = customer.customer_id
WHERE customer.customer_id = 5;