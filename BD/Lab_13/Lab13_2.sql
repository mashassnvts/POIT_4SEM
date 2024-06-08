USE [SOS_MyBase2]
GO

/****** Object:  StoredProcedure [dbo].[POPERATION]    Script Date: 10.05.2024 01:12:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[POPERATION] @p VARCHAR(20), @c INT OUTPUT
AS 
BEGIN
DECLARE @count INT = (SELECT COUNT(*) FROM Операции)
print 'параметры: @p=' + @p + ',@c =' + cast(@c as varchar(3));
SELECT Идентификатор_операции AS 'ИДЕНТИФИКАТОР', Наименование_операции AS Операция, Признак_сложности AS Сложность FROM Операции WHERE Признак_сложности = @p;
SET @c = @@ROWCOUNT
RETURN @count
END;
GO

DECLARE @q INT = 0, @r INT = 0;
EXEC @q = [POPERATION] 2, @r output;
PRINT 'ВСЕ ОПЕРАЦИИ ' + CONVERT(VARCHAR,@q);
PRINT 'СЛОЖНОСТЬ 2' + CONVERT(VARCHAR,@q);


