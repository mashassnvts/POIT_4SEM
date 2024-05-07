USE UNIVER;

--Определить все индексы, которые имеются в БД UNIVER. 
--Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать кластеризованный индекс, уменьшающий стоимость SELECT-запроса.


EXEC sp_helpindex 'AUDITORIUM'
EXEC sp_helpindex 'AUDITORIUM_TYPE'
EXEC sp_helpindex 'PULPIT'
EXEC sp_helpindex 'SUBJECT'

CREATE TABLE #tempTable(
SOME_IND INT,
SOME_FIELD VARCHAR(20)
);

--DROP TABLE #tempTable

CHECKPOINT; --фиксация бд

DBCC DROPCLEANBUFFERS; --очистить буферный кэш

SET NOCOUNT ON
DECLARE @i INT = 0
WHILE @i < 2000
BEGIN
INSERT INTO #tempTable(SOME_IND,SOME_FIELD) VALUES (@i, REPLICATE('test', 3));
SET @i += 1
END;

SELECT * FROM #tempTable

SELECT * FROM #tempTable WHERE SOME_IND BETWEEN 1500 AND 2000 ORDER BY SOME_IND

CREATE CLUSTERED INDEX #EXPLRE_CL ON #tempTable(SOME_FIELD ASC);

DROP INDEX #EXPLRE_CL ON #tempTable

---------------------------------------------

--Создать временную локальную таб-лицу. Заполнить ее данными (10000 строк или больше). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный не-уникальный составной индекс. 
--Оценить процедуры поиска ин-формации.


CREATE TABLE #secondTable(
TKEY INT, 
CC INT IDENTITY(1,1),
TF VARCHAR(100)
);

--DROP TABLE #secondTable

SET NOCOUNT ON;
DECLARE @j INT = 0;
WHILE @j < 10000
BEGIN
INSERT #secondTable(TKEY, TF) VALUES (FLOOR(30000 * RAND()), REPLICATE('TEST ', 10));
SET @j = @j + 1;
END;
SELECT * FROM #secondTable

CREATE INDEX #EX_NONCLU ON #secondTable(TKEY, CC);

SELECT * FROM #secondTable WHERE TKEY > 1500 AND CC < 4500
SELECT * FROM #secondTable ORDER BY TKEY, CC;

SELECT * FROM #secondTable WHERE TKEY = 556 AND CC > 3;
	
--------------------------------------------------------------

--Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 10000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный ин-декс покрытия, уменьшающий сто-имость SELECT-запроса. 


CREATE TABLE #trirdTable(
TKEY INT,
CC INT IDENTITY(1,1),
TF VARCHAR(100)
);
--DROP TABLE #trirdTable
SET NOCOUNT ON;

DECLARE @k INT = 0;
WHILE @k < 20000
BEGIN
INSERT #trirdTable(TKEY, TF) VALUES(FLOOR(30000 * RAND()), REPLICATE('TEST', 10));
SET @k = @k + 1;
END;

SELECT * FROM #trirdTable;

CREATE  index #trirdTable_TKEY_X on #trirdTable(TKEY) INCLUDE (CC)
--drop  index #trirdTable_TKEY_X on #trirdTable
SELECT CC, TKEY FROM #trirdTable WHERE TKEY > 15000;


-----------------------------------------------------------

--Создать и заполнить временную ло-кальную таблицу. 
--Разработать SELECT-запрос, по-лучить план запроса и определить его стоимость. 
--Создать некластеризованный фильтруемый индекс, уменьшаю-щий стоимость SELECT-запроса.


CREATE TABLE #fourthTable(
TKEY INT,
CC INT IDENTITY(1,1),
TF VARCHAR(100)
);
SET NOCOUNT ON;

DECLARE @n INT = 0;
WHILE @n < 20000
BEGIN
INSERT #fourthTable(TKEY, TF) VALUES(FLOOR(30000 * RAND()), REPLICATE('TEST', 10));
SET @n = @n + 1;
END;

SELECT * FROM #fourthTable

SELECT TKEY FROM #fourthTable WHERE TKEY BETWEEN 5000 AND 19999
SELECT TKEY FROM #fourthTable WHERE TKEY > 15000 AND TKEY < 20000
SELECT TKEY FROM #fourthTable WHERE TKEY = 1700

CREATE INDEX #fourthTable_Where on #fourthTable(TKEY) WHERE (TKEY>= 15000 AND TKEY < 20000);


-----------------------------------------------------------------

--Заполнить временную локальную таблицу. 
--Создать некластеризованный ин-декс. Оценить уровень фрагмента-ции индекса. 
--Разработать сценарий на T-SQL, выполнение которого приводит к уровню фрагментации индекса выше 90%. 
--Оценить уровень фрагментации индекса. 
--Выполнить процедуру реоргани-зации индекса, оценить уровень фрагментации. 
--Выполнить процедуру пере-стройки индекса и оценить уровень фрагментации индекса.


use tempdb;
CREATE TABLE #fifth_table(
TKEY INT,
CC INT IDENTITY(1,1),
TF VARCHAR(100)
);
SET NOCOUNT ON;
DECLARE @w INT = 0;
WHILE @w < 1000
BEGIN
INSERT #fifth_table (TKEY, TF) VALUES(FLOOR(30000 * RAND()), REPLICATE('TEST', 10));
SET @w = @w + 1;
END;
--DROP TABLE #fifth_table

SELECT *FROM #fifth_table

CREATE INDEX #fifth_tableE ON #fifth_table(TKEY);
--DROP INDEX #fifth_table ON #fifth_tableE 

INSERT TOP(10000) #fifth_table(TKEY, TF) SELECT TKEY, TF FROM #fifth_table;


SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_ID(N'#fifth_table'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;

ALTER INDEX #fifth_tableE ON #fifth_table reorganize

ALTER INDEX  #fifth_tableE ON #fifth_table rebuild with (online = off)

drop index #fifth_tableE on #fifth_table


--------------------------------------------

--Разработать пример, демонстриру-ющий применение параметра FILL-FACTOR при создании некластери-зованного индекса.

CREATE TABLE #sixth_table(
TKEY INT,
CC INT IDENTITY(1,1),
TF VARCHAR(100)
);

DECLARE @g INT = 1;
WHILE @g < 15009
BEGIN
INSERT #sixth_table(TKEY, TF) VALUES(FLOOR(30000 * RAND()), REPLICATE('TEST', 10));
SET @g = @g+ 1;
END

SELECT * FROM #sixth_table

CREATE INDEX #sixth_id ON #sixth_table(TKEY) WITH (FILLFACTOR = 65);

INSERT TOP(5000) #sixth_table(TKEY,TF)
SELECT TKEY, TF
FROM #sixth_table;


SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N' #sixth_table'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null;


