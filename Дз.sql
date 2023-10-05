-- 1 
DECLARE @Palindrom NVARCHAR(MAX) = 'дед боб дед' -- нет теперь деда Боба

IF @Palindrom = REVERSE(@Palindrom)
    PRINT 'Это палиндром'
ELSE
    PRINT 'Это не палиндром'



-- 2
DECLARE @String NVARCHAR(MAX) = 'Нажал кабан на кабана и снова кабан'
DECLARE @Search NVARCHAR(MAX) = 'кабан'

DECLARE @Index INT = 1
DECLARE @Count INT = 0

WHILE @Index > 0
BEGIN
    SET @Index = CHARINDEX(@Search, @String, @Index)
    IF @Index > 0
    BEGIN
        SET @Count = @Count + 1
        SET @Index = @Index + LEN(@Search)
    END
END

PRINT @Search + '" встречается = ' + CAST(@Count AS NVARCHAR(10)) + ' раз(a) в строке'



-- 3
DECLARE @str NVARCHAR(50) = 'buy ViAgRA now'
DECLARE @Spam BIT = 0

--CREATE TABLE SpamWords (
--    Word NVARCHAR(50)
--);
--INSERT INTO SpamWords (Word)
--VALUES ('viagra'), ('XXX')

DECLARE @Temp NVARCHAR(MAX) = LOWER(@str)
DECLARE @buf NVARCHAR(1) = ' '
DECLARE @Index_2 INT = 1
DECLARE @End INT
DECLARE @Word NVARCHAR(MAX)

WHILE @Index_2 > 0
BEGIN
    SET @End = CHARINDEX(@buf, @Temp, @Index_2)
    IF @End = 0
        SET @End = LEN(@Temp) + 1
    SET @Word = SUBSTRING(@Temp, @Index_2, @End - @Index_2)

    IF EXISTS (SELECT 1 FROM SpamWords WHERE Word = @Word)
    BEGIN
        SET @Spam = 1
        BREAK
    END
    SET @Index_2 = @End + 1
END

IF @Spam = 1
    PRINT 'Это спам!'
ELSE
    PRINT 'Это не спам'
