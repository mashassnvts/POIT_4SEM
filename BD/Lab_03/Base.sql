use master
go
create DATABASE SOS_MyBase2 on primary
(name = N'SOS_MyBase_mdf', filename = N'D:\4sem\уник\BD\BD\Lab_03\Base\SOS_MyBase_mdf.mdf', size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'SOS_MyBase_ndf', filename = N'D:\4sem\уник\BD\BD\Lab_03\Base\SOS_MyBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
(name = N'SOS_MyBase_fg1_1', filename = N'D:\4sem\уник\BD\BD\Lab_03\Base\SOS_MyBase__fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
(name = N'SOS_MyBase_fg1_2', filename = N'D:\4sem\уник\BD\BD\Lab_03\Base\SOS_MyBase__fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
(name = N'SOS_MyBase_log', filename=N'D:\4sem\уник\BD\BD\Lab_03\Base\SOS_MyBase__log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)
go