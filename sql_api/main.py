import pyodbc

sql_server = 'Driver={SQL Server}; Server=LAPTOP-KEBAOJM7\SQLEXPRESS; Database=sofia_buses;Trusted_Connection=yes;'
conn = pyodbc.connect(sql_server)

cursor = conn.cursor()
cursor.execute('SELECT * FROM dbo.Stops')

for i in cursor:
    print(i)