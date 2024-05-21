use BankLab;
CREATE TABLE [bills] (
  [id_bill] INT PRIMARY KEY,
  [number_bill] VARCHAR(50),
  [balance_bill] VARCHAR(50),
  [type_bill] VARCHAR(50)
);

--drop table bills;
--drop table [owners];

CREATE TABLE [owners] (
  [id_owner] INT PRIMARY KEY,
  [name_owner] VARCHAR(50),
  [second_name_owner] VARCHAR(50),
  [number_bill] VARCHAR(50),
  [adress_owner] VARCHAR(100),
  [phone_owner] VARCHAR(20),
  Image nvarchar(50),
);






