USE BuchShop;

INSERT INTO Kunde (Vorname, Nachname, EMail, Adresse) VALUES
('Anna', 'Meier', 'anna.meier@example.com', 'Hauptstr. 1, 12345 Berlin'),
('Tom', 'Schmidt', 'tom.schmidt@example.com', 'Bahnhofstr. 2, 54321 Köln'),
('Laura', 'Fischer', 'laura.fischer@example.com', 'Ringstr. 3, 8001 Zürich'),
('Markus', 'Weber', 'markus.weber@example.com', 'Seestr. 4, 4002 Basel');

INSERT INTO Buch (Titel, Autor, Preis, Lagerbestand) VALUES
('SQL für Einsteiger', 'Max Mustermann', 24.99, 10),
('Datenbanken verstehen', 'Lisa Müller', 34.50, 5),
('MySQL in der Praxis', 'Peter Schmidt', 29.90, 7),
('Farm der Tiere', 'Lisa Müller', 8.90, 2),
('Datenbank-Design', 'Max Mustermann', 39.90, 3),
('Fortgeschrittene SQL-Techniken', 'Max Mustermann', 44.90, 4),
('Programmieren lernen', 'Sabine Keller', 19.90, 6),
('Java für Anfänger', 'Sabine Keller', 22.50, 5);

INSERT INTO MWSt (MWSt_Satz) VALUES
(2.60),
(8.10);

INSERT INTO Bestellung (KundenID, Betrag, BestDatum, LiefDatum) VALUES
(1, 89.87, '2025-05-01', '2025-05-04'),
(1, 59.80, '2025-06-10', '2025-06-12'),
(2, 64.39, '2025-05-02', '2025-05-06'),
(3, 42.40, '2025-05-15', '2025-05-17'),
(4, 67.40, '2025-05-20', '2025-05-25');

INSERT INTO Bestellposition (BestID, BuchID, MWStID, Menge, PreisProStueck, Rabatt) VALUES
(1, 1, 1, 2, 24.99, 0.00),
(1, 3, 2, 1, 29.90, 5.00),
(2, 5, 1, 1, 39.90, 0.00),
(2, 8, 2, 1, 22.50, 2.00),
(3, 2, 2, 2, 34.50, 2.00),
(4, 4, 1, 3, 8.90, 0.00),
(4, 7, 2, 1, 19.90, 0.00),
(5, 6, 1, 1, 44.90, 0.00),
(5, 1, 1, 1, 24.99, 0.00);