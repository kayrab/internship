ALTER PROCEDURE from_to (@StartDest varchar(50), @EndDest varchar(50), @isDirect bit, @Date date)
AS
BEGIN
    IF @isDirect = 0
        SELECT Flights.ID, Flights.Departure_time,  
		SUM(Planes.Seats - Flights.Passengers) AS Empty_seats, SUM(DATEDIFF(MINUTE, '0:00:00', Flights.Duration + Flights.Departure_time + Flights.[Delay])), Flights.Price
		FROM Flights
		LEFT JOIN Planes ON Planes.ID = Flights.Plane_ID
		WHERE Flights.StartDest=@StartDest AND Flights.EndDest=@EndDest
		GROUP BY Flights.ID, Flights.Departure_time, Flights.Duration, Flights.Price
		
	 IF @isDirect = 1
	  SELECT Flights.ID, Flights.Departure_time,  
		SUM(Planes.Seats - Flights.Passengers) AS Empty_seats, Flights.Duration, Flights.Price
		FROM Flights
		LEFT JOIN Planes ON Planes.ID = Flights.Plane_ID
		WHERE Flights.StartDest=@StartDest AND Flights.EndDest=@EndDest
		GROUP BY Flights.ID, Flights.Departure_time, Flights.Duration, Flights.Price
END