USE master
CREATE DATABASE PolaczeniaKolejowe collate Latin1_General_CI_AS;
GO
USE PolaczeniaKolejowe;
GO
CREATE TABLE Polaczenie (
    PolaczenieID INT PRIMARY KEY,  -- PK - ID
    NazwaPolaczenia VARCHAR(30)     -- Nazwa po��czenia np. Gda�sk -> Warszawa
);

CREATE TABLE Przystanek (
    PrzystanekID INT PRIMARY KEY,   -- PK - ID
    PolaczenieID INT,               -- FK - Po��czenie (powi�zanie z tabel� Po��czenie)
    NazwaPrzystanku VARCHAR(30),    -- Nazwa przystanku
    KolejnoscNaTrasie INT,          -- Kolejno�� przystanku na trasie
    FOREIGN KEY (PolaczenieID) REFERENCES Polaczenie(PolaczenieID)
);

CREATE TABLE Kurs (
    KursID INT PRIMARY KEY,         -- PK - ID
    Data DATE,                  -- Dzie� i godzina odjazdu ze stacji pocz�tkowej
    PociagID INT,                   -- ID poci�gu (z danych z pliku)
    PolaczenieID INT,               -- FK - Po��czenie (powi�zanie z tabel� Po��czenie)
    FOREIGN KEY (PolaczenieID) REFERENCES Polaczenie(PolaczenieID)
);

CREATE TABLE Bilet (
    BiletID INT PRIMARY KEY,        -- PK - ID
    PrzystanekPoczID INT,           -- FK - Przystanek pocz�tkowy
    PrzystanekKonID INT,            -- FK - Przystanek ko�cowy
    TypWagonu VARCHAR(30),          -- Typ wagonu (np. przedzia�owe, bezprzedzia�owe)
	KursID INT,                     -- FK - Kurs
    FOREIGN KEY (KursID) REFERENCES Kurs(KursID),
    FOREIGN KEY (PrzystanekPoczID) REFERENCES Przystanek(PrzystanekID),
    FOREIGN KEY (PrzystanekKonID) REFERENCES Przystanek(PrzystanekID)
);

-- Tabela CzasPrzejazdu
CREATE TABLE CzasPrzejazdu (
    KursID INT,                     -- FK - Kurs
    Data DATE,                  -- Data (dzie� kursu)
    PrzystanekID INT,               -- FK - Przystanek
    GodzinaPrzyjazdu TIME,      -- Godzina przyjazdu na przystanek
    GodzinaOdjazdu TIME,        -- Godzina odjazdu z przystanku
    PRIMARY KEY (KursID, PrzystanekID),  -- PK - Klucz z�o�ony
    FOREIGN KEY (KursID) REFERENCES Kurs(KursID),
    FOREIGN KEY (PrzystanekID) REFERENCES Przystanek(PrzystanekID)
);
