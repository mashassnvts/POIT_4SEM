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
DECLARE @count INT = (SELECT COUNT(*) FROM ��������)
print '���������: @p=' + @p + ',@c =' + cast(@c as varchar(3));
SELECT �������������_�������� AS '�������������', ������������_�������� AS ��������, �������_��������� AS ��������� FROM �������� WHERE �������_��������� = @p;
SET @c = @@ROWCOUNT
RETURN @count
END;
GO

DECLARE @q INT = 0, @r INT = 0;
EXEC @q = [POPERATION] 2, @r output;
PRINT '��� �������� ' + CONVERT(VARCHAR,@q);
PRINT '��������� 2' + CONVERT(VARCHAR,@q);


