USE UNIVER
--������������������ ����������� IF� ELSE �� ������� ������� ������ ���-��� ���� ������ �_UNIVER.
DECLARE @group INT = 4, @avg NUMERIC(5,2)
DECLARE @count INT = (SELECT COUNT(*) FROM STUDENT WHERE IDGROUP = @group)
IF (@count > 5)
BEGIN
SET @avg = (SELECT AVG (CAST (PROGRESS.NOTE AS REAL))
FROM STUDENT JOIN PROGRESS ON STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT)
PRINT '������ 5: '+CAST(@avg AS VARCHAR)
END
ELSE PRINT '������ 5: '+CAST(@count AS VARCHAR)