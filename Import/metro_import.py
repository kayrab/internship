import json
import pyodbc

sql_server = 'Driver={SQL Server}; Server=LAPTOP-KEBAOJM7\SQLEXPRESS; Database=sofia_buses;Trusted_Connection=yes;'

conn = pyodbc.connect(sql_server)
cursor = conn.cursor()

with open('metro_lines.json', encoding='utf-8') as r:
    metro_lines = json.load(r)

for line, stops in metro_lines.items():
    result = cursor.execute("SELECT id FROM dbo.Buses WHERE line = '{}'".format(line))
    line_id = None
    result_rows = result.fetchall()

    if len(result_rows) > 0:
        line_id = result_rows[0][0]

    if line_id is None:
        cursor.execute("INSERT INTO dbo.Buses(line) VALUES('{}')".format(line))
        conn.commit()

        result = cursor.execute("SELECT id FROM dbo.Buses WHERE line = '{}'".format(line))
        line_id = None
        result_rows = result.fetchall()

        if len(result_rows) > 0:
            line_id = result_rows[0][0]

    print("\nЛиния: " + line)
    stop_num = 1
    for stop in stops:
        print("  " + stop)

        result_stops = cursor.execute("SELECT id FROM dbo.Stops WHERE stop_name = '{}'".format(stop))
        stop_id = None
        result_rows_stops = result_stops.fetchall()

        if len(result_rows_stops) > 0:
            stop_id = result_rows_stops[0][0]

        if stop_id is None:
            cursor.execute("INSERT INTO dbo.Stops(stop_name) VALUES('{}')".format(stop))
            conn.commit()

            result_stops = cursor.execute("SELECT id FROM dbo.Stops WHERE stop_name = '{}'".format(stop))
            stop_id = None
            result_rows_stops = result_stops.fetchall()

            if len(result_rows_stops) > 0:
                stop_id = result_rows_stops[0][0]

        result_stops_lines = cursor.execute("SELECT id FROM dbo.Relationship WHERE line_id = '{}' AND stop_id = '{}'".format(line_id, stop_id))
        id = None
        result_rows_stops_lines = result_stops_lines.fetchall()

        if len(result_rows_stops_lines) > 0:
            id = result_rows_stops_lines[0][0]

        if id is None:
            cursor.execute("INSERT INTO dbo.Relationship(line_id, stop_id, stop_num) VALUES('{}', '{}', '{}')".format(line_id, stop_id, stop_num))
            conn.commit()
            stop_num += 1


