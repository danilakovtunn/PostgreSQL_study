--Количество мест в самолетах (классах)
SELECT tab.model, tab.fare_conditions, tab.count, 
       SUM(tab.count) OVER (PARTITION BY tab.model)
FROM (
  SELECT ac.model, COUNT(ac.aircraft_code), s.fare_conditions 
  FROM seats s, aircrafts ac
  WHERE s.aircraft_code = ac.aircraft_code
  GROUP BY ac.model, s.fare_conditions
  ORDER BY ac.model
) AS tab