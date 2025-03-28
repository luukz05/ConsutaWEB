USE ANS;
SELECT * FROM DCS2324;
CREATE TABLE DCS2324 (
	`Data_Registro_ANS` DATETIME,
    `Registro_ANS` VARCHAR(10),
    `Cd_Conta_Contabil` VARCHAR(20),
    `Descricao` VARCHAR(255),
    `Vl_Saldo_Inicial` VARCHAR(15),
    `Vl_Saldo_Final` VARCHAR(15)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/1T2023.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
    Data_Registro_ANS = STR_TO_DATE(TRIM(@Data_Registro_ANS), '%d/%m/%Y');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/2T2023.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/3T2023.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/4T2023.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
      Data_Registro_ANS = STR_TO_DATE(TRIM(@Data_Registro_ANS), '%d/%m/%Y');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/1T2024.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/2T2024.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/3T2024.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/4T2024.csv'
INTO TABLE DCS2324
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@Data_Registro_ANS, Registro_ANS, Cd_Conta_Contabil, Descricao, Vl_Saldo_Inicial, Vl_Saldo_Final)
SET 
     Data_Registro_ANS = @Data_Registro_ANS;

UPDATE DCS2324 
SET Descricao = CONVERT(CAST(Descricao AS BINARY) USING utf8mb4);

