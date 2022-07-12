SELECT ÒOP 1 Flights.EndDest, SUM(Flights.Passengers) AS Passengers
FROM Flights
GROUP BY Flights.EndDest
ORDER BY SUM(Flights.Passengers) DESC