USE SOS_MyBase2;

SELECT Выполненная_работа.Идентификатор_операции,
MAX(Выполненная_работа.Идентификатор_операции)[MAX],
MIN(Выполненная_работа.Идентификатор_операции)[MIN],
AVG(Выполненная_работа.Идентификатор_операции)[AVG],
COUNT(*) [COUNT],
SUM(Выполненная_работа.Идентификатор_операции)[SUMMA]
FROM Выполненная_работа
INNER JOIN Операции ON Выполненная_работа.Идентификатор_операции = Операции.Идентификатор_операции
GROUP  BY Выполненная_работа.Идентификатор_операции



SELECT *
FROM(SELECT CASE 
WHEN Признак_сложности BETWEEN 1 AND 2 THEN '1-2'
WHEN Признак_сложности BETWEEN 3 AND 4 THEN '3-4'
WHEN Признак_сложности BETWEEN 5 AND 6 THEN '5-6'
WHEN Признак_сложности BETWEEN 7 AND 9 THEN '7-9'
ELSE '10'
END[Сложность], COUNT(*)[Кол-во]
FROM Операции GROUP BY CASE
WHEN Признак_сложности BETWEEN 1 AND 2 THEN '1-2'
WHEN Признак_сложности BETWEEN 3 AND 4 THEN '3-4'
WHEN Признак_сложности BETWEEN 5 AND 6 THEN '5-6'
WHEN Признак_сложности BETWEEN 7 AND 9 THEN '7-9'
ELSE '10'
END) AS T
ORDER BY CASE[Сложность]
WHEN '1-2'THEN 4
WHEN '3-4' THEN 3
WHEN '5-6' THEN 2
WHEN '7-9' THEN 1
ELSE 0
END


SELECT  vr.Идентификатор_выполненной_работы, vr.Идентификатор_операции,vr.Идентификатор_работника,
ROUND(vr.Количество_деталей ,2)[Кол-во]
FROM Выполненная_работа vr INNER JOIN
(SELECT Идентификатор_операции,
AVG(Количество_деталей) AS avg_quantity
FROM Выполненная_работа
GROUP BY Идентификатор_операции) AS avg_table ON vr.Идентификатор_операции = avg_table.Идентификатор_операции
INNER JOIN Операции op ON vr.Идентификатор_операции = op.Идентификатор_операции
ORDER BY avg_table.avg_quantity DESC;


SELECT  vr.Идентификатор_выполненной_работы, vr.Идентификатор_операции,vr.Идентификатор_работника,
ROUND(vr.Количество_деталей ,2)[Кол-во]
FROM Выполненная_работа vr INNER JOIN
(SELECT Идентификатор_операции,
 AVG(CAST(Количество_деталей AS FLOAT)) AS avg_quantity
FROM Выполненная_работа
GROUP BY Идентификатор_операции) AS avg_table ON vr.Идентификатор_операции = avg_table.Идентификатор_операции
INNER JOIN Операции op ON vr.Идентификатор_операции = op.Идентификатор_операции
WHERE CAST(vr.Количество_деталей AS FLOAT) > 17
ORDER BY avg_table.avg_quantity DESC;


SELECT  vr.Идентификатор_выполненной_работы, vr.Идентификатор_операции,vr.Идентификатор_работника,
ROUND(vr.Количество_деталей ,2)[Кол-во]
FROM Выполненная_работа vr INNER JOIN
(SELECT Идентификатор_операции,
 AVG(CAST(Количество_деталей AS FLOAT)) AS avg_quantity
FROM Выполненная_работа WHERE Выполненная_работа.Идентификатор_выполненной_работы = 9
GROUP BY Идентификатор_операции) AS avg_table ON vr.Идентификатор_операции = avg_table.Идентификатор_операции
INNER JOIN Операции op ON vr.Идентификатор_операции = op.Идентификатор_операции
WHERE CAST(vr.Количество_деталей AS FLOAT) > 17
ORDER BY avg_table.avg_quantity DESC;



SELECT r.Идентификатор_работника,r.Фамилия,r.Имя,r.Отчество,
SUM(vr.Количество_деталей) AS Общее_количество_деталей
FROM Выполненная_работа vr
INNER JOIN Работники r ON vr.Идентификатор_работника = r.Идентификатор_работника
GROUP BY r.Идентификатор_работника, r.Фамилия, r.Имя, r.Отчество
HAVING SUM(vr.Количество_деталей) > 15
ORDER BY Общее_количество_деталей DESC;
