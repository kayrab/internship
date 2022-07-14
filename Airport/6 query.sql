ALTER PROCEDURE Count_passengers(@start_date date, @end_date date)
AS
BEGIN
	SELECT Company.Name, SUM(Flights.Passengers) AS Passengers
	FROM Flights
	LEFT JOIN Company ON Company.ID = Flights.Company_ID
	WHERE Flights.Departure_time BETWEEN @start_date AND @end_date
	GROUP BY Company.Name 
END

exec Count_passengers '2022-07-12', '2022-07-16'