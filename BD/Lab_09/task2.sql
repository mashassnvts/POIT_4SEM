USE UNIVER;

--����������� ������, � ������� ������-������ ����� ����������� ���������.
--���� ����� ����������� ��������� 200, �� ������� ���������� ���������, ������� ����������� ���������, 
--����-������ ���������, ����������� ������� ������ �������, � ������� ����� ����-�����. 
--���� ����� ����������� ��������� ������ 200, �� ������� ��������� � ������� ����� �����������.

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

SELECT @capacity2 '���������� ���������', @capcity3 '���� ����������� � ���������', @capcity4 '����������� ������� ������ �������',
100*(CAST(@capcity4 AS FLOAT) / CAST(@capacity2 AS FLOAT)) '% ������� ����� ���������'
END 
ELSE PRINT 'S' + CAST(@capacity1 as varchar(10))