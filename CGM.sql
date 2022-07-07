SELECT Lines.Type, Lines.line_num, Stops.name, Time.time
FROM Lines
LEFT JOIN Line_Stop ls ON Lines.id = ls.line_id
LEFT JOIN Stops ON ls.stop_id = Stops.id
LEFT JOIN Schedule ON Schedule.line_id = Lines.id
LEFT JOIN Time ON Time.schedule_id = Schedule.id
LEFT JOIN Way ON Way.line_id = Lines.id
WHERE Lines.line_num = 604
GROUP BY Lines.id, Lines.Type, Lines.line_num, Stops.name, Time.time