-- temporary tables
-- tempor�re Tabellen

-- h�lt nur so lange, wie Verbindung besteht

-- lokale tempor�re Tabellen
-- existiert nur in aktueller Session
-- #tabellenname

-- globale tempor�re Tabellen
-- Zugriff auch von anderen Sessions
-- ##tabellenname

USE Northwind

SELECT CustomerID, Freight
INTO #t1
FROM Orders


SELECT *
FROM #t1
