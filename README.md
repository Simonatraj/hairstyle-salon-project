# Hairstyle Salon Platform – Database Design

This repository contains the complete project and schema design for a hairstyle salon platform, developed by me as part of the CS50 SQL track.


## Overview

This project presents a comprehensive database design for managing operations within a hairdressing salon platform. The database tracks customers, hairdressers, salons, services, and customer ratings. It supports many-to-many relationships, service-specific pricing, analytical views, and a stored procedure for top-rated hairdressers.


## Files

- `schema.sql` – Full SQL schema to create all tables, views, and procedures
- `DESIGN.md` – Comprehensive design document explaining the schema, entities, and relationships
- `queries.sql` – Example queries and stored procedure usage
- `ERD.png` – Entity-Relationship Diagram
- `README.md` – Project documentation 


## Main Features

- Detailed management of customers, hairdressers, salons, and services
- Customer ratings for hairdressers
- Many-to-many relationships for salons, hairdressers, and services
- Custom service pricing for salons
- Views for streamlined data analysis:
  - Hairdresser-salon assignments
  - Salon services with prices
  - Average ratings for hairdressers
- Stored procedure to retrieve top 3 highest-rated hairdressers
- Indexed columns for improved query performance


## ERD / Database Structure

Key tables and relationships:

- **Customers:** Can rate hairdressers
- **Hairdressers:** May work at multiple salons, receive ratings
- **Salons:** Employ many hairdressers and offer multiple services
- **Services:** Offered by multiple salons at different prices
- **Ratings:** Submitted by customers for hairdressers
- **Junction Tables:**
  - `hairdresser_salon`: Links hairdressers and salons
  - `salon_service_price`: Links services to salons with pricing

For full schema and design details, see `DESIGN.md`.


## How to Use

1. Run `schema.sql` in your MySQL or compatible SQL server to create the database.
2. Use the queries and procedures in `queries.sql` to explore and test the database functionality.
3. Refer to the views for common reporting tasks or analytics.


## Optimizations

- Indexes on frequently queried columns (e.g., salon name, city, hairdresser name)
- Efficient joins via composite primary keys in junction tables
- Predefined views simplify common queries


