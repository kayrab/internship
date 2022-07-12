SELECT f.Departure_Time + CAST(f.[Delay] as DATETIME) as "Taking off", f.EndDest, f.Terminal, f.Gate
FROM Flights f
WHERE f.StartDest = 'София';

SELECT f.Departure_Time + CAST(f.[Delay] as DATETIME) + 
CAST(f.Duration as DATETIME) as "Arriving at", 
f.StartDest, f.Terminal, f.Gate
FROM Flights f
WHERE f.EndDest = 'София';