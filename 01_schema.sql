-- IRCTC Railway Reservation System - Schema Definition
CREATE DATABASE IF NOT EXISTS irctc_db;
USE irctc_db;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS trains;

-- Trains Table
CREATE TABLE trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_number VARCHAR(10) UNIQUE NOT NULL,
    train_name VARCHAR(100) NOT NULL,
    source_station VARCHAR(100) NOT NULL,
    destination_station VARCHAR(100) NOT NULL,
    total_seats INT DEFAULT 1000
);

-- Passengers Table
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

-- Bookings Table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    pnr_number VARCHAR(15) UNIQUE NOT NULL,
    passenger_id INT,
    train_id INT,
    journey_date DATE NOT NULL,
    class_type VARCHAR(20) NOT NULL,
    seat_number VARCHAR(10),
    booking_status ENUM('Confirmed', 'Waitlisted', 'Cancelled') DEFAULT 'Confirmed',
    fare DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE,
    FOREIGN KEY (train_id) REFERENCES trains(train_id) ON DELETE CASCADE
);