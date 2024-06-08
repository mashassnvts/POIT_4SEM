USE [UNIVER]
GO

/****** Object:  StoredProcedure [dbo].[PSUBJECT]    Script Date: 09.05.2024 23:19:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PSUBJECT] @p VARCHAR(20), @c INT OUTPUT
AS 
BEGIN
DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
print '���������: @p=' + @p + ',@c =' + cast(@c as varchar(3));
SELECT SUBJECT AS '���', SUBJECT_NAME AS ����������, PULPIT AS �������� FROM SUBJECT WHERE PULPIT = @p;
SET @c = @@ROWCOUNT
RETURN @count
END;

DECLARE @q INT = 0, @r INT = 0;
EXEC @q = PSUBJECT '�� ', @r output;
PRINT '���������� ' + CONVERT(VARCHAR,@q);
PRINT '���������� �� �� ' + CONVERT(VARCHAR,@q);



