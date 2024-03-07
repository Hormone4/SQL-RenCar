The corresponding relational schema is the following:

agency = (agency_name, num_rue, nom_rue, nom_ville);
car = (car_id, brand, model, car_year, car_status);
customer = (customer_id, first_name, last_name, email, phone);
rental = (rental_id, #customer_id, #car_id, #agency_name, rental_date, return_date, rental_status);
