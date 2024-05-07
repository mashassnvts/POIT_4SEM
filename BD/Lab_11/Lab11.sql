USE SOS_MyBase2;

DECLARE @operation CHAR(20), @operationt CHAR(300) = '';
DECLARE operCursor CURSOR FOR SELECT ������������_�������� FROM ��������;
OPEN operCursor;
FETCH operCursor INTO @operation;
PRINT '������������ ��������';
WHILE @@FETCH_STATUS = 0
BEGIN
SET @operationt = RTRIM(@operation) + ',' + @operationt;
FETCH operCursor INTO @operationt;
END;
PRINT @operationt;
CLOSE operCursor;
DEALLOCATE operCursor;

--------------------------------------
DECLARE operloc CURSOR LOCAL FOR SELECT ������������_��������, �������������_�������� FROM ��������;
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



DECLARE operglob CURSOR GLOBAL FOR SELECT ������������_��������, �������������_�������� FROM ��������;
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
DECLARE rabcur CURSOR LOCAL STATIC FOR SELECT ������� FROM ���������;
OPEN rabcur;
INSERT INTO ��������� VALUES (9, '��������', '������', '���������', '���������', 879685, '1 ���');
FETCH rabcur INTO @rab;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @rab
FETCH rabcur INTO @rab;
END
DELETE FROM ��������� WHERE ������� = '��������';
GO



DECLARE @rab char(10);
DECLARE rabcur CURSOR LOCAL DYNAMIC FOR SELECT ������� FROM ���������;
OPEN rabcur;
INSERT INTO ��������� VALUES (9, '��������', '������', '���������', '���������', 879685, '1 ���');
FETCH rabcur INTO @rab;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @rab
FETCH rabcur INTO @rab;
END
DELETE FROM ��������� WHERE ������� = '��������';
GO

----------------------------------------
DECLARE @name VARCHAR(50);
DECLARE scrollCursor CURSOR SCROLL FOR
SELECT ������� FROM ���������;
OPEN scrollCursor;
FETCH FIRST FROM scrollCursor INTO @name;
PRINT '������ ������: ' + @name;

FETCH LAST FROM scrollCursor INTO @name;
PRINT '��������� ������: ' + @name;

FETCH NEXT FROM scrollCursor INTO @name;
PRINT '���������: ' + @name;

FETCH PRIOR FROM scrollCursor INTO @name;
PRINT '���������� ������: ' + @name;
FETCH ABSOLUTE 2 FROM scrollCursor INTO @name;
PRINT '�� 2 ������ ������: ' + @name;
FETCH RELATIVE -9 FROM scrollCursor INTO @name;
PRINT '�� -3 ������ �����: ' + @name;
CLOSE scrollCursor;
DEALLOCATE scrollCursor;

-------------------------------------
DECLARE @id char(40);
DECLARE curs CURSOR FOR
SELECT ������� FROM ���������;
OPEN curs;
FETCH NEXT FROM curs INTO @id;

UPDATE ��������� SET ������� = '������������' WHERE CURRENT OF curs;

CLOSE curs;
DEALLOCATE curs;

------------------------------------
DECLARE @rabId INT;
DECLARE operacur CURSOR FOR SELECT r.�������������_��������� FROM ��������� r
INNER JOIN �����������_������ d ON r.�������������_��������� = d.�������������_���������
INNER JOIN �������� o  ON d.�������������_�������� = o.�������������_��������
WHERE r.�������������_��������� > 8;
OPEN operacur ;
FETCH NEXT FROM operacur  INTO @rabId;
WHILE @@FETCH_STATUS = 0
BEGIN
DELETE FROM ��������� WHERE �������������_��������� = @rabId;
FETCH NEXT FROM operacur  INTO @rabId;
END;
CLOSE operacur ;
DEALLOCATE operacur 

select * from ��������� r

-------------------------------------
DECLARE @rabotId int
DECLARE rabotncur CURSOR FOR
SELECT �������������_�������� FROM �������� WHERE �������������_�������� = 4;
OPEN rabotncur;
WHILE @@FETCH_STATUS = 0
BEGIN
UPDATE �������� SET �������������_�������� = �������������_�������� + 1 WHERE �������������_�������� = @rabotId;
FETCH NEXT FROM rabotncur INTO @rabotId;
FETCH NEXT FROM rabotncur INTO @rabotId;
END;
CLOSE rabotncur;
DEALLOCATE rabotncur;

select * from ��������