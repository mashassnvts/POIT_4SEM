USE SOS_MyBase2;

DECLARE @operation CHAR(20), @operationt CHAR(300) = '';
DECLARE operCursor CURSOR FOR SELECT Наименование_операции FROM Операции;
OPEN operCursor;
FETCH operCursor INTO @operation;
PRINT 'Наименование операций';
WHILE @@FETCH_STATUS = 0
BEGIN
SET @operationt = RTRIM(@operation) + ',' + @operationt;
FETCH operCursor INTO @operationt;
END;
PRINT @operationt;
CLOSE operCursor;
DEALLOCATE operCursor;

--------------------------------------
DECLARE operloc CURSOR LOCAL FOR SELECT Наименование_операции, Идентификатор_операции FROM Операции;
DECLARE @oper CHAR(50), @iden CHAR(50);
OPEN operloc;
FETCH operloc INTO @oper, @iden;
PRINT '1. ' + @oper + @iden;
GO
DECLARE @oper CHAR(50), @iden CHAR(50);
FETCH operloc INTO @oper, @iden;
PRINT '2. ' + @oper + @iden;
GO
CLOSE operloc;



DECLARE operglob CURSOR GLOBAL FOR SELECT Наименование_операции, Идентификатор_операции FROM Операции;
DECLARE @oper CHAR(50), @iden CHAR(50);
OPEN operglob;
FETCH operglob INTO @oper, @iden
PRINT '1. ' + @oper + @iden;
GO
DECLARE @oper CHAR(50), @iden CHAR(50);
FETCH operglob INTO @oper, @iden
PRINT '2. ' + @oper + @iden;

CLOSE operglob;
DEALLOCATE operglob;

---------------------------------
DECLARE @rab char(10);
DECLARE rabcur CURSOR LOCAL STATIC FOR SELECT Фамилия FROM Работники;
OPEN rabcur;
INSERT INTO Работники VALUES (9, 'Пузирева', 'Аничка', 'Сергеевна', 'Молодечно', 879685, '1 год');
FETCH rabcur INTO @rab;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @rab
FETCH rabcur INTO @rab;
END
DELETE FROM Работники WHERE Фамилия = 'Пузирева';
GO



DECLARE @rab char(10);
DECLARE rabcur CURSOR LOCAL DYNAMIC FOR SELECT Фамилия FROM Работники;
OPEN rabcur;
INSERT INTO Работники VALUES (9, 'Пузирева', 'Аничка', 'Сергеевна', 'Молодечно', 879685, '1 год');
FETCH rabcur INTO @rab;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @rab
FETCH rabcur INTO @rab;
END
DELETE FROM Работники WHERE Фамилия = 'Пузирева';
GO

----------------------------------------
DECLARE @name VARCHAR(50);
DECLARE scrollCursor CURSOR SCROLL FOR
SELECT Фамилия FROM Работники;
OPEN scrollCursor;
FETCH FIRST FROM scrollCursor INTO @name;
PRINT 'Первая запись: ' + @name;

FETCH LAST FROM scrollCursor INTO @name;
PRINT 'Последняя запись: ' + @name;

FETCH NEXT FROM scrollCursor INTO @name;
PRINT 'Следующая: ' + @name;

FETCH PRIOR FROM scrollCursor INTO @name;
PRINT 'Предыдущая запись: ' + @name;
FETCH ABSOLUTE 2 FROM scrollCursor INTO @name;
PRINT 'На 2 записи вперед: ' + @name;
FETCH RELATIVE -9 FROM scrollCursor INTO @name;
PRINT 'На -3 запись назад: ' + @name;
CLOSE scrollCursor;
DEALLOCATE scrollCursor;

-------------------------------------
DECLARE @id char(40);
DECLARE curs CURSOR FOR
SELECT Фамилия FROM Работники;
OPEN curs;
FETCH NEXT FROM curs INTO @id;

UPDATE Работники SET Фамилия = 'Глухаревская' WHERE CURRENT OF curs;

CLOSE curs;
DEALLOCATE curs;

------------------------------------
DECLARE @rabId INT;
DECLARE operacur CURSOR FOR SELECT r.Идентификатор_работника FROM Работники r
INNER JOIN Выполненная_работа d ON r.Идентификатор_работника = d.Идентификатор_работника
INNER JOIN Операции o  ON d.Идентификатор_операции = o.Идентификатор_операции
WHERE r.Идентификатор_работника > 8;
OPEN operacur ;
FETCH NEXT FROM operacur  INTO @rabId;
WHILE @@FETCH_STATUS = 0
BEGIN
DELETE FROM Работники WHERE Идентификатор_работника = @rabId;
FETCH NEXT FROM operacur  INTO @rabId;
END;
CLOSE operacur ;
DEALLOCATE operacur 

select * from Работники r

-------------------------------------
DECLARE @rabotId int
DECLARE rabotncur CURSOR FOR
SELECT Идентификатор_операции FROM Операции WHERE Идентификатор_операции = 4;
OPEN rabotncur;
WHILE @@FETCH_STATUS = 0
BEGIN
UPDATE Операции SET Идентификатор_операции = Идентификатор_операции + 1 WHERE Идентификатор_операции = @rabotId;
FETCH NEXT FROM rabotncur INTO @rabotId;
FETCH NEXT FROM rabotncur INTO @rabotId;
END;
CLOSE rabotncur;
DEALLOCATE rabotncur;

select * from Операции