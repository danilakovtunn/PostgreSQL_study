--"Самые выгодные пассажиры"
SELECT t.passenger_name, t.book_ref, count(t.book_ref || t.passenger_name), SUM(t_fl.amount)
FROM flights fl
JOIN airports ap ON fl.departure_airport = ap.airport_code
JOIN ticket_flights t_fl ON fl.flight_id = t_fl.flight_id
JOIN tickets t ON t_fl.ticket_no = t.ticket_no
WHERE ap.city IN ('Москва', 'Санкт-Петербург')
GROUP BY t.passenger_name, t.book_ref
HAVING count(t.book_ref || t.passenger_name) > 2
ORDER BY count DESC, sum DESC, t.passenger_name