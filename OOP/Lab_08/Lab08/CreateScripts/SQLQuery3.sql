use BankLab;
create procedure PROC_COUNT_BILLS
as 
begin 
declare @k int = (select count (*) from dbo.BILLS)
select @k[NumOfBill];
return @k;
end;
