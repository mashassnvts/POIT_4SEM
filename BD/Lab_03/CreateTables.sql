use SOS_MyBase;

CREATE TABLE "��������"(
"�������������_��������" INT NOT NULL PRIMARY KEY,
"������������_��������" NVARCHAR(50) NOT NULL,
"�������_���������" NVARCHAR(50) NOT NULL
);

CREATE TABLE "���������"(
"�������������_���������" INT NOT NULL PRIMARY KEY,
"�������" NVARCHAR(50) NOT NULL,
"���" NVARCHAR(50) NOT NULL,
"��������" NVARCHAR(50) NOT NULL,
"�����" NVARCHAR(50) NOT NULL,
"�������" NVARCHAR(30) NOT NULL,
"����" NVARCHAR(50) NOT NULL
);

CREATE TABLE "�����������_������"(
"�������������_�����������_������" INT NOT NULL PRIMARY KEY,
"�������������_��������" INT NOT NULL FOREIGN KEY REFERENCES ��������("�������������_��������"),
"�������������_���������" INT NOT NULL FOREIGN KEY REFERENCES ���������("�������������_���������"),
"����������_�������" NVARCHAR(30) NOT NULL,
"����" DATE NOT NULL
);
