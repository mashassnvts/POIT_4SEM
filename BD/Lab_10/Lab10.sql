USE SOS_MyBase2;

EXEC sp_helpindex '��������'
EXEC sp_helpindex '���������'
EXEC sp_helpindex '�����������_������'

USE SOS_MyBase2;
SELECT * FROM �����������_������

CREATE INDEX #indd ON �����������_������(����������_������� asc)
--DROP INDEX #indd ON �����������_������

SELECT �������������_�����������_������, �������������_���������, ����������_������� FROM �����������_������ WHERE ����������_������� BETWEEN 11 AND 22 ORDER BY ����������_�������

CHECKPOINT;
DBCC DROPCLEANBUFFERS;


----------------------------------------------------------
USE SOS_MyBase2;
CREATE INDEX #ind1 ON �����������_������ (����������_�������, �������������_���������)
--DROP INDEX #ind1 ON �����������_������

SELECT �������������_�����������_������, �������������_���������, ����������_������� FROM �����������_������ WHERE ����������_������� BETWEEN 11 AND 22 ORDER BY ����������_�������

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

------------------------------------
CREATE INDEX #ind2 ON �����������_������ (����������_�������) INCLUDE (�������������_�����������_������)
DROP INDEX #ind2 ON �����������_������
SELECT*FROM �����������_������ WHERE ����������_������� BETWEEN 11 AND 22 ORDER BY ����������_�������

CHECKPOINT;
DBCC DROPCLEANBUFFERS;


-----------------------------------
CREATE INDEX #ind3 ON �����������_������(����������_�������) WHERE (����������_������� >= 11 AND ����������_������� <=22)
DROP INDEX #ind3 ON �����������_������

-----------------------------------
SELECT * FROM �����������_������ WHERE ����������_������� BETWEEN 11 AND 22 ORDER BY ����������_�������

