-- h�ufig verwendete Serverfunktionen

-- ****************************** TRIM, LEN, DATALENGTH *****************************

SELECT 'Test'

SELECT 'Test          '

SELECT LEN('Test          ') -- z�hlt Leerezeichen nicht mit!
SELECT LEN('Test XY          ') -- z�hlt nur die Leerzeichen zwischen Text mit

SELECT RTRIM('Test          ') -- Leerzeichen rechts wegk�rzen

SELECT LEN(RTRIM('Test          ')) -- bringt nix!

SELECT DATALENGTH(('Test          ')) -- Datalength z�hlt Leerzeichen am Ende auch mit
SELECT DATALENGTH(RTRIM('Test          ')) -- wieviele Zeichen, nachdem Leerzeichen weggek�rzt wurden?

SELECT LTRIM('     Test')
SELECT DATALENGTH(('     Test'))
SELECT DATALENGTH(LTRIM('     Test'))

SELECT TRIM('     Test     ') -- Trim schneidet Leerzeichen davor UND danach weg (LTRIM + RTRIM)


--********************************** REVERSE ***********************

SELECT REVERSE('REITTIER')
SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')


-- *************************** TEXT AUSSCHNEIDEN: LEFT, RIGHT, SUBSTRING *************

-- Zeichen links "ausschneiden":
SELECT LEFT('Testtext', 4) -- Test

-- Zeichen rechts "ausschneiden":
SELECT RIGHT('Testtext', 4) -- text

-- Textausschnitt erstellen mit SUBSTRING:
SELECT SUBSTRING('Testtext', 4, 2)
-- bei welcher Stelle beginnen wir zu z�hlen (4) und wieviele Zeichen m�chte ich ausschneiden (2)


-- ********************************** STUFF ******************************

SELECT STUFF('Testtext', 5, 0, '-Hallo-')
-- an welcher Stelle f�ge ich ein (5)
-- wieviele Zeichen werden weggel�scht (0)
-- WAS wird eingef�gt (-Hallo-)

-- �bung 
-- String Funktionen (Serverfunktionen) �bung 1
-- Die letzten drei Stellen der Telefonnummer sollen durch xxx ersetzt werden: +49 86779889xxx

-- L�sungsm�glichkeiten
-- M�glichkeiten 1
SELECT STUFF('1234567890', 8, 3, 'xxx') -- nur bei gleicher L�nge

-- M�glichkeit 2
SELECT REVERSE(STUFF(REVERSE('1234567890'), 1, 3, 'xxx'))

-- aufgeschl�sselt
SELECT REVERSE('1234567890') -- 0987654321
SELECT STUFF('0987654321', 1, 3, 'xxx') -- xxx7654321
SELECT REVERSE('xxx7654321')


SELECT REVERSE(STUFF(REVERSE('1234567890'), 1, 3, 'xxx'))


-- M�glichkeit 3
SELECT STUFF('1234567890', LEN('1234567890')-2, 3, 'xxx')

-- M�glichkeit 4
SELECT LEFT('1234567890', 7) + 'xxx' -- nur bei gleicher L�nge!


-- �bung Leerzeichen wegmachen

SELECT DATALENGTH('     Test     ') AS Vorher,
	   DATALENGTH(TRIM('     Test     ')) AS Nachher



-- ******************************* CONCAT ***************************************
-- Strings zusammenf�gen

SELECT CONCAT('abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz')
SELECT CONCAT('James', ' ', 'Bond') AS FullName

-- bei Abfrage aus Tabelle:
--SELECT CONCAT(FirstName, ' ', LastName)
--FROM Tabellenname

-- geht auch mit TRIM:

--SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName))
--FROM Tabellenname


-- �bung: Wilham Shakesbeer

SELECT CONCAT(STUFF(STUFF(STUFF('Wilham Shakesbeer', 4, 1, 'li'), 15, 1, 'p'), 17, 1, 'a'), 'e')

SELECT CONCAT(STUFF('Wilham', 4, 1, 'li'), ' ', STUFF('Shakesbeer', 7, 4, 'peare'))

SELECT STUFF(STUFF('Wilham Shakesbeer', 4, 1, 'li'), 15, 4, 'peare')


SELECT CONCAT
			(STUFF
				(STUFF
					(STUFF('Wilham Shakesbeer', 4, 1, 'li'), 15, 1, 'p'), 17, 1, 'a')
						, 'e'
		);



SELECT FirstName, 
		LastName, 
		--Phone


SELECT	  FirstName AS Vorname
		, LastName
		--, Phone




-- ************************************* REPLICATE *******************************
SELECT REPLICATE('a', 5)

-- funktioniert auch mit Sonderzeichen
SELECT REPLICATE('?', 3)

-- auch mit Zeichenfolgen m�glich
SELECT REPLICATE('acb', 3)



-- *********************************** Gro�- und Kleinbuchstaben *****************
-- alles in Gro�buchstaben
SELECT UPPER('abc')
-- "uppercase"

-- alles in Kleinbuchstaben 
SELECT LOWER('ABC')
-- "lowercase"


-- ************************************* CHARINDEX *****************************

-- an welcher Stelle befindet sich ein gesuchtes Zeichen?

SELECT CHARINDEX('s', 'Testtext') -- 3
SELECT CHARINDEX('t', 'Testtext') -- 1 - zeigt die erste gesuchte Stelle an

-- Gro�- Kleinschreibung vom gesuchten Zeichen spielt keine Rolle
SELECT CHARINDEX('T', 'tesTtext') -- 1

-- Leerzeichen suchen
SELECT CHARINDEX(' ', 'James Bond')

-- man kann damit auch nach Zeichenfolgen suchen
SELECT CHARINDEX('schnecke', 'Zuckerschnecke')

-- Charindex gibt die ERSTE Stelle an, wo das gesuchte Zeichen steckt
SELECT CHARINDEX(' ', 'Wolfgang Amadeus Mozart') -- 9
SELECT CHARINDEX(' ', 'Georg Friedrich H�ndel') -- 6

-- wie bekomme ich das LETZTE Leerzeichen?

SELECT DATALENGTH('Klaus Maria Brandauer') - CHARINDEX(' ', REVERSE('Klaus Maria Brandauer'))+1 -- 12

SELECT DATALENGTH('Wolfgang Amadeus Mozart') - CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart'))+1 -- 17

SELECT DATALENGTH('Georg Friedrich H�ndel') - CHARINDEX(' ', REVERSE('Georg Friedrich H�ndel'))+1 -- 16

-- langsam aufgeschl�sselt:
SELECT REVERSE('Wolfgang Amadeus Mozart')
SELECT CHARINDEX(' ', 'trazoM suedamA gnagfloW') -- 7
SELECT DATALENGTH('Wolfgang Amadeus Mozart') -- 23
SELECT 23-7 -- 16

SELECT DATALENGTH('Wolfgang Amadeus Mozart') - SELECT CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart'))+1


-- andere M�glichkeit
SELECT CHARINDEX(' ', STUFF('Wolfgang Amadeus Mozart', CHARINDEX(' ', 'Wolfgang Amadeus Mozart') ,1 ,''))+1



-- man kann auch nach Sonderzeichen suchen
SELECT CHARINDEX('$', '450$')
SELECT CHARINDEX('%', '20%')

-- ************************* ZEICHEN ERSETZEN: REPLACE *************************

SELECT REPLACE('Hallo!', 'a', 'e') -- Hello!
-- 3 Bedingungen: 1 welcher Ausdruck, 2 was wollen wir ersetzen, 3 womit ersetzen?

-- mehr als ein Zeichen ersetzen mit Verschachtelung:
SELECT REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?') -- Hello?
SELECT REPLACE(REPLACE(REPLACE('Hallo!', 'a', 'e'), '!', '?'), 'h', 'B') -- Bello?

