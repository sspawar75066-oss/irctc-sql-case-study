-- IRCTC Railway Reservation System - Sample Data
USE irctc_db;

-- Insert Sample Trains
INSERT INTO trains (train_number, train_name, source_station, destination_station, total_seats) VALUES
('12951', 'Mumbai Rajdhani Express', 'Mumbai Central', 'New Delhi', 1200),
('10103', 'Mandovi Express', 'Mumbai CSMT', 'Madgaon', 850),
('12137', 'Punjab Mail', 'Mumbai CSMT', 'Firozpur', 1100);

-- Insert Sample Passengers
INSERT INTO passengers (full_name, city, age, gender) VALUES
('Aarav Sharma', 'Mumbai', 28, 'Male'),
('Diya Patel', 'Pune', 24, 'Female'),
('Rohan Verma', 'Delhi', 35, 'Male');

-- Insert Sample Bookings
INSERT INTO bookings (pnr_number, passenger_id, train_id, journey_date, class_type, seat_number, booking_status, fare) VALUES
('PNR8821941', 1, 1, '2026-02-15', '1A', 'HA1-12', 'Confirmed', 3450.00),
('PNR4491023', 2, 2, '2026-02-18', '3A', 'B2-45', 'Confirmed', 1250.00),
('PNR1103948', 3, 3, '2026-02-20', 'SL', 'S4-12', 'Waitlisted', 680.00);