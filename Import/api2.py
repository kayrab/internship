from fastapi import FastAPI, HTTPException, Request
import uvicorn
import pyodbc

from typing import Union
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder
from starlette.templating import Jinja2Templates
from fastapi.responses import HTMLResponse

sql_server = 'Driver={SQL Server}; Server=LAPTOP-KEBAOJM7\SQLEXPRESS; Database=sofia_buses;Trusted_Connection=yes;'

app = FastAPI()

class Line(BaseModel):
    line: Union[int, None] = None

templates = Jinja2Templates(directory="Templates")

@app.get("/stops")
async def stops():
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dbo.Stops')
    data = []

    for row in cursor:
        data.append({'id': int(row[0]), 'stop_name': str(row[1])})
    return {'stops': data}

@app.get("/lines")
async def lines():
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dbo.Buses')
    data = []

    for row in cursor:
        data.append({'id': int(row[0]), 'line': str(row[1])})
    return { 'lines': data}

@app.get("/line/stops/{line_id}")
async def read_item(line_id: int):
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute(' SELECT Buses.line, Stops.stop_name, r.stop_num' +
' FROM Buses ' +
' LEFT JOIN Relationship r ON Buses.id = r.line_id ' +
' LEFT JOIN Stops ON r.stop_id = Stops.id ' +
' WHERE Buses.id= ' + str(line_id) +
' GROUP BY Buses.id, Buses.line, Stops.stop_name, r.stop_num ' +
' ORDER BY r.stop_num ')
    data = []
    for row in cursor:
        data.append({'Line': str(row[0]), 'Stop_name': str(row[1])})
    return {'lines': data}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
