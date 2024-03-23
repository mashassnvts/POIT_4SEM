USE UNIVER;

SELECT	
GROUPS.PROFESSION [PROFESSION],
PROGRESS.SUBJECT [PROGRESS],
ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2) [AVG]
FROM GROUPS, STUDENT, PROFESSION, PROGRESS
WHERE GROUPS.FACULTY in ('���')
GROUP BY GROUPS.FACULTY,
GROUPS.PROFESSION, 
PROGRESS.SUBJECT
EXCEPT
SELECT	
GROUPS.PROFESSION [PROFESSION],
PROGRESS.SUBJECT [PROGRESS],
ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2) [AVG]
FROM GROUPS, STUDENT, PROFESSION, PROGRESS
WHERE GROUPS.FACULTY in ('����')
GROUP BY GROUPS.FACULTY,
GROUPS.PROFESSION, 
PROGRESS.SUBJECT