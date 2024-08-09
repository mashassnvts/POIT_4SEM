USE SOS_MyBase2;

GO
DROP PROCEDURE IF EXISTS POPERATION;
GO

GO
CREATE PROCEDURE POPERATION
AS 
BEGIN
DECLARE @count INT = (SELECT COUNT(*) FROM ��������)
SELECT �������������_�������� AS '�������������', ������������_�������� AS ��������, �������_��������� AS ��������� FROM ��������
RETURN @count
END;


GO 
DECLARE @result INT = 0;
EXEC @result = POPERATION;
PRINT 'RESULT = ' +  CAST(@result AS VARCHAR(3))


--------------------------------
CREATE TABLE #OPERATION (
[SUBJECT] NVARCHAR(20) PRIMARY KEY,
[SUBJECT_NAME] NVARCHAR(MAX),
[PULPIT] NVARCHAR(MAX)
)
--DROP TABLE #OPERATION

GO
ALTER PROCEDURE POPERATION @p NVARCHAR(20)
AS
BEGIN
SELECT * FROM ��������
WHERE ��������.�������_��������� = @p
END
GO

INSERT #OPERATION EXEC POPERATION @p = 2

SELECT * FROM #OPERATION


------------------------------------------
DROP PROCEDURE IF EXISTS PWORK_INSERT;
GO

CREATE PROCEDURE PWORK_INSERT @a NVARCHAR(20), @n NVARCHAR(50), @c INT = 0, @t NVARCHAR(10),@d DATE
AS
BEGIN TRY
INSERT INTO �����������_������ VALUES(@a, @n, @c, @t,@d);
RETURN 1;
END TRY
BEGIN CATCH
PRINT ERROR_MESSAGE();
PRINT ERROR_STATE();
PRINT ERROR_PROCEDURE();
RETURN -1;
END CATCH
GO


DECLARE @result INT;
EXEC @result = PWORK_INSERT @a =4, @n =13, @c =2, @t =23, @d = '2023-12-10'
PRINT @result
SELECT * FROM �����������_������


---------------------
DROP PROCEDURE IF EXISTS RAB_REPORT
GO
CREATE PROCEDURE RAB_REPORT @p NVARCHAR(10)
AS
DECLARE @rc INT = 0
BEGIN TRY
DECLARE @operation NVARCHAR(20), @resultt NVARCHAR(300) = '';
DECLARE RAB_REPORT CURSOR FOR SELECT ��������.�������������_�������� FROM �������� WHERE ��������.������������_�������� = RTRIM(@p)
IF NOT EXISTS (SELECT ��������.�������������_�������� FROM �������� WHERE  ��������.������������_��������= RTRIM(@p))
RAISERROR('ERROR', 11,1)
ELSE 
OPEN RAB_REPORT	
FETCH RAB_REPORT INTO @operation
PRINT 'OPERATIONS '
WHILE @@FETCH_STATUS = 0
BEGIN
SET @resultt = RTRIM (@operation) + ', ' + RTRIM(@resultt)
SET @rc = @rc + 1
FETCH RAB_REPORT INTO @operation
END
PRINT '������� ���������: ' + @resultt
CLOSE RAB_REPORT
DEALLOCATE RAB_REPORT
RETURN @rc
END TRY
BEGIN CATCH
PRINT 'ERROR IN PARAM';
IF ERROR_PROCEDURE() IS NOT NULL
PRINT 'NAME OF PROCEDURE ' + ERROR_PROCEDURE()
RETURN @rc
END CATCH
GO

DECLARE @re INT;
EXEC @re = RAB_REPORT '������'
PRINT 'COUNT OF OPERATIONS=' + CAST(@re AS VARCHAR(3)) 


-----------------------------
DROP PROCEDURE IF EXISTS PWORK_INSERTX 
GO
CREATE PROCEDURE PWORK_INSERTX @a NVARCHAR(20), @n NVARCHAR(50), @c INT = 0, @t NVARCHAR(10), @tn NVARCHAR(50)
AS
--BEGIN
DECLARE @rc INT = 1;
BEGIN TRY
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN
INSERT INTO �����������_������(����������_�������, ����) VALUES(@t, @tn)
EXEC @rc = PWORK_INSERT @a, @n, @c, @t;
COMMIT TRAN;
RETURN @rc;
END TRY
BEGIN CATCH	
PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR(6));
PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
PRINT 'ERROR SEVERITY: ' + CAST(ERROR_SEVERITY() AS VARCHAR(6));
PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS VARCHAR(8));
PRINT 'ERROR LINE: ' + CAST(ERROR_LINE() AS VARCHAR(8));
IF ERROR_PROCEDURE() IS NOT NULL
PRINT 'NAME OF PROCEDURE: ' + ERROR_PROCEDURE();
IF @@TRANCOUNT > 0 ROLLBACK TRAN;
RETURN -1;
END CATCH;

DECLARE @result INT;
EXEC @result = PWORK_INSERTX @a =14, @n =17, @c =2, @t =23, @tn = '2023-12-10';
SELECT * FROM �����������_������
SELECT * FROM ��������
