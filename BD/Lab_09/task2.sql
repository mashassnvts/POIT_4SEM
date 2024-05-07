USE UNIVER;

--Разработать скрипт, в котором опреде-ляется общая вместимость аудиторий.
--Если общая вместимость превышает 200, то вывести количество аудиторий, среднюю вместимость аудиторий, 
--коли-чество аудиторий, вместимость которых меньше средней, и процент таких ауди-торий. 
--Если общая вместимость аудиторий меньше 200, то вывести сообщение о размере общей вместимости.

DECLARE @capacity1 INT,
@capacity2 INT,
@capcity3 INT,
@capcity4 INT;	

SELECT @capacity1= (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM)

IF @capacity1 > 200
BEGIN
SELECT @capacity2 = (SELECT COUNT(*) AS [COUNT OF AUDITORIES] FROM AUDITORIUM),
@capcity3 = (SELECT AVG(AUDITORIUM_CAPACITY) AS [AUDIENCE CAPACITY] FROM AUDITORIUM)
SET @capcity4 = (SELECT COUNT(*) AS [COUNT OF AUDITORIES] FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @capcity3)

SELECT @capacity2 'Количество аудиторий', @capcity3 'Типо вместимость в аудитории', @capcity4 'Вместимость которых меньше средней',
100*(CAST(@capcity4 AS FLOAT) / CAST(@capacity2 AS FLOAT)) '% Процент таких аудиторий'
END 
ELSE PRINT 'S' + CAST(@capacity1 as varchar(10))