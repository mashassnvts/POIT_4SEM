USE SOS_MyBase2;
select * from Операции

BEGIN TRY
BEGIN TRAN --начало явной транзакции 
DELETE Операции WHERE Идентификатор_операции = 1
INSERT INTO Операции VALUES(3, 'Поклейка',10);
PRINT 'Транзакция прошла успешно'; 
COMMIT TRAN -- фиксация транзакции 
END TRY
BEGIN CATCH
PRINT 'Ошибка: ' + cast(error_number() AS VARCHAR(5)) + ' ' + ERROR_MESSAGE()
IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH;


-------------------------------------

select * from Операции
DECLARE @point varchar(32);
BEGIN TRY
BEGIN TRAN
SET @point = 'p1' SAVE TRAN @point
INSERT Операции VALUES (81, 'Шпатлевание', 9);
SET @point = 'p2' SAVE TRAN @point
INSERT Операции VALUES (34, 'Реконструкция', 7);
COMMIT TRAN;
END TRY
BEGIN CATCH
PRINT 'ОШИБКА' + CASE WHEN ERROR_NUMBER() = 2627 AND PATINDEX('%PK_STUDENT', ERROR_MESSAGE()) > 0
THEN 'ДУБЛИРОВАНИЕ '
ELSE 'НЕИЗВЕСТНАЯ ОШИБКА ' + CAST(ERROR_NUMBER() AS VARCHAR(5)) + ERROR_MESSAGE()
END
IF @@TRANCOUNT > 0
BEGIN
PRINT 'КОНТРОЛЬНАЯ ТОЧКА: ' + @point
ROLLBACK TRAN @point
END
END CATCH


---------------------------------
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-----t1---------
SELECT @@SPID, 'insert Работники' 'результат', *
FROM Работники WHERE Идентификатор_работника = '4';
SELECT @@SPID, 'update Выполненная_работа' 'результат', *
FROM Выполненная_работа WHERE Идентификатор_работника = '4';
COMMIT;
-----B–-------
-----t2---------
BEGIN TRANSACTION
SELECT @@SPID
INSERT Работники VALUES(6, 'ооооо' ,'ааааааа', 'бббббббббб', 'hhhhhh', 767588, '3 года');
UPDATE Работники SET Идентификатор_работника = '11' WHERE Стаж = '11 лет'
-----t1----------
-----t2----------
ROLLBACK;

SELECT * FROM Выполненная_работа;
SELECT * FROM Работники;

-----------------------------------------------
--(Неповторяющееся чтение)
-- A ---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT * FROM Операции WHERE Наименование_операции = 'Поклейка';

SELECT * FROM Операции WHERE Наименование_операции = 'Поклейка';
COMMIT;

--- B ---
BEGIN TRANSACTION
-------------------------- t1 --------------------
UPDATE Операции SET Наименование_операции = 'Поклейка обоев' WHERE Наименование_операции = 'Поклейка'
COMMIT TRAN;

ROLLBACK

select * from Операции
--------------------------------------------
--task6 (фантомное чтение)

-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT * FROM Операции WHERE Наименование_операции = 'Поклейка обоев';
-------------------------- t1 ------------------
-------------------------- t2 -----------------
SELECT COUNT(*) FROM Операции WHERE Наименование_операции = 'Поклейка обоев';
ROLLBACK;

--- B ---
BEGIN TRANSACTION
-------------------------- t1 ------------------
UPDATE Операции SET Наименование_операции ='1253asdat' WHERE Наименование_операции = 'Поклейка обоев';
COMMIT ;

----------------------------------------------

-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
BEGIN TRANSACTION
SELECT * FROM Операции;
-------------------------- t1 ------------------
-------------------------- t2 -----------------
ROLLBACK;

--- B ---
BEGIN TRANSACTION
INSERT Операции VALUES(78 , 'гыгыгага' , 3);
COMMIT ;




--------------------------------------
--Task 8 (вложенная транзакция)
CREATE TABLE #TEMPDB8(A INT, B INT);
INSERT #TEMPDB8 VALUES(1,3);
BEGIN TRAN
INSERT #TEMPDB8 VALUES(999,2)
	BEGIN TRAN
	UPDATE #TEMPDB8 SET A = 1 WHERE B = 2
	COMMIT
IF @@TRANCOUNT > 0 ROLLBACK
SELECT * FROM #TEMPDB8

drop table #TEMPDB8
