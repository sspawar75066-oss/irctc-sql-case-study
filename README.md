# IRCTC Railway Reservation SQL Case Study

An end-to-end relational database design and analytical SQL case study simulating the Indian Railway Catering and Tourism Corporation (IRCTC) booking system.

## Overview
This project models a relational database in MySQL to manage passenger information, train routes, and ticket bookings. It demonstrates how relational queries and aggregation functions answer key operational and revenue questions.

## Database Schema & Entities
- **`trains`**: Stores train number, name, source, destination, and seating capacity.
- **`passengers`**: Stores demographic information like passenger name, age, gender, and city.
- **`bookings`**: Stores PNR details, seat numbers, journey dates, travel class, booking status, and fare details.

## SQL Techniques Featured
- Relational Joins (`JOIN`, `LEFT JOIN`)
- Data Aggregation (`COUNT`, `SUM`, `GROUP BY`, `ORDER BY`)
- Conditional Aggregation (`CASE WHEN ... THEN ... END`)
- Structural Integrity Constraints (Primary Keys, Foreign Keys, `ENUM`)

## Project Structure
```text
├── sql/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   └── 03_analysis_queries.sql
├── presentation/
│   └── IRCTC_SQL_Case_Study.pptx
└── README.md