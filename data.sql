-- 1. Selezionare tutti gli studenti nati nel 1990

SELECT `name`, `surname`, `date_of_birth` 
FROM `students` 
WHERE YEAR(`date_of_birth`) = 1990;


--------------------------------------------

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti

SELECT `id`,`name`,`cfu`
FROM `courses`
WHERE `cfu` >= 10;