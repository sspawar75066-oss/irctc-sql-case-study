-- IRCTC Railway Reservation System - Analytical Queries
USE irctc_db;

-- 1. Detailed Master Booking Report
SELECT
    b.booking_id,
    b.pnr_number,
    p.full_name AS passenger_name,
    t.train_number,
    t.train_name,
    t.source_station,
    t.destination_station,
    b.journey_date,
    b.class_type,
    b.seat_number,
    b.booking_status,
    b.fare
FROM bookings AS b
JOIN passengers AS p
    ON b.passenger_id = p.passenger_id
JOIN trains AS t
    ON b.train_id = t.train_id
ORDER BY b.journey_date;

-- 2. Ticket Status Breakdown
SELECT
    booking_status,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY booking_status
ORDER BY total_bookings DESC;

-- 3. Train-wise Revenue & Booking Volume (Confirmed Only)
SELECT
    t.train_number,
    t.train_name,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.fare) AS confirmed_revenue
FROM bookings AS b
JOIN trains AS t
    ON b.train_id = t.train_id
WHERE b.booking_status = 'Confirmed'
GROUP BY t.train_id, t.train_number, t.train_name
ORDER BY confirmed_revenue DESC;

-- 4. Passenger Spending Analysis
SELECT
    p.passenger_id,
    p.full_name,
    p.city,
    COUNT(b.booking_id) AS total_bookings,
    SUM(
        CASE
            WHEN b.booking_status = 'Confirmed'
            THEN b.fare
            ELSE 0
        END
    ) AS confirmed_spending
FROM passengers AS p
LEFT JOIN bookings AS b
    ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.full_name, p.city
ORDER BY confirmed_spending DESC;

-- 5. Class-wise Revenue Contribution
SELECT
    class_type,
    COUNT(*) AS total_bookings,
    SUM(
        CASE
            WHEN booking_status = 'Confirmed'
            THEN fare
            ELSE 0
        END
    ) AS confirmed_revenue
FROM bookings
GROUP BY class_type
ORDER BY confirmed_revenue DESC;

-- 6. Route-wise Demand & Revenue
SELECT
    t.source_station,
    t.destination_station,
    COUNT(b.booking_id) AS total_bookings,
    SUM(
        CASE
            WHEN b.booking_status = 'Confirmed'
            THEN b.fare
            ELSE 0
        END
    ) AS confirmed_revenue
FROM bookings AS b
JOIN trains AS t
    ON b.train_id = t.train_id
GROUP BY
    t.source_station,
    t.destination_station
ORDER BY confirmed_revenue DESC;

-- 7. Date-wise Booking Trends
SELECT
    journey_date,
    COUNT(*) AS total_bookings,
    SUM(
        CASE
            WHEN booking_status = 'Confirmed'
            THEN fare
            ELSE 0
        END
    ) AS confirmed_revenue
FROM bookings
GROUP BY journey_date
ORDER BY journey_date;