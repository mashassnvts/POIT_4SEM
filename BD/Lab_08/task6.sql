CREATE VIEW [Количество_кафедр] WITH SCHEMABINDING
as SELECT FACULTY.FACULTY_NAME, COUNT(*)[Количество_кафедр] 
FROM dbo.FACULTY INNER JOIN dbo.PULPIT
ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY.FACULTY_NAME;