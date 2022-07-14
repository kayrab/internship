SELECT Flights.ID, Company.Name, Planes.Type, Planes.Number AS "Plane Number", StartDest.Name AS StartDest, EndDest.Name AS EndDest, Flights.Departure_time, Flights.Duration, Flights.Passengers, Planes.Seats, SUM(Planes.Seats - Flights.Passengers) AS Empty_seats
FROM Flights
LEFT JOIN Planes ON Planes.ID = Flights.Plane_ID
LEFT JOIN Company ON Company.ID = Flights.Company_ID
LEFT JOIN Airports AS StartDest ON Flights.StartDest_ID = StartDest.ID
LEFT JOIN Airports AS EndDest ON Flights.EndDest_ID = EndDest.ID
GROUP BY Flights.ID, Planes.Seats, Company.Name, Planes.Number, Planes.Type, Flights.Passengers,  StartDest.Name, EndDest.Name, Flights.Departure_time, Flights.Duration


