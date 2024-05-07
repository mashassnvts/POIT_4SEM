USE SOS_MyBase2;

EXEC sp_helpindex 'Операции'
EXEC sp_helpindex 'Работники'
EXEC sp_helpindex 'Выполненная_работа'

USE SOS_MyBase2;
SELECT * FROM Выполненная_работа

CREATE INDEX #indd ON Выполненная_работа(Количество_деталей asc)
--DROP INDEX #indd ON Выполненная_работа

SELECT Идентификатор_выполненной_работы, Идентификатор_работника, Количество_деталей FROM Выполненная_работа WHERE Количество_деталей BETWEEN 11 AND 22 ORDER BY Количество_деталей

CHECKPOINT;
DBCC DROPCLEANBUFFERS;


----------------------------------------------------------
USE SOS_MyBase2;
CREATE INDEX #ind1 ON Выполненная_работа (Количество_деталей, Идентификатор_работника)
--DROP INDEX #ind1 ON Выполненная_работа

SELECT Идентификатор_выполненной_работы, Идентификатор_работника, Количество_деталей FROM Выполненная_работа WHERE Количество_деталей BETWEEN 11 AND 22 ORDER BY Количество_деталей

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

------------------------------------
CREATE INDEX #ind2 ON Выполненная_работа (Количество_деталей) INCLUDE (Идентификатор_выполненной_работы)
DROP INDEX #ind2 ON Выполненная_работа
SELECT*FROM Выполненная_работа WHERE Количество_деталей BETWEEN 11 AND 22 ORDER BY Количество_деталей

CHECKPOINT;
DBCC DROPCLEANBUFFERS;


-----------------------------------
CREATE INDEX #ind3 ON Выполненная_работа(Количество_деталей) WHERE (Количество_деталей >= 11 AND Количество_деталей <=22)
DROP INDEX #ind3 ON Выполненная_работа

-----------------------------------
SELECT * FROM Выполненная_работа WHERE Количество_деталей BETWEEN 11 AND 22 ORDER BY Количество_деталей

