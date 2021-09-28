-- 1. Selezionare tutti gli studenti nati nel 1990

SELECT `name`, `surname`, `date_of_birth` 
FROM `students` 
WHERE YEAR(`date_of_birth`) = 1990;


--------------------------------------------

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti

SELECT `id`,`name`,`cfu`
FROM `courses`
WHERE `cfu` >= 10;

--------------------------------------------

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT `name`,`surname`,`date_of_birth` 
FROM `students`
WHERE `date_of_birth` < '1991-09-28'
ORDER BY `date_of_birth` DESC;

--------------------------------------------


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea

SELECT `name`,`id`,`period`,`year`
FROM `courses`
WHERE `period` = 'I semestre' AND `year` = 1;


--------------------------------------------

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020

SELECT `id`, `hour`
FROM `exams`
WHERE HOUR(`hour`) > '13:59:59';

--------------------------------------------

-- 6. Selezionare tutti i corsi di laurea magistrale
SELECT `name`,`level` 
FROM `degrees`
WHERE `level` = 'magistrale'

--------------------------------------------

-- 7. Da quanti dipartimenti è composta l'università?

SELECT COUNT(`id`) AS `number_of_departments`
FROM `departments`;

--------------------------------------------

-- 8 Quanti sono gli insegnanti che non hanno un numero di telefono? 
SELECT COUNT(*) AS `n_teachers_without_phone`
FROM `teachers`
WHERE `phone` IS NULL;


--------------------------------------------

-- 9. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) AS `number_of_students`, YEAR(`enrolment_date`) AS `year_of_enrolment`
FROM `students` 
GROUP BY `year_of_enrolment`;


--------------------------------------------

-- 10. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) AS `n_teachers`, `office_address`
FROM `teachers`
GROUP BY `office_address`;

--------------------------------------------

-- 11. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`) ,2) AS `average_votes`, `exam_id` AS `n_appeal`
FROM `exam_student`
GROUP BY `n_appeal`;

--------------------------------------------

-- 12. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`) AS `n_degree_courses`, `department_id` AS `department`
FROM `degrees` 
GROUP BY `department`

--------------------------------------------


