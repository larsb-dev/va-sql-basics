Untenstehenden Aufgaben liegt folgendes Datenschema (Tabellen) zugrunde:

- Kunde (KundenID, Vorname, Nachname, EMail, Adresse)
- Buch (BuchID, Titel, Autor, Preis, Lagerbestand)
- Bestellung (BestID, KundenID, Betrag, Rabatt, MWSt, BestDatum, LiefDatum)
- Bestellposition (BestellPosID, BestID, BuchID, MWStID, Menge, PreisProStueck, Rabatt)
- MWSt (MWStID, MWSt_Satz)

Für die Syntax von SQL gilt der Standard in MySQL v8.x

---

## Warum braucht Bestellung auch ein Feld MWSt?

Bestellung (BestID, KundenID, Betrag, Rabatt, MWSt, BestDatum, LiefDatum)

Das Feld MWSt in der Tabelle Bestellung ist vermutlich überflüssig – zumindest dann, wenn die Steuer nicht einheitlich für die ganze Bestellung ist.
Es wäre besser, den Steueranteil aus den Positionen zu berechnen.

Ein Kunde kann in einer Bestellung mehrere Bestellpositionen mit verschiedenen Mehrwertsteuersätzen bestellen.

Die genaue MWSt pro Artikel ist bereits in der Tabelle Bestellposition enthalten (MWStID verweist auf MWSt).
Dort gehört sie auch hin, weil die Steuer positionsabhängig ist.
