SELECT Flights.ID, Flights.Passangers, SUM(Planes.Seats - Flights.Passangers) AS Empty_seats
FROM Flights
LEFT JOIN Planes ON Planes.ID = Flights.Plane_ID
GROUP BY Flights.ID, Flights.Passangers


