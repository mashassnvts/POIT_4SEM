USE UNIVER;


SELECT TEACHER.GENDER, TEACHER.PULPIT, TEACHER.TEACHER, TEACHER.TEACHER_NAME
FROM PULPIT FULL OUTER JOIN TEACHER
ON PULPIT.PULPIT = TEACHER.PULPIT