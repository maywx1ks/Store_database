--CREATE DATABASE SklepInternetowy_Elsez_Project;
--GO
USE SklepInternetowy_Elsez_Project;
GO


---- 1. Klienci
--CREATE TABLE Klienci (
--    KlientID INT IDENTITY PRIMARY KEY,
--    Imie NVARCHAR(50),
--    Nazwisko NVARCHAR(50),
--    Email NVARCHAR(100) UNIQUE,
--    Telefon NVARCHAR(20),
--    DataRejestracji DATE
--);

---- 2. Adresy
--CREATE TABLE Adresy (
--    AdresID INT IDENTITY PRIMARY KEY,
--    KlientID INT,
--    Ulica NVARCHAR(100),
--    Miasto NVARCHAR(50),
--    KodPocztowy NVARCHAR(10),
--    Kraj NVARCHAR(50),
--    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
--);

---- 3. Kategorie
--CREATE TABLE Kategorie (
--    KategoriaID INT IDENTITY PRIMARY KEY,
--    Nazwa NVARCHAR(50),
--    Opis NVARCHAR(200)
--);

---- 4. Producenci
--CREATE TABLE Producenci (
--    ProducentID INT IDENTITY PRIMARY KEY,
--    Nazwa NVARCHAR(100),
--    Kraj NVARCHAR(50)
--);

---- 5. Produkty
--CREATE TABLE Produkty (
--    ProduktID INT IDENTITY PRIMARY KEY,
--    Nazwa NVARCHAR(100),
--    Opis NVARCHAR(300),
--    Cena DECIMAL(10,2),
--    StanMagazynu INT,
--    KategoriaID INT,
--    ProducentID INT,
--    FOREIGN KEY (KategoriaID) REFERENCES Kategorie(KategoriaID),
--    FOREIGN KEY (ProducentID) REFERENCES Producenci(ProducentID)
--);

---- 6. StatusZamowienia
--CREATE TABLE StatusZamowienia (
--    StatusID INT IDENTITY PRIMARY KEY,
--    Nazwa NVARCHAR(50),
--    Opis NVARCHAR(200)
--);

---- 7. Zamowienia
--CREATE TABLE Zamowienia (
--    ZamowienieID INT IDENTITY PRIMARY KEY,
--    KlientID INT,
--    AdresID INT,
--    DataZamowienia DATETIME,
--    StatusID INT,
--    SposobDostawy NVARCHAR(50),
--    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
--    FOREIGN KEY (AdresID) REFERENCES Adresy(AdresID),
--    FOREIGN KEY (StatusID) REFERENCES StatusZamowienia(StatusID)
--);

---- 8. PozycjeZamowienia
--CREATE TABLE PozycjeZamowienia (
--    PozycjaID INT IDENTITY PRIMARY KEY,
--    ZamowienieID INT,
--    ProduktID INT,
--    Ilosc INT,
--    CenaSztuki DECIMAL(10,2),
--    FOREIGN KEY (ZamowienieID) REFERENCES Zamowienia(ZamowienieID),
--    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
--);

---- 9. Platnosci
--CREATE TABLE Platnosci (
--    PlatnoscID INT IDENTITY PRIMARY KEY,
--    ZamowienieID INT,
--    Metoda NVARCHAR(50),
--    Kwota DECIMAL(10,2),
--    DataPlatnosci DATETIME,
--    StatusPlatnosci NVARCHAR(50),
--    FOREIGN KEY (ZamowienieID) REFERENCES Zamowienia(ZamowienieID)
--);

---- 10. Dostawy
--CREATE TABLE Dostawy (
--    DostawaID INT IDENTITY PRIMARY KEY,
--    ZamowienieID INT,
--    FirmaKurierska NVARCHAR(50),
--    NumerSledzenia NVARCHAR(50),
--    StatusDostawy NVARCHAR(50),
--    FOREIGN KEY (ZamowienieID) REFERENCES Zamowienia(ZamowienieID)
--);

---- 11. Koszyki
--CREATE TABLE Koszyki (
--    KoszykID INT IDENTITY PRIMARY KEY,
--    KlientID INT,
--    DataUtworzenia DATETIME,
--    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
--);

---- 12. KoszykPozycje
--CREATE TABLE KoszykPozycje (
--    PozycjaID INT IDENTITY PRIMARY KEY,
--    KoszykID INT,
--    ProduktID INT,
--    Ilosc INT,
--    FOREIGN KEY (KoszykID) REFERENCES Koszyki(KoszykID),
--    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
--);

-- Klienci
--INSERT INTO Klienci (Imie, Nazwisko, Email, Telefon, DataRejestracji)
--VALUES
--('Anna', 'Kwiatkowska', 'anna@test.pl', '500700800', GETDATE()),
--('Jan', 'Nowak', 'jan@test.pl', '600500400', GETDATE());

---- Kategorie
--INSERT INTO Kategorie (Nazwa, Opis)
--VALUES ('Laptopy', 'Komputery przenoœne'), ('Smartfony', 'Telefony komórkowe');

---- Producenci
--INSERT INTO Producenci (Nazwa, Kraj)
--VALUES ('Lenovo', 'Chiny'), ('Samsung', 'Korea');

---- Produkty
--INSERT INTO Produkty (Nazwa, Opis, Cena, StanMagazynu, KategoriaID, ProducentID)
--VALUES 
--('Laptop Lenovo X1', 'Ultrabook 14 cali', 4200, 10, 1, 1),
--('Samsung Galaxy S22', 'Smartfon 128 GB', 3500, 15, 2, 2);

---- Statusy zamówieñ
--INSERT INTO StatusZamowienia (Nazwa, Opis)
--VALUES ('Nowe', 'Oczekuje na realizacje'), ('Wyslane', 'Paczka wyslana');

---- Adres
--INSERT INTO Adresy (KlientID, Ulica, Miasto, KodPocztowy, Kraj)
--VALUES (1, 'Koszykowa 18', 'Warszawa', '00-123', 'Polska');

---- Zamowienie
--INSERT INTO Zamowienia (KlientID, AdresID, DataZamowienia, StatusID, SposobDostawy)
--VALUES (1, 1, GETDATE(), 1, 'Kurier');

---- Pozycje zamowienia
--INSERT INTO PozycjeZamowienia (ZamowienieID, ProduktID, Ilosc, CenaSztuki)
--VALUES (1, 1, 1, 4200);

--SELECT * FROM Klienci;
--SELECT * FROM Produkty;
--SELECT * FROM Zamowienia;

--SELECT 
--    z.ZamowienieID,
--    k.Imie,
--    k.Nazwisko,
--    p.Nazwa AS Produkt,
--    pz.Ilosc,
--    pz.CenaSztuki
--FROM Zamowienia z
--JOIN Klienci k ON z.KlientID = k.KlientID
--JOIN PozycjeZamowienia pz ON pz.ZamowienieID = z.ZamowienieID
--JOIN Produkty p ON p.ProduktID = pz.ProduktID;




SELECT * FROM Klienci;
SELECT * FROM Produkty;
SELECT * FROM Zamowienia;