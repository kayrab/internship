/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[first_name]
      ,[surname]
      ,[age]
      ,[phone_number]
      ,[previous_illnesses]
      ,[allergies]
  FROM [Hospital].[dbo].[Patient]

INSERT INTO Patient(id, first_name, surname, age, phone_number, previous_illnesses, allergies) VALUES(NEWID(), 'Georgi', 'Boiadjiev', 14, '0893535675', 'cold, covid', 'dogs');
INSERT INTO Patient(id, first_name, surname, age, phone_number, previous_illnesses, allergies) VALUES(NEWID(), 'Kayra', 'Boiadjieva', 17, '0893587175', 'cold', NULL);
INSERT INTO Patient(id, first_name, surname, age, phone_number, previous_illnesses, allergies) VALUES(NEWID(), 'Mariq', 'Ivanova', 20, '0883467717', 'covid', NULL);


SELECT p.first_name, p.surname, p.age, p.phone_number, 
p.previous_illnesses, p.allergies, d.first_name_doctor, d.surname_doctor, 
v.visited_at, v.diagnosis
FROM Patient p
LEFT JOIN Visits v ON v.patient_id = p.id
LEFT JOIN Doctor d ON v.doctor_id = d.id;