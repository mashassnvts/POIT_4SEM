use BankLab;

INSERT INTO BILLS (id_bill, number_bill, balance_bill, type_bill)
VALUES (1, 12345678, 1000.00, 'Utility bill');
INSERT INTO OWNERS (id_owner, name_owner, second_name_owner, number_bill, adress_owner, phone_owner)
VALUES (1, 'John', 'Smith', 12345678,'123 Main St, Anytown, USA', '123-456-7890');
INSERT INTO BILLS (id_bill, number_bill, balance_bill, type_bill)
VALUES (2, 32145678,  500.00, 'Savings');
INSERT INTO OWNERS (id_owner, name_owner, second_name_owner, number_bill, adress_owner, phone_owner)
VALUES (2, 'Jane', 'Doe', 32145678, '456 Elm St, Anytown, USA', '987-654-3210');
INSERT INTO BILLS (id_bill, number_bill, balance_bill, type_bill)
VALUES (3, 87654321,1500.00, 'Checking');
INSERT INTO OWNERS (id_owner, name_owner, second_name_owner, number_bill, adress_owner, phone_owner)
VALUES (3, 'Sarah', 'Johnson', 87654321, '789 Oak St, Anytown, USA', '555-123-4567');
INSERT INTO BILLS (id_bill, number_bill, balance_bill, type_bill)
VALUES (4, 79142766,2000.00, 'Investment');
INSERT INTO OWNERS (id_owner, name_owner, second_name_owner, number_bill, adress_owner, phone_owner)
VALUES (4, 'David', 'Wilson', 79142766, '321 Pine St, Anytown, USA', '555-987-6543');
INSERT INTO BILLS (id_bill, number_bill,balance_bill, type_bill)
VALUES (5, 7809142,800.00, 'Credit Card');
INSERT INTO OWNERS (id_owner, name_owner, second_name_owner, number_bill, adress_owner, phone_owner)
VALUES (5, 'Amy', 'Thompson', 7809142, '567 Maple St, Anytown, USA', '555-456-7890');

