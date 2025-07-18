-- Represents customers
CREATE TABLE `customer` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    email_address VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(32) NOT NULL
);

-- Represents hairdressers
CREATE TABLE `hairdresser` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    phone_number VARCHAR(32) NOT NULL UNIQUE
);

-- Represents ratings from customers
CREATE TABLE `rating` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating TINYINT NOT NULL CHECK (rating >= 1 AND rating <= 10),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    customer_id INT NOT NULL,
    hairdresser_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (hairdresser_id) REFERENCES hairdresser(id) ON DELETE CASCADE
);

-- Represents salons
CREATE TABLE `salon` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    email_address VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(32) NOT NULL UNIQUE,
    city VARCHAR(32) NOT NULL
);

-- Represents junction table between hairdressers and salons
CREATE TABLE `hairdresser_salon` (
    hairdresser_id INT NOT NULL,
    salon_id INT NOT NULL,
    PRIMARY KEY (hairdresser_id, salon_id),
    FOREIGN KEY (hairdresser_id) REFERENCES hairdresser(id) ON DELETE CASCADE,
    FOREIGN KEY (salon_id) REFERENCES salon(id) ON DELETE CASCADE
);

-- Represents services that salons provide
CREATE TABLE `service` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name ENUM('Haircut', 'Blow Dry', 'Coloring', 'Styling', 'Shaving', 'Other') NOT NULL
);

-- Represents junction table between salons and services and its prices
CREATE TABLE `salon_service_price` (
    salon_id INT NOT NULL,
    service_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (salon_id, service_id),
    FOREIGN KEY (salon_id) REFERENCES salon(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(id) ON DELETE CASCADE
);



-- Create view for junction table connecting hairdresser and salon
CREATE VIEW hairdresser_salon_view AS
    SELECT
    hairdresser_salon.hairdresser_id,
    hairdresser_salon.salon_id,
    hairdresser.first_name AS hairdresser_first_name,
    hairdresser.last_name AS hairdresser_last_name,
    hairdresser.phone_number AS hairdresser_phone_number,
    salon.name AS salon_name,
    salon.email_address AS salon_email_address,
    salon.phone_number AS salon_phone_number,
    salon.city AS salon_city
    FROM hairdresser_salon
    JOIN hairdresser ON hairdresser_salon.hairdresser_id = hairdresser.id
    JOIN salon ON hairdresser_salon.salon_id = salon.id;

-- Create view for junction table connecting service and salon
CREATE VIEW salon_service_view AS
    SELECT
    salon_service_price.salon_id,
    salon_service_price.service_id,
    salon.name AS salon_name,
    salon.email_address AS salon_email_address,
    salon.phone_number AS salon_phone_number,
    salon.city AS salon_city,
    service.name AS service_name,
    salon_service_price.price
    FROM salon_service_price
    JOIN service ON salon_service_price.service_id = service.id
    JOIN salon ON salon_service_price.salon_id = salon.id;

-- Create a view to simplify access to hairdressers and their average rating.
CREATE VIEW hairdresser_rating_view AS
    SELECT hairdresser.id, hairdresser.first_name, hairdresser.last_name, ROUND(AVG(rating.rating), 2) AS avg_rating
    FROM hairdresser
    JOIN rating ON hairdresser.id = rating.hairdresser_id
    GROUP BY hairdresser.id;


-- Create a view showing the top 3 highest-rated hairdressers.
-- in mysql we use stored procedure

DELIMITER //
CREATE PROCEDURE get_highest_rated_hairdressers()
BEGIN
    SELECT first_name, last_name, avg_rating
    FROM hairdresser_rating_view
    ORDER BY avg_rating DESC
    LIMIT 3;
END//
DELIMITER ;


-- Create indexes to speed common searches
CREATE INDEX salon_name_search ON salon(name);
CREATE INDEX salon_city_search ON salon(city);

CREATE INDEX hairdresser_first_name_search ON hairdresser(first_name);
CREATE INDEX hairdresser_last_name_search ON hairdresser(last_name);

CREATE INDEX rating_customer_id ON rating(customer_id);
CREATE INDEX rating_hairdresser_id ON rating(hairdresser_id);

CREATE INDEX service_name_search ON service(name);



