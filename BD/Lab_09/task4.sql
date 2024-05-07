USE UNIVER;

-- преобразование полного ФИО сту-дента в сокращенное (например, Макей-чик Татьяна Леонидовна в Макейчик Т. Л.);
-- поиск студентов, у которых день рождения в следующем месяце, и опре-деление их возраста;
-- поиск дня недели, в который сту-денты некоторой группы сдавали экза-мен по БД.

DECLARE @t int = 6, @x float = 5.6, @z float;

IF(@t > @x) 
SET @z = POWER(SIN(@t),2);
IF(@t < @x) 
SET @z = 4 * (@t + @x);
IF(@t = @x)
SET @z = 1 - EXP(@x -2);

PRINT 'Z= ' + CAST (@z AS VARCHAR(10));

USE UNIVER
DECLARE @fio VARCHAR(100) = (SELECT TOP(1) STUDENT.NAME FROM STUDENT)
PRINT 'ФИО:' + @fio
DECLARE @shortFIO VARCHAR(100) = SUBSTRING(@fio, 0, CHARINDEX(' ', @fio) + 1) 
+ SUBSTRING(@fio, CHARINDEX(' ', @fio) + 1, 1) + '. '
+ SUBSTRING(@fio, CHARINDEX(' ', @fio, CHARINDEX(' ', @fio) + 1) + 1, 1) + '.'
PRINT 'СОКРАЩЕННОЕ:' + @shortFIO

USE UNIVER
SELECT NAME,BDAY, 2024-YEAR(BDAY) [YEAR]	
FROM STUDENT 
WHERE MONTH(BDAY)=MONTH(GETDATE())+1


SELECT *
FROM (SELECT *,
(CASE
WHEN datepart(WEEKDAY, PDATE) = 1 then 'Понедельник'
WHEN datepart(WEEKDAY, PDATE) = 2 then 'Вторник'
WHEN datepart(WEEKDAY, PDATE) = 3 then 'Среда'
WHEN datepart(WEEKDAY, PDATE) = 4 then 'Четверг'
WHEN datepart(WEEKDAY, PDATE) = 5 then 'Пятница'
WHEN datepart(WEEKDAY, PDATE) = 6 then 'Суббота'
WHEN datepart(WEEKDAY, PDATE) = 7 then 'Воскресенье'
end) День_недели
FROM PROGRESS
WHERE SUBJECT LIKE '%СУБД%') as tr;