use SOS_MyBase2;

CREATE TABLE "Работники"
("Фамилия" nvarchar(50) NOT NULL PRIMARY KEY,
"Имя" nvarchar(50) UNIQUE NOT NULL,
"Телефон" nvarchar(30) NOT NULL,
"Стаж" nvarchar(20) NOT NULL)
on FG1;