-- DISTINCT

USE Northwind

-- in welche L�nder liefern wir?

SELECT Country
FROM Customers
ORDER BY Country


SELECT DISTINCT Country
FROM Customers
ORDER BY Country
-- 21 Zeilen Ergebnis - so viele, wie L�nder


SELECT DISTINCT CustomerID, Country
FROM Customers
ORDER BY Country
-- bringt nix, weil jetzt so viele ausgegeben werden, wie Customers da sind (91)


SELECT DISTINCT Country, City
FROM Customers
ORDER BY Country, City



SELECT DISTINCT City, Country
FROM Customers
ORDER BY Country, City

-- L�nder, in denen Angestellte wohnen
SELECT DISTINCT Country
FROM Employees

-- �berpr�fen: ja, stimmt, UK und USA
SELECT *
FROM Employees
ORDER BY Country

-- St�dte, in denen wir auch Kunden haben?
SELECT DISTINCT City
FROM Customers





