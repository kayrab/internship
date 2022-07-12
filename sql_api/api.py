from fastapi import FastAPI, HTTPException, Request
import uvicorn
import pyodbc

from typing import Union
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder
from starlette.templating import Jinja2Templates
from fastapi.responses import HTMLResponse

sql_server = 'Driver={SQL Server}; Server=LAPTOP-KEBAOJM7\SQLEXPRESS; Database=SUMC;Trusted_Connection=yes;'

app = FastAPI()

class Line(BaseModel):
    line: Union[int, None] = None

templates = Jinja2Templates(directory="Templates")


@app.get("/web/line/stops", response_class=HTMLResponse)
async def web_lines_stops(request: Request):
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('SELECT id,type,line_num FROM dbo.lines order by id')
    data = []
    for row in cursor:
        data.append({'id': int(row[0]), 'line': row[1]+str(row[2])})

    cursor.execute('SELECT * FROM dbo.Stops order by id')
    data2 = []
    for row in cursor:
        data2.append({'id': int(row[0]), 'stop_name': str(row[1])})
    return templates.TemplateResponse("line_stops.html", {"request": request, "lines": data, "stops": data2})

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
    cursor.execute('SELECT * FROM dbo.Lines')
    data = []

    for row in cursor:
        data.append({'id': int(row[0]), 'type': str(row[1]), 'line_num': int(row[2])})
    return { 'lines': data}

@app.get("/line/stops/{line_id}/{way}")
async def read_item(line_id: int, way: bool):
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute(' SELECT Lines.Type, Lines.line_num, Stops.name' +
' FROM Lines ' +
' LEFT JOIN Line_Stop ls ON Lines.id = ls.line_id ' +
' LEFT JOIN Stops ON ls.stop_id = Stops.id ' +
' LEFT JOIN Way ON Way.line_id = Lines.id ' +
' LEFT JOIN Schedule ON Schedule.line_id = Lines.id AND Schedule.way_id = Way.id ' +
' LEFT JOIN Time ON Time.schedule_id = Schedule.id ' +
' WHERE Lines.id= ' + str(line_id) + 'AND Way.way = ' + str(int(way)) + '' +
' GROUP BY Lines.id, Lines.Type, Lines.line_num, Stops.name')
    data = []
    for row in cursor:
        data.append({'Type': str(row[0]), 'Line': int(row[1]), 'Stop': str(row[2])})
    return {'lines': data}

@app.put("/lines", response_model=Line)
async def put_line(line: Line):
    data = jsonable_encoder(line)
    conn = pyodbc.connect(sql_server)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO Buses(line) VALUES(\'' + str(line.line) + '\')')
    conn.commit()
    return data

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
