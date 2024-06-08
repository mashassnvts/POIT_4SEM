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
print 'ОЮПЮЛЕРПШ: @p=' + @p + ',@c =' + cast(@c as varchar(3));
SELECT SUBJECT AS 'йнд', SUBJECT_NAME AS дхяжхокхмю, PULPIT AS йютедепю FROM SUBJECT WHERE PULPIT = @p;
SET @c = @@ROWCOUNT
RETURN @count
END;

DECLARE @q INT = 0, @r INT = 0;
EXEC @q = PSUBJECT 'ну ', @r output;
PRINT 'дхяжхокхмш ' + CONVERT(VARCHAR,@q);
PRINT 'дхяжхокхмш мю ну ' + CONVERT(VARCHAR,@q);



