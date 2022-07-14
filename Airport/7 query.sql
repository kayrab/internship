SELECT TOP 1 Airports.Name AS EndDest, SUM(Flights.Passengers) AS Passengers
FROM Flights
LEFT JOIN Airports ON Flights.EndDest_ID = Airports.ID
GROUP BY Airports.Name
ORDER BY SUM(Flights.Passengers) DESC