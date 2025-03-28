CREATE DATABASE IF NOT EXISTS ANS;
USE ANS;
SELECT * FROM RELATORIO_CADOP;
CREATE TABLE relatorio_cadop (
  `Registro_ANS` VARCHAR(10),  
  `CNPJ` VARCHAR(18), 
  `Razao_Social` VARCHAR(255),
  `Nome_Fantasia` VARCHAR(255),
  `Modalidade` VARCHAR(100),
  `Logradouro` VARCHAR(255),
  `Numero` VARCHAR(50),
  `Complemento` VARCHAR(255),
  `Bairro` VARCHAR(100),
  `Cidade` VARCHAR(100),
  `UF` CHAR(2),
  `CEP` VARCHAR(8),
  `DDD` CHAR(2),
  `Telefone` VARCHAR(20),
  `Fax` VARCHAR(20),
  `Endereco_eletronico` VARCHAR(255),
  `Representante` VARCHAR(255),
  `Cargo_Representante` VARCHAR(100),
  `Regiao_de_Comercializacao` INT NULL,
  `Data_Registro_ANS` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE relatorio_cadop
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, @Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, @Regiao_de_Comercializacao, @Data_Registro_ANS)
SET 
    Numero = NULLIF(@Numero, ''),
    Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, ''),
    Data_Registro_ANS = STR_TO_DATE(TRIM(@Data_Registro_ANS), '%d/%m/%Y');
