INSERT INTO hairdresser (first_name, last_name, phone_number)
VALUES
-- Skopje
('Maria', 'Stojanovska', '071123456'),
('Ana', 'Petrovska', '070987654'),
('Elena', 'Markovska', '078456789'),

-- Ohrid
('Nikola', 'Andreev', '071654321'),
('Kristina', 'Jovanovska', '076111222'),
('Marta', 'Petreska', '070333444'),

-- Belgrade
('Marko', 'Petrovic', '061111111'),
('Jelena', 'Jovanovic', '062222222'),
('Milan', 'Nikolic', '063333333'),

-- Ljubljana
('Jan', 'Kranjc', '030111111'),
('Tina', 'Novak', '031222222'),
('Miha', 'Rozman', '032333333'),

-- Zagreb
('Lana', 'Horvat', '091111111'),
('Ivan', 'Maric', '092222222'),
('Maja', 'Peric', '093333333');


INSERT INTO customer (first_name, last_name, email_address, city)
VALUES
-- Skopje
('Viktor', 'Georgiev', 'v.georgiev@gmail.com', 'Skopje'),
('Kristina', 'Popovska', 'k.popovska@hotmail.com', 'Skopje'),
('Filip', 'Ristovski', 'filip.risto@gmail.com', 'Skopje'),

-- Ohrid
('Elena', 'Tasevska', 'elena.tasevska@yahoo.com', 'Ohrid'),
('Blagoj', 'Zdravkov', 'blagojz@hotmail.com', 'Ohrid'),
('Sandra', 'Ivanovska', 's.ivano@gmail.com', 'Ohrid'),

-- Belgrade
('Aleksandra', 'Milosevic', 'a.milosevic@gmail.com', 'Belgrade'),
('Petar', 'Savic', 'psavic@yahoo.com', 'Belgrade'),
('Danica', 'Vukovic', 'danica.vukovic@gmail.com', 'Belgrade'),

-- Ljubljana
('Nejc', 'Oblak', 'nejc.oblak@gmail.com', 'Ljubljana'),
('Katarina', 'Hribar', 'katarina.hribar@outlook.com', 'Ljubljana'),
('Ziga', 'Srot', 'z.srot@yahoo.com', 'Ljubljana'),

-- Zagreb
('Tomislav', 'Grgic', 'tomislav.grgic@gmail.com', 'Zagreb'),
('Ema', 'Kos', 'ema.kos@outlook.com', 'Zagreb'),
('Dino', 'Juric', 'dino.juric@gmail.com', 'Zagreb');


INSERT INTO salon (name, email_address, phone_number, city)
VALUES
-- Skopje
('Glamour Cuts', 'glamour.sk@example.com', '070111222', 'Skopje'),
('Style Studio', 'style.sk@example.com', '070333444', 'Skopje'),

-- Ohrid
('Lakeview Salon', 'lakeview.ohrid@example.com', '071555666', 'Ohrid'),
('Hair & Glow', 'glow.ohrid@example.com', '071999888', 'Ohrid'),

-- Belgrade
('Urban Scissors', 'urban.bg@example.com', '061222333', 'Belgrade'),
('Royal Hair', 'royal.bg@example.com', '061444555', 'Belgrade'),

-- Ljubljana
('Chic Look', 'chic.lj@example.com', '030111222', 'Ljubljana'),
('Elegance Salon', 'elegance.lj@example.com', '031777888', 'Ljubljana'),

-- Zagreb
('Zagreb Hair Art', 'hairart.zg@example.com', '091333222', 'Zagreb'),
('Blow & Go', 'blowgo.zg@example.com', '091888777', 'Zagreb');


INSERT INTO rating (rating, customer_id, hairdresser_id)
VALUES
('9', 1, 5),
('7', 2, 8),
('10', 3, 12),
('8', 4, 6),
('9', 5, 7),
('6', 6, 9),
('7', 7, 10),
('10', 8, 15),
('9', 9, 11),
('8', 10, 14),
('7', 11, 13),
('10', 12, 1),
('6', 13, 2),
('9', 14, 3),
('8', 15, 4);


-- Skopje Hairdressers
INSERT INTO hairdresser_salon (hairdresser_id, salon_id)
VALUES
(1, 1),
(2, 1),

-- Ohrid
(3, 2),
(4, 2),

-- Belgrade
(5, 3),
(6, 3),

-- Ljubljana
(7, 4),
(8, 4),

-- Zagreb
(9, 5),
(10, 5);


INSERT INTO service (name)
VALUES
('Haircut'),
('Blow Dry'),
('Coloring'),
('Styling'),
('Shaving'),
('Other');



INSERT INTO salon_service_price (salon_id, service_id, price)
VALUES
-- Salon 1: Glamour Cuts
(1, 1, 50),
(1, 2, 100),
(1, 3, 20),

-- Salon 2: Style Studio
(2, 1, 10),
(2, 4, 50),
(2, 5, 100),

-- Salon 3: Lakeview Salon
(3, 1, 70),
(3, 3, 120),
(3, 6, 80),

-- Salon 4: Hair & Glow
(4, 1, 15),
(4, 2, 18),
(4, 3, 100),
(4, 4, 50),

-- Salon 5: Urban Scissors
(5, 1, 15),
(5, 5, 100),

-- Salon 6: Royal Hair
(6, 1, 20),
(6, 2, 50),
(6, 3, 70),

-- Salon 7: Chic Look
(7, 1, 70),
(7, 2, 60),
(7, 6, 30),

-- Salon 8: Elegance Salon
(8, 2, 60),
(8, 3, 10),
(8, 4, 90),

-- Salon 9: Zagreb Hair Art
(9, 1, 75),
(9, 3, 125),
(9, 4, 10),

-- Salon 10: Blow & Go
(10, 1, 72),
(10, 2, 50),
(10, 6, 40);


--List all customers who live in 'Skopje'.
SELECT first_name, last_name FROM customer
WHERE city LIKE '%Skopje%';


--Get all services offered in the database.
SELECT * FROM service;


--Find all salons located in 'Bitola'.
SELECT * FROM salon
WHERE city LIKE '%Ohrid%';

--Retrieve all hairdressers with the last name 'Petrovski'.
SELECT * FROM hairdresser
WHERE last_name = 'Petrovski';

--List the first 5 customers in alphabetical order by last name.

SELECT first_name, last_name FROM customer
ORDER BY last_name
LIMIT 5;

-- Find all hairdressers working in the salon named 'Beauty Bliss'.
SELECT hairdresser_first_name, hairdresser_last_name FROM hairdresser_salon_view
WHERE salon_name = 'Glamour Cuts';


-- List all services and their prices in a specific salon (e.g., salon_id = 2).
SELECT service_name, price FROM salon_service_view
WHERE salon_id = 2;



-- Show all ratings a specific hairdresser received, along with customer info.
SELECT * FROM rating
JOIN customer ON rating.customer_id = customer.id
JOIN hairdresser ON hairdresser.id = rating.hairdresser_id
WHERE hairdresser_id = 5;


-- Find all salons that offer a service called 'Haircut'.
SELECT salon_name FROM salon_service_view
WHERE service_name = 'Haircut';


-- Show the average rating per hairdresser.
SELECT hairdresser.first_name, hairdresser.last_name, AVG(rating.rating) AS avg_rating FROM rating
JOIN hairdresser ON hairdresser.id = rating.hairdresser_id
GROUP BY hairdresser.id;

-- Find customers who gave more than one rating.
SELECT first_name, last_name
FROM customer
WHERE id IN (
    SELECT customer_id
    FROM rating
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);



-- Find all salons that do not offer the service 'Coloring'.

SELECT salon_name
FROM salon_service_view
GROUP BY salon_id, salon_name
HAVING SUM(service_name = 'Coloring') = 0;



-- For each salon, list how many hairdressers work there and the average price of all services.

SELECT  salon_service_view.salon_name, COUNT(hairdresser_salon_view.hairdresser_id) AS hairdresser_count,
       ROUND(AVG(salon_service_view.price),2) AS avg_prices
       FROM hairdresser_salon_view
       JOIN salon_service_view ON hairdresser_salon_view.salon_id = salon_service_view.salon_id
GROUP BY salon_service_view.salon_id;

--Print out all values from the junction table hairdresser_salon
SELECT * FROM hairdresser_salon_view;

--Print out all values from the junction table salon_service_price
SELECT * FROM salon_service_view;


--Print out hairdressers and their average rating
SELECT * FROM hairdresser_rating_view;

--Update a Customer's Email Address
UPDATE customer
SET email_address = 'georgiev96@gmail.com'
WHERE id = 1;


--Update a Service Price for a Specific Salon
UPDATE salon_service_price
SET price = 50
WHERE salon_id = 2 AND service_id = 3;

--Delete a Rating by Rating ID
DELETE FROM rating
WHERE id = 10;


-- Create a view showing the top 3 highest-rated hairdressers.
CALL get_highest_rated_hairdressers();




