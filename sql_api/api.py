from fastapi import FastAPI
import uvicorn
import pyodbc

from typing import Union
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder

sql_server = 'Driver={SQL Server}; Server=LAPTOP-KEBAOJM7\SQLEXPRESS; Database=sofia_buses;Trusted_Connection=yes;'

app = FastAPI()

class Line(BaseModel):
    line: Union[int, None] = None

@app.get("/lines")
async def lines():
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dbo.Buses')
    data = []

    for row in cursor:
        data.append({'id': int(row[0]), 'line': row[1]})

    return { 'lines': data}

@app.get("/stops")
async def stops():
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dbo.Stops')
    data = []

    for row in cursor:
        data.append({'id': int(row[0]), 'stop_name': row[1]})

    return { 'stops': data}

@app.get("/stops/line/{line_id}")
async def read_item(line_id: int):
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT Buses.line, Stops.stop_name, r.stop_num ' +
                    ' FROM Relationship r ' +
                    ' LEFT JOIN Buses ON Buses.id = r.line_id ' +
                    ' LEFT JOIN Stops ON Stops.id = r.stop_id ' +
                    ' WHERE Buses.id= ' + str(line_id) +
                    ' ORDER BY r.stop_num ASC ')
    data = []
    for row in cursor:
        data.append({'Line': int(row[0]), 'Stop': row[1], 'Order': int(row[2])})
    return {'lines': data}

@app.put("/put_line", response_model=Line)
async def put_line(line: Line):
    data = jsonable_encoder(line)
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO Buses(line) VALUES(\'' + str(line.line) + '\')')
    conn.commit()
    return data

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)