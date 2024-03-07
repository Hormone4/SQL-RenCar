# RenCar

Relational schema of the database:

agency = (**agency_name**, num_rue, nom_rue, nom_ville);<br />
car = (**car_id**, brand, model, car_year, car_status);<br />
customer = (**customer_id**, first_name, last_name, email, phone);<br />
rental = (**rental_id**, _#customer_id, #car_id, #agency_name_, rental_date, return_date, rental_status);
