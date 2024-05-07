USE UNIVER;

DECLARE @c char = 'a',
@v varchar(5) = 'Masha',
@d datetime,
@t time,
@i int,
@s smallint,
@ti tinyint,
@n numeric(12,5);

SET @d= GETDATE();
SET @t='23:35:10.20';

SELECT @i = 768, @s = 235, @ti = 2, @n = 34534.5432

PRINT 'CHAR: ' + @c
PRINT 'VARCHAR: ' + @v
PRINT 'INT: ' + CAST(@i AS CHAR)
PRINT 'SMALLINT: ' + CAST(@s AS CHAR)

SELECT @d[datetime], @t[time], @ti[tinyint], @n[numeric];
