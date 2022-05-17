--В ПУТИ
SELECT tab."departure airport", tab.model, tab.actual_departure,
       age(bookings.now(), tab.actual_departure) AS "flying time",
       tab.count, SUM(tab.count) OVER (PARTITION BY "departure airport") AS "airport count"
FROM (
  SELECT (ap.city || '(' || fl.departure_airport || ')') as "departure airport",
         ac.model, fl.actual_departure, COUNT(t_fl.ticket_no)
  FROM flights fl, airports ap, ticket_flights t_fl, aircrafts ac
  WHERE fl.actual_arrival IS NULL AND 
        fl.actual_departure IS NOT NULL AND
	    ap.airport_code = fl.departure_airport AND 
  	    fl.flight_id = t_fl.flight_id AND
  	    ac.aircraft_code = fl.aircraft_code
  GROUP BY fl.actual_departure, ap.city, fl.departure_airport, ac.model, fl.flight_id
  ORDER BY ap.city
) AS tab
ORDER BY "flying time" DESC