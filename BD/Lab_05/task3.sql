USE UNIVER;

SELECT PULPIT.PULPIT_NAME
FROM PULPIT INNER JOIN FACULTY
ON FACULTY.FACULTY = PULPIT.FACULTY
INNER JOIN PROFESSION
ON FACULTY.FACULTY = PROFESSION.FACULTY
WHERE PROFESSION.PROFESSION_NAME LIKE '%����������%' OR PROFESSION.PROFESSION_NAME LIKE '%����������%';