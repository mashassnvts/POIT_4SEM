USE master;

create DATABASE SOS_MyBase2 on primary
(name = N'SOS_MyBase2_mdf', filename = N'D:\fourth_semester\university\BD\BD\Lab_03\Base\SOS_MyBase2_mdf.mdf', size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'SOS_MyBase2_ndf', filename = N'D:\fourth_semester\university\BD\BD\Lab_03\Base\SOS_MyBase2_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
(name = N'SOS_MyBase2_fg1_1', filename = N'D:\fourth_semester\university\BD\BD\Lab_03\Base\SOS_MyBase2__fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
(name = N'SOS_MyBase2_fg1_2', filename = N'D:\fourth_semester\university\BD\BD\Lab_03\Base\SOS_MyBase2__fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
(name = N'SOS_MyBase2_log', filename=N'D:\fourth_semester\university\BD\BD\Lab_03\Base\SOS_MyBase2__log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)



CREATE TABLE "��������"(
"�������������_��������" INT NOT NULL PRIMARY KEY,
"������������_��������" NVARCHAR(50) NOT NULL,
"�������_���������" NVARCHAR(50) NOT NULL
) on FG1;

CREATE TABLE "���������"(
"�������������_���������" INT NOT NULL PRIMARY KEY,
"�������" NVARCHAR(50) NOT NULL,
"���" NVARCHAR(50) NOT NULL,
"��������" NVARCHAR(50) NOT NULL,
"�����" NVARCHAR(50) NOT NULL,
"�������" NVARCHAR(30) NOT NULL,
"����" NVARCHAR(50) NOT NULL
) on FG1;

CREATE TABLE "�����������_������"(
"�������������_�����������_������" INT NOT NULL PRIMARY KEY,
"�������������_��������" INT NOT NULL FOREIGN KEY REFERENCES ��������("�������������_��������"),
"�������������_���������" INT NOT NULL FOREIGN KEY REFERENCES ���������("�������������_���������"),
"����������_�������" NVARCHAR(30) NOT NULL,
"����" DATE NOT NULL
) on FG1;



ALTER TABLE ��������� ADD ���� NVARCHAR(30);

ALTER TABLE ��������� DROP Column ����;



INSERT into ��������(�������������_��������, ������������_��������, �������_���������)
Values (5, '���������', 1),
			(13, '������', 4),
			(17, '��������', 5),
			(45, '���������', 2);
INSERT into ���������(�������������_���������, �������, ���, ��������,�����, �������, ����)
Values(1, '�������', '�����', '����������', '������',7583765, '5 ���'),
           (2,'��������', '�����', '��������', '������',6573299, '4 ����'),
		   (3, '��������', '�����', '��������', '����������',9697323, '1 ���'),
		   (4, '��������', '����', '�����������', '�����',3352300, '8 ���');

INSERT into �����������_������(�������������_�����������_������, �������������_��������, �������������_���������,����������_�������, ����)
Values(6,17,4,9,'2023-09-21'),
       (7,5,2,17,'2023-09-04'),
	   (8,13,1,10,'2023-09-23'),	
	   (9, 45,3,19,'2023-09-01');

SELECT *FROM ���������;

SELECT �������_���������, ������������_�������� FROM ��������;

UPDATE �����������_������ set ����������_������� = ����������_������� + 2
SELECT ����������_������� FROM �����������_������;

SELECT count(*) FROM ���������;

DELETE from �����������_������ Where ���� = '2023-09-23';
SELECT *FROM �����������_������;

UPDATE ��������� set ��� = '�����' where ���� = '4 ����'


