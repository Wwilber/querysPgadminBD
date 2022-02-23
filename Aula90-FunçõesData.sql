-- FUNÇÕES DE DATA E HORA: aula 19 do ultrabook:
-- CURRENT_DATE = Função que retorna a data atual no formato aaaa-mm-dd:
SELECT CURRENT_DATE AS "Data Atual";

-- CURRENT_TIME = Função que retorna a hora atual - hora completa:
SELECT CURRENT_TIME AS "Hora Atual";

-- CALCULAR DATA FUTURA:
SELECT CURRENT_DATE + INTERVAL '3 DAY' AS "DATA DE VENCIMENTO"; 
SELECT CURRENT_DATE + INTERVAL '1 MONTH' AS "DATA DE VENCIMENTO"; 
SELECT CURRENT_DATE + INTERVAL '2 YEAR' AS "DATA DE VENCIMENTO"; 

-- CALCULAR PASSADA:
SELECT CURRENT_DATE - INTERVAL '3 DAY' AS "DATA PASSADA"; 
SELECT CURRENT_DATE - INTERVAL '1 MONTH' AS "DATA PASSADA"; 
SELECT CURRENT_DATE - INTERVAL '2 YEAR' AS "DATA PASSADA"; 

-- DIFERENÇA ENTRE DATAS:
-- EM ANOS:
SELECT DATE_PART('YEAR', '2019-01-01'::date) - DATE_PART('YEAR', '2011-10-02'::date) AS Em_anos;

-- EM MESES:
SELECT (DATE_PART('YEAR', '2019-01-01'::date) - DATE_PART('YEAR', '2011-10-02'::date)) * 12 +
	(DATE_PART('month', '2019-01-01'::date) - DATE_PART('month', '2011-10-02'::date)) AS Em_meses;
	
-- EM SEMANAS:
SELECT TRUNC (DATE_PART('day', '2019-01-01'::timestamp - '2011-12-22'::timestamp)/7) AS semanas;

-- EM DIAS:
SELECT TRUNC (DATE_PART('day', '2019-01-01'::timestamp - '2011-12-22'::timestamp)) AS dias;
SELECT DATE_PART('day', '2019-01-01'::timestamp - '2011-12-22'::timestamp) AS dias;

-- EM HORAS:
SELECT DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)* 24 +
		DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS horas;

-- EM MINUTOS:
SELECT DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)* 24 +
		DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 60 +
		DATE_PART('minutes', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS minutos;

-- EM SEGUNDOS:
SELECT ((DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)* 24 +
		DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
		DATE_PART('minutes', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
		DATE_PART('second', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS em_segundos;
	
