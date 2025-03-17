USE railDW
GO

-- Wype�nienie tabeli czas
DECLARE @godzina INT;
DECLARE @minuta INT;
DECLARE @poraDnia VARCHAR(10);

SET @godzina = 0;

WHILE @godzina < 24
BEGIN
    SET @minuta = 0;
    WHILE @minuta < 60
    BEGIN
        -- Ustalanie pory dnia na podstawie godziny
        IF @godzina BETWEEN 5 AND 11
            SET @poraDnia = 'rano';
        ELSE IF @godzina = 12
            SET @poraDnia = 'po�udnie';
        ELSE IF @godzina BETWEEN 13 AND 17 
            SET @poraDnia = 'popo�udnie';
        ELSE IF @godzina BETWEEN 18 AND 22
            SET @poraDnia = 'wiecz�r';
        ELSE
            SET @poraDnia = 'noc';

        -- Wstawianie wiersza do tabeli
        INSERT INTO Czas (Godzina, Minuta, PoraDnia)
        VALUES (@godzina, @minuta, @poraDnia);

        SET @minuta = @minuta + 1;
    END
    SET @godzina = @godzina + 1;
END
