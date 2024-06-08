USE SOS_MyBase2;
select * from ��������

BEGIN TRY
BEGIN TRAN --������ ����� ���������� 
DELETE �������� WHERE �������������_�������� = 1
INSERT INTO �������� VALUES(3, '��������',10);
PRINT '���������� ������ �������'; 
COMMIT TRAN -- �������� ���������� 
END TRY
BEGIN CATCH
PRINT '������: ' + cast(error_number() AS VARCHAR(5)) + ' ' + ERROR_MESSAGE()
IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH;


-------------------------------------

select * from ��������
DECLARE @point varchar(32);
BEGIN TRY
BEGIN TRAN
SET @point = 'p1' SAVE TRAN @point
INSERT �������� VALUES (81, '�����������', 9);
SET @point = 'p2' SAVE TRAN @point
INSERT �������� VALUES (34, '�������������', 7);
COMMIT TRAN;
END TRY
BEGIN CATCH
PRINT '������' + CASE WHEN ERROR_NUMBER() = 2627 AND PATINDEX('%PK_STUDENT', ERROR_MESSAGE()) > 0
THEN '������������ '
ELSE '����������� ������ ' + CAST(ERROR_NUMBER() AS VARCHAR(5)) + ERROR_MESSAGE()
END
IF @@TRANCOUNT > 0
BEGIN
PRINT '����������� �����: ' + @point
ROLLBACK TRAN @point
END
END CATCH


---------------------------------
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-----t1---------
SELECT @@SPID, 'insert ���������' '���������', *
FROM ��������� WHERE �������������_��������� = '4';
SELECT @@SPID, 'update �����������_������' '���������', *
FROM �����������_������ WHERE �������������_��������� = '4';
COMMIT;
-----B�-------
-----t2---------
BEGIN TRANSACTION
SELECT @@SPID
INSERT ��������� VALUES(6, '�����' ,'�������', '����������', 'hhhhhh', 767588, '3 ����');
UPDATE ��������� SET �������������_��������� = '11' WHERE ���� = '11 ���'
-----t1----------
-----t2----------
ROLLBACK;

SELECT * FROM �����������_������;
SELECT * FROM ���������;

-----------------------------------------------
--(��������������� ������)
-- A ---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT * FROM �������� WHERE ������������_�������� = '��������';

SELECT * FROM �������� WHERE ������������_�������� = '��������';
COMMIT;

--- B ---
BEGIN TRANSACTION
-------------------------- t1 --------------------
UPDATE �������� SET ������������_�������� = '�������� �����' WHERE ������������_�������� = '��������'
COMMIT TRAN;

ROLLBACK

select * from ��������
--------------------------------------------
--task6 (��������� ������)

-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT * FROM �������� WHERE ������������_�������� = '�������� �����';
-------------------------- t1 ------------------
-------------------------- t2 -----------------
SELECT COUNT(*) FROM �������� WHERE ������������_�������� = '�������� �����';
ROLLBACK;

--- B ---
BEGIN TRANSACTION
-------------------------- t1 ------------------
UPDATE �������� SET ������������_�������� ='1253asdat' WHERE ������������_�������� = '�������� �����';
COMMIT ;

----------------------------------------------

-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
BEGIN TRANSACTION
SELECT * FROM ��������;
-------------------------- t1 ------------------
-------------------------- t2 -----------------
ROLLBACK;

--- B ---
BEGIN TRANSACTION
INSERT �������� VALUES(78 , '��������' , 3);
COMMIT ;




--------------------------------------
--Task 8 (��������� ����������)
CREATE TABLE #TEMPDB8(A INT, B INT);
INSERT #TEMPDB8 VALUES(1,3);
BEGIN TRAN
INSERT #TEMPDB8 VALUES(999,2)
	BEGIN TRAN
	UPDATE #TEMPDB8 SET A = 1 WHERE B = 2
	COMMIT
IF @@TRANCOUNT > 0 ROLLBACK
SELECT * FROM #TEMPDB8

drop table #TEMPDB8
