/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[patient_id]
      ,[doctor_id]
      ,[visited_at]
      ,[diagnosis]
  FROM [Hospital].[dbo].[Visits]

INSERT INTO Visits(id, patient_id, doctor_id, visited_at, diagnosis) VALUES(NEWID(), 1, 1, '2022-05-01 12:30:00', 'diagnosis1');
INSERT INTO Visits(id, patient_id, doctor_id, visited_at, diagnosis) VALUES(NEWID(), 1, 2, '2022-08-01  12:40:00', 'diagnosis2');
INSERT INTO Visits(id, patient_id, doctor_id, visited_at, diagnosis) VALUES(NEWID(), 2, 2, '2022-12-01  13:30:00', 'diagnosis3');
INSERT INTO Visits(id, patient_id, doctor_id, visited_at, diagnosis) VALUES(NEWID(), 3, 2, '2022-09-01  02:30:00', 'diagnosis4');

SELECT v.id, p.first_name, p.surname, d.first_name_doctor, d.surname_doctor, d.office, v.visited_at
FROM Visits v
LEFT JOIN Patient p ON  v.patient_id = p.id
LEFT JOIN Doctor d ON v.doctor_id = d.id;