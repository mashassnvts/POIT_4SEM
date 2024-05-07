USE UNIVER;

--Разработать сценарий, формирующий список дисциплин на кафедре ИСиТ. В отчет должны быть выведены краткие названия дисциплин из таблицы SUBJECT в одну строку через запятую. 
--Использовать встроенную функцию RTRIM.

DECLARE @subj CHAR(20), @subjt CHAR(300) = '';
DECLARE subjCursor CURSOR FOR SELECT SUBJECT_NAME FROM SUBJECT;
OPEN subjCursor;
FETCH subjCursor INTO @subj;
PRINT 'Список дисциплин';
WHILE @@FETCH_STATUS = 0
BEGIN
SET @subjt = RTRIM(@subj) + ',' + @subjt;
FETCH subjCursor INTO @subjt;
END;
PRINT @subjt;
CLOSE subjCursor;
DEALLOCATE subjCursor;



---------------------------------
DECLARE curloc CURSOR LOCAL FOR SELECT SUBJECT_NAME, PULPIT FROM SUBJECT;
DECLARE @subjp CHAR(50), @pulpit CHAR(50);
OPEN curloc;
FETCH curloc INTO @subjp, @pulpit;
PRINT '1. ' + @subjp + @pulpit;
GO
DECLARE @subjp CHAR(50), @pulpit CHAR(50);
FETCH curloc INTO @subjp, @pulpit;
PRINT '2. ' + @subjp + @pulpit;
GO
CLOSE curloc;



DECLARE curglob CURSOR GLOBAL FOR SELECT SUBJECT_NAME, PULPIT FROM SUBJECT;
DECLARE @subjp CHAR(50), @pulpit CHAR(50);
OPEN curglob;
FETCH curglob INTO @subjp, @pulpit
PRINT '1. ' + @subjp + @pulpit;
GO
DECLARE @subjp CHAR(50), @pulpit CHAR(50);
FETCH curglob INTO @subjp, @pulpit
PRINT '2. ' + @subjp + @pulpit;

CLOSE curglob;
DEALLOCATE curglob;



---------------------------------
DECLARE @auditorium char(10);
DECLARE audcur CURSOR LOCAL STATIC FOR SELECT AUDITORIUM FROM AUDITORIUM;
OPEN audcur;
INSERT INTO AUDITORIUM VALUES ('200-3a', 'ЛК-К', 200, '200-3a');
FETCH audcur INTO @auditorium;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @auditorium
FETCH audcur INTO @auditorium;
END
DELETE FROM AUDITORIUM WHERE AUDITORIUM = '200-3a';
GO



DECLARE @auditorium CHAR(10);
DECLARE audcur CURSOR LOCAL DYNAMIC FOR SELECT AUDITORIUM FROM AUDITORIUM;
OPEN audcur;
INSERT INTO AUDITORIUM VALUES ('200-3a', 'ЛК-К', 200, '200-3a');
FETCH audcur INTO @auditorium;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @auditorium
FETCH audcur INTO @auditorium;
END
DELETE FROM AUDITORIUM WHERE AUDITORIUM = '200-3a';
GO



-------------------------------------------
DECLARE @name VARCHAR(50);
DECLARE scrollCursor CURSOR SCROLL FOR
SELECT NAME FROM STUDENT;
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



-----------------------------------------
DECLARE @id char(40);
DECLARE curs CURSOR FOR
SELECT NAME FROM STUDENT;
OPEN curs;
FETCH NEXT FROM curs INTO @id;
UPDATE STUDENT SET NAME = 'Нерошени1ии Нин Леонидовна' WHERE CURRENT OF curs;
CLOSE curs;
DEALLOCATE curs;



-----------------------
DECLARE @studId INT;
DECLARE studcur CURSOR FOR SELECT p.IDSTUDENT FROM PROGRESS p
INNER JOIN STUDENT s ON p.IDSTUDENT = s.IDSTUDENT
INNER JOIN GROUPS g  ON s.IDSTUDENT = g.IDGROUP
WHERE p.NOTE < 5
OPEN studcur;
FETCH NEXT FROM studcur INTO @studId;
WHILE @@FETCH_STATUS = 0
BEGIN

FETCH NEXT FROM studcur INTO @studId;
DELETE FROM PROGRESS WHERE IDSTUDENT = @studId;
END;
CLOSE studcur;
DEALLOCATE studcur

SELECT * FROM PROGRESS p




----------------------------------------
DECLARE @studntId int
DECLARE studcur CURSOR FOR
SELECT IDSTUDENT FROM PROGRESS WHERE IDSTUDENT = 1003;
OPEN studcur;
FETCH NEXT FROM studcur INTO @studntId;
WHILE @@FETCH_STATUS = 0
BEGIN
UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE IDSTUDENT = @studntId;
FETCH NEXT FROM studcur INTO @studntId;
END;
CLOSE studcur;
DEALLOCATE studcur;

SELECT * FROM PROGRESS


