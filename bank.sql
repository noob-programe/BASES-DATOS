CREATE DATABASE BANK DEFAULT CHARACTER SET = 'utf8mb4';

use BANK

CREATE TABLE Client (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200) NOT NULL,
    PhoneNumber VARCHAR(40) NOT NULL,
    Email VARCHAR(50),
    Balance DECIMAL(10, 2)
);

--Eliminar columna--

ALTER TABLE Client DROP COLUMN Balance;

--Crear nueva columna
ALTER TABLE Client ADD RegDate DATETIME DEFAULT CURRENT_TIMESTAMP;

--Quiero que la columna no sea nul

ALTER TABLE Client MODIFY COLUMN RegDate DATETIME NOT NULL;

automd_pro

--INSERTAR DATOS--
INSERT INTO
    Client (Name, PhoneNumber, Email)
VALUES (
        'Jonathan',
        '3106881457',
        'senalomejor@gmail.com'
    );

INSERT INTO
    Client (Name, PhoneNumber, Email)
VALUES (
        'Jijas',
        '3125668741',
        '457712@gmail.com'
    )

INSERT INTO Client VALUES ()

SELECT * FROM Client

--Qué pasa en los datos nulos?? --
INSERT INTO Client (PhoneNumber) VALUES ('33333333');

--Editar el ¡¡¡¡campo!! nombre--
UPDATE Client
set
    Name = 'Salfa',
    PhoneNumber = '3256698545',
    Email = 'dosvariables@gmail.com'
WHERE
    ID = 5

UPDATE Client set Email = 'correcion1@gmail.com' WHERE ID = 2

CREATE TABLE AccountType (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(200) NOT NULL,
    RegDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE TrasactionType (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Regdate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Account (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    AccountType INT NOT NULL,
    ClienteID INT NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL,
    RegDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountType) REFERENCES AccountType (ID),
    FOREIGN KEY (ClienteID) REFERENCES Client (ID)
);

CREATE TABLE Transactions (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT NOT NULL,
    TransactionTypeID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    RegDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Transactions
ADD CONSTRAINT fk_transactions_account FOREIGN KEY (AccountID) REFERENCES Account (ID),
ADD CONSTRAINT fk_transactions_type FOREIGN KEY (TransactionTypeID) REFERENCES TransactionType (ID)

INSERT INTO
    AccountType (NAME)
VALUES ('Persona1'),
    ('Nomina'),
    ('Ahorro');

INSERT INTO
    TrasactionType (Name)
VALUES ('Depostivo en Efectivo'),
    ('Retiro en efectivo'),
    ('Deposito via transferencia'),
    ('Retiro via transferencia');

SELECT * FROM AccountType;

SELECT * FROM TrasactionType;

INSERT INTO
    Account (
        AccountType,
        ClienteID,
        Balance
    )
VALUES (1, 1, 5000),
    (2, 1, 10000),
    (1, 2, 3000),
    (2, 1, 14000);

SELECT * FROM Account;

INSERT INTO
    Transactions (
        AccountID,
        TransactionTypeID,
        Amount,
        ExternalCount
    )
VALUES (1, 1, 100, NULL),
    (1, 3, 200, 123456),
    (3, 1, 100, NULL),
    (3, 3, 250, 454545);

ALTER TABLE Transactions ADD ExternalCount VARCHAR(50) NULL;

SELECT * FROM Transactions;

SELECT * FROM TrasactionType;

SELECT a.ID, c.Name, a.Balance, a.RegDate
FROM Account a
    INNER JOIN Client c ON a.ClientID = c.ID;