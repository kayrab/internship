ALTER PROCEDURE Count_passengers(@start_date date, @end_date date)
AS
BEGIN
	SELECT Flights.Company, SUM(Flights.Passengers) AS Passengers
	FROM Planes
	LEFT JOIN Flights ON Planes.ID = Flights.Plane_ID
	WHERE Flights.Departure_time BETWEEN @start_date AND @end_date
	GROUP BY Flights.Company 
END

exec Count_passengers '2022-07-12', '2022-07-16'