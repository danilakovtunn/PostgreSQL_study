--Прибыли
WITH cities_income AS (
    SELECT ap.city, SUM(t_fl.amount) AS income, COUNT(t_fl.ticket_no) AS total_tickets
    FROM airports ap, flights fl, ticket_flights t_fl
    WHERE ap.airport_code = fl.departure_airport AND
          fl.flight_id = t_fl.flight_id
    GROUP BY ap.city
), best_cities AS (
    SELECT city, income, total_tickets
    FROM cities_income
	WHERE income > (SELECT AVG(income) FROM cities_income)
)
SELECT city, income, total_tickets
FROM best_cities
ORDER BY income DESC