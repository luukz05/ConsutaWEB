USE ANS;

SELECT *
    FROM DCS2324
    WHERE descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' #somente valores e cadastro
    AND Data_Registro_Ans between '2024-01-01 00:00:00' and '2024-12-01 00:00:00'
    ORDER BY Vl_Saldo_Final DESC
    LIMIT 10;

WITH CTE AS (
    SELECT registro_ans
    FROM DCS2324
    WHERE descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' #nome referente ao cadastro
    AND Data_Registro_Ans between '2024-01-01 00:00:00' and '2024-12-01 00:00:00'
    ORDER BY Vl_Saldo_Final DESC
    LIMIT 10
)
SELECT * 
FROM relatorio_cadop
JOIN CTE ON relatorio_cadop.Registro_ANS = CTE.registro_ans;
