USE SOS_MyBase2;

/*taks 1 and task 2*/
SELECT ���������.���, �����������_������.�������������_�����������_������
FROM ��������� INNER JOIN �����������_������ 
ON  ���������.�������������_��������� = �����������_������.�������������_���������
WHERE ���������.������� LIKE '��������'

/*task3*/
SELECT  ���������.�������,�����������_������.����,�����������_������.����������_�������,
CASE 
WHEN �����������_������.����������_������� BETWEEN 10 AND 20 THEN '����'
WHEN �����������_������.����������_������� BETWEEN 21 AND 30 THEN '�����'
ELSE '���� �����'
END

FROM �����������_������ INNER JOIN ��������� 
ON �����������_������.�������������_��������� = ���������.�������������_���������
ORDER BY �����������_������.����������_�������;

/*task 4 and task 5*/
SELECT 8
FROM ��������� FULL OUTER JOIN �����������_������
ON ���������.�������������_��������� = �����������_������.�������������_���������;

SELECT ISNULL(���������.�������, '-'), ISNULL(�����������_������.�������������_���������, '-')
FROM ��������� LEFT OUTER JOIN �����������_������
ON �����������_������.�������������_��������� = ���������.�������������_��������� 

SELECT ISNULL(���������.�������, '-'), ISNULL(�����������_������.�������������_���������, '-')
FROM ��������� RIGHT OUTER JOIN �����������_������
ON �����������_������.�������������_��������� = ���������.�������������_��������� 

SELECT ISNULL(���������.�������, '-'), ISNULL(�����������_������.�������������_���������, '-')
FROM ��������� FULL OUTER JOIN �����������_������
ON �����������_������.�������������_��������� = ���������.�������������_��������� 

/*task 6*/
SELECT ���������.���, �����������_������.�������������_���������
FROM ��������� CROSS JOIN �����������_������
WHERE �����������_������.�������������_��������� = ���������.�������������_��������� 
