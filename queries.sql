USE buchshop;

# °A	Sie wollen in der Tabelle Kunde einen neuen Kunden mit allen notwendigen Angaben erfassen.
# Wie lautet der SQL Befehl dazu?

INSERT INTO Kunde (Vorname, Nachname, Adresse, EMail) VALUES
    ('Anna', 'Müller', 'Hauptstr. 1', 'anna.mueller@email.de');

# °B	In der Liste Buch sollen alle Bücher gelöscht werden, die mit "Der" anfangen.
# Wie lautet der SQL Befehl dazu?

DELETE FROM Buch WHERE Titel LIKE 'Der%';

# °C	Wie lautet der SQL Befehl, um eine Liste aller Bücher pro Autor zu erhalten?

SELECT Titel, Autor FROM Buch
ORDER BY Autor;

# °D	Suchen Sie alle Bestellungen eines bestimmten Kunden. Selektieren Sie den Kunden mit Hilfe seiner KundenID.

SELECT * FROM Bestellung
WHERE KundenID = 1;

# °E	Mit welchem SQL-Statment können Sie die Gesamtzahl aller Buchtitel finden?

SELECT COUNT(*) AS 'Erfasste Bücher' FROM Buch;

# °F	Brechnen Sie die Tagesumsätze sowie den mittleren Tagesumsatz. Ordnen Sie nach Datum.

SELECT SUM(Betrag) AS 'Umsatz', AVG(Betrag) AS 'Durchschnittlicher Umsatz'
FROM Bestellung
GROUP BY BestDatum
ORDER BY BestDatum;

# °G	Brechnen Sie pro Buchttitel (= "BuchID") die verkaufte Menge, den Umsatz und listen Sie das Ergebnis nach Verkaufsmenge (top-down).

SELECT BuchID, SUM(Menge) AS 'Absatz', SUM(Menge * PreisProStueck) AS 'Umsatz'
FROM Bestellposition
GROUP BY BuchID
ORDER BY 'Absatz' DESC;

# °H	Sie interessieren sich für alle Buchtitel, die in einem gewissen Preisspektrum liegen (z.B. zwischen 10.- und 30.-).
# Wie lautet der SQL Befehl dazu?

SELECT BuchID, Titel, Preis
FROM Buch
WHERE Preis > 10 AND Preis < 30;

# Die folgenden Abfragen sind sicherlich anspruchsvoller und erfordern eine ausgefeiltere Formulierung der Abfrage 😉
# optional (und wenn Sie sich das bereits zutrauen): Versuchen Sie auch dafür eine Lösung zu finden!
# °I	Berechnen Sie den Gesamtwert einer jeden Bestellung und geben Sie alle notwendigen Information in einer Tabelle aus.

# the query SUM(Menge * PreisProStueck) sums up each position's `Menge * PreisProStueck` individually, using the correct price for each book. The total is the sum of all these individual calculations.

# so first you make groupings of all the Bestellpositions for every order
# then you use the SUM() function to sum up each row of those groupings and multiply the Menge * PreisProStueck per row

SELECT Bestellung.BestID, SUM(Menge * PreisProStueck) AS 'Gesamtwert Bestellung'
FROM Bestellung
JOIN Bestellposition ON Bestellung.BestID = Bestellposition.BestID
GROUP BY Bestellung.BestID;

# °J	Geben Sie eine Liste aus, in der die Kunden nach der Anzahl ihrer Bestellungen sortiert sind.

SELECT Kunde.KundenID, Kunde.Vorname, Kunde.Nachname, COUNT(Bestellung.BestID) AS 'AnzahlBestellungen'
FROM Kunde
LEFT JOIN Bestellung ON Kunde.KundenID = Bestellung.KundenID
GROUP BY Kunde.KundenID
ORDER BY AnzahlBestellungen DESC;

# Eigene Aufgabe (Zusatz): Summe der Mehrwertsteuer pro Bestellung berechnen

SELECT b.BestID, SUM(bp.PreisProStueck * mwst.MWSt_Satz / 100) AS 'Mehrwertsteuer'
FROM Bestellung b
JOIN Bestellposition bp ON b.BestID = bp.BestID
JOIN MWSt mwst ON bp.MWStID = mwst.MWStID
GROUP BY b.BestID
ORDER BY b.BestID;