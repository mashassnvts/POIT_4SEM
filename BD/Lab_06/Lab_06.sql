USE SOS_MyBase2;

SELECT �����������_������.�������������_��������,
MAX(�����������_������.�������������_��������)[MAX],
MIN(�����������_������.�������������_��������)[MIN],
AVG(�����������_������.�������������_��������)[AVG],
COUNT(*) [COUNT],
SUM(�����������_������.�������������_��������)[SUMMA]
FROM �����������_������
INNER JOIN �������� ON �����������_������.�������������_�������� = ��������.�������������_��������
GROUP  BY �����������_������.�������������_��������



SELECT *
FROM(SELECT CASE 
WHEN �������_��������� BETWEEN 1 AND 2 THEN '1-2'
WHEN �������_��������� BETWEEN 3 AND 4 THEN '3-4'
WHEN �������_��������� BETWEEN 5 AND 6 THEN '5-6'
WHEN �������_��������� BETWEEN 7 AND 9 THEN '7-9'
ELSE '10'
END[���������], COUNT(*)[���-��]
FROM �������� GROUP BY CASE
WHEN �������_��������� BETWEEN 1 AND 2 THEN '1-2'
WHEN �������_��������� BETWEEN 3 AND 4 THEN '3-4'
WHEN �������_��������� BETWEEN 5 AND 6 THEN '5-6'
WHEN �������_��������� BETWEEN 7 AND 9 THEN '7-9'
ELSE '10'
END) AS T
ORDER BY CASE[���������]
WHEN '1-2'THEN 4
WHEN '3-4' THEN 3
WHEN '5-6' THEN 2
WHEN '7-9' THEN 1
ELSE 0
END


SELECT  vr.�������������_�����������_������, vr.�������������_��������,vr.�������������_���������,
ROUND(vr.����������_������� ,2)[���-��]
FROM �����������_������ vr INNER JOIN
(SELECT �������������_��������,
AVG(����������_�������) AS avg_quantity
FROM �����������_������
GROUP BY �������������_��������) AS avg_table ON vr.�������������_�������� = avg_table.�������������_��������
INNER JOIN �������� op ON vr.�������������_�������� = op.�������������_��������
ORDER BY avg_table.avg_quantity DESC;


SELECT  vr.�������������_�����������_������, vr.�������������_��������,vr.�������������_���������,
ROUND(vr.����������_������� ,2)[���-��]
FROM �����������_������ vr INNER JOIN
(SELECT �������������_��������,
 AVG(CAST(����������_������� AS FLOAT)) AS avg_quantity
FROM �����������_������
GROUP BY �������������_��������) AS avg_table ON vr.�������������_�������� = avg_table.�������������_��������
INNER JOIN �������� op ON vr.�������������_�������� = op.�������������_��������
WHERE CAST(vr.����������_������� AS FLOAT) > 17
ORDER BY avg_table.avg_quantity DESC;


SELECT  vr.�������������_�����������_������, vr.�������������_��������,vr.�������������_���������,
ROUND(vr.����������_������� ,2)[���-��]
FROM �����������_������ vr INNER JOIN
(SELECT �������������_��������,
 AVG(CAST(����������_������� AS FLOAT)) AS avg_quantity
FROM �����������_������ WHERE �����������_������.�������������_�����������_������ = 9
GROUP BY �������������_��������) AS avg_table ON vr.�������������_�������� = avg_table.�������������_��������
INNER JOIN �������� op ON vr.�������������_�������� = op.�������������_��������
WHERE CAST(vr.����������_������� AS FLOAT) > 17
ORDER BY avg_table.avg_quantity DESC;



SELECT r.�������������_���������,r.�������,r.���,r.��������,
SUM(vr.����������_�������) AS �����_����������_�������
FROM �����������_������ vr
INNER JOIN ��������� r ON vr.�������������_��������� = r.�������������_���������
GROUP BY r.�������������_���������, r.�������, r.���, r.��������
HAVING SUM(vr.����������_�������) > 15
ORDER BY �����_����������_������� DESC;
