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



CREATE TABLE "Операции"(
"Идентификатор_операции" INT NOT NULL PRIMARY KEY,
"Наименование_операции" NVARCHAR(50) NOT NULL,
"Признак_сложности" NVARCHAR(50) NOT NULL
) on FG1;

CREATE TABLE "Работники"(
"Идентификатор_работника" INT NOT NULL PRIMARY KEY,
"Фамилия" NVARCHAR(50) NOT NULL,
"Имя" NVARCHAR(50) NOT NULL,
"Отчество" NVARCHAR(50) NOT NULL,
"Адрес" NVARCHAR(50) NOT NULL,
"Телефон" NVARCHAR(30) NOT NULL,
"Стаж" NVARCHAR(50) NOT NULL
) on FG1;

CREATE TABLE "Выполненная_работа"(
"Идентификатор_выполненной_работы" INT NOT NULL PRIMARY KEY,
"Идентификатор_операции" INT NOT NULL FOREIGN KEY REFERENCES Операции("Идентификатор_операции"),
"Идентификатор_работника" INT NOT NULL FOREIGN KEY REFERENCES Работники("Идентификатор_работника"),
"Количество_деталей" NVARCHAR(30) NOT NULL,
"Дата" DATE NOT NULL
) on FG1;



ALTER TABLE Работники ADD Фото NVARCHAR(30);

ALTER TABLE Работники DROP Column Фото;



INSERT into Операции(Идентификатор_операции, Наименование_операции, Признак_сложности)
Values (5, 'Полировка', 1),
			(13, 'Сварка', 4),
			(17, 'Покраска', 5),
			(45, 'Прессовка', 2);
INSERT into Работники(Идентификатор_работника, Фамилия, Имя, Отчество,Адрес, Телефон, Стаж)
Values(1, 'Глухова', 'Дарья', 'Витальевна', 'Мозырь',7583765, '5 лет'),
           (2,'Сосновец', 'Дарья', 'Игоревна', 'Мозырь',6573299, '4 года'),
		   (3, 'Евсеенко', 'Вивси', 'Павловна', 'Михановичи',9697323, '1 год'),
		   (4, 'Кивлинас', 'Олег', 'Леонидоавич', 'Минск',3352300, '8 лет');

INSERT into Выполненная_работа(Идентификатор_выполненной_работы, Идентификатор_операции, Идентификатор_работника,Количество_деталей, Дата)
Values(6,17,4,9,'2023-09-21'),
       (7,5,2,17,'2023-09-04'),
	   (8,13,1,10,'2023-09-23'),	
	   (9, 45,3,19,'2023-09-01');

SELECT *FROM Работники;

SELECT Признак_сложности, Наименование_операции FROM Операции;

UPDATE Выполненная_работа set Количество_деталей = Количество_деталей + 2
SELECT Количество_деталей FROM Выполненная_работа;

SELECT count(*) FROM Работники;

DELETE from Выполненная_работа Where Дата = '2023-09-23';
SELECT *FROM Выполненная_работа;

UPDATE Работники set Имя = 'Вивси' where Стаж = '4 года'


