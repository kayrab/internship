CREATE PROCEDURE worktime_doctor(@id_doctor int)
AS
BEGIN
	SELECT CAST(start_date as DATE) AS Day, Doctors.FullName, SUM(DATEDIFF(month, start_date, end_date)) AS Count
	FROM Pregledi
	JOIN Doctors ON Doctors.id = Pregledi.id_doctor
	WHERE id_doctor=@id_doctor
	GROUP BY CAST(start_date as DATE), Doctors.FullName
END

EXEC worktime_doctor 1

