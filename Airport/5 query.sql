ALTER PROCEDURE Count_FlightTime(@start_date date, @end_date date)
AS
BEGIN
	SELECT Planes.ID, SUM(Flights.Duration) AS Duration
	FROM Planes
	LEFT JOIN Flights ON Planes.ID = Flights.Plane_ID
	WHERE Flights.Departure_time BETWEEN @start_date AND @end_date
	GROUP BY Planes.ID
END

exec Count_FlightTime '2022-07-12', '2022-07-16'