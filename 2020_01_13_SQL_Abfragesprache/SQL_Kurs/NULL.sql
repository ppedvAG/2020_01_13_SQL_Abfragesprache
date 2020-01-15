-- NULL

-- = NULL geht nicht
-- mathematischen Operationen sind mit NULL nicht m�glich

-- NEIN: xx = NULL, xx != NULL, xx > NULL, xx < NULL (macht eh keinen Sinn)
-- JA: xx IS NULL, xx IS NOT NULL

SELECT	  OrderID
		, CustomerID
		, ShipRegion
FROM Orders

SELECT	  OrderID
		, CustomerID
		, ISNULL(ShipRegion, '')
FROM Orders