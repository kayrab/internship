/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[first_name_doctor]
      ,[surname_doctor]
      ,[age]
      ,[phone_number]
      ,[office]
  FROM [Hospital].[dbo].[Doctor]

INSERT INTO Doctor(first_name_doctor, surname_doctor, age, phone_number, office) VALUES('Pesho', 'Petrov', 56, '0893587175', 'Pirogov');
INSERT INTO Doctor(first_name_doctor, surname_doctor, age, phone_number, office) VALUES('Georgi', 'Tasev', 40, '0893587975', 'Pirogov');