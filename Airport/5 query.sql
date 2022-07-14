ALTER PROCEDURE Count_FlightTime(@start_date date, @end_date date)
AS
BEGIN
	SELECT Planes.ID, Planes.Type, Company.Name, SUM(DATEDIFF(MINUTE, '0:00:00',Flights.Duration)) AS Duration
	FROM Planes
	LEFT JOIN Flights ON Planes.ID = Flights.Plane_ID
	LEFT JOIN Company ON Company.ID = Flights.Company_ID
	WHERE Flights.Departure_time BETWEEN @start_date AND @end_date
	GROUP BY Planes.ID, Company.Name, Planes.Type
END

exec Count_FlightTime '2022-07-12', '2022-07-16'