use BankLab;
create procedure PROC_COUNT_OWNERS
as 
begin 
declare @k int = (select count (*) from dbo.[owners])
select @k[NumOfOwners];
return @k;
end;
