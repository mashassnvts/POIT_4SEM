use SOS_MyBase;

CREATE TABLE "Операции"(
"Идентификатор_операции" INT NOT NULL PRIMARY KEY,
"Наименование_операции" NVARCHAR(50) NOT NULL,
"Признак_сложности" NVARCHAR(50) NOT NULL
);

CREATE TABLE "Работники"(
"Идентификатор_работника" INT NOT NULL PRIMARY KEY,
"Фамилия" NVARCHAR(50) NOT NULL,
"Имя" NVARCHAR(50) NOT NULL,
"Отчество" NVARCHAR(50) NOT NULL,
"Адрес" NVARCHAR(50) NOT NULL,
"Телефон" NVARCHAR(30) NOT NULL,
"Стаж" NVARCHAR(50) NOT NULL
);

CREATE TABLE "Выполненная_работа"(
"Идентификатор_выполненной_работы" INT NOT NULL PRIMARY KEY,
"Идентификатор_операции" INT NOT NULL FOREIGN KEY REFERENCES Операции("Идентификатор_операции"),
"Идентификатор_работника" INT NOT NULL FOREIGN KEY REFERENCES Работники("Идентификатор_работника"),
"Количество_деталей" NVARCHAR(30) NOT NULL,
"Дата" DATE NOT NULL
);
