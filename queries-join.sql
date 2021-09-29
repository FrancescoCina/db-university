-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`,`students`.`surname`, `students`.`registration_number`,  `degrees`.`name`
FROM `students` 
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


---------------------------------------------------------------------------
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.`name`, `departments`.`name` 
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

---------------------------------------------------------------------------
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato

SELECT `courses`.`name` 
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`name` = 'Fulvio'
AND `teachers`.`surname` = 'Amato';

---------------------------------------------------------------------------
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`, `students`.`name`, `degrees`.* , `departments`.`name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
GROUP BY `students`.`id`
ORDER BY `students`.`surname` ASC;

---------------------------------------------------------------------------
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name`, `courses`.`name`, `teachers`.`name`, `teachers`.`surname`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`;

---------------------------------------------------------------------------
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica

SELECT `teachers`.`name`,`teachers`.`surname`, `departments`.`name`, `departments`.`id`
FROM `teachers`
JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id`= `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

---------------------------------------------------------------------------
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT `students`.`name`,`students`.`surname`, `courses`.`name` AS `name_of_course`, COUNT(`exam_student`.`vote`) 
FROM `students`
JOIN `exam_student`
ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
WHERE `exam_student`.`vote` < 18
GROUP BY `students`.`id`, `name_of_course`;


---- Query per fare il check su ex.7 -----

SELECT `courses`.`name`,`exam_student`.`vote` 
FROM `exam_student`
JOIN `students`
ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` 
ON `exams`.`course_id` = `courses`.`id`
WHERE `students`.`name` = "Rocco"
AND `students`.`surname` = "Serra"
AND `courses`.`name` = 'dolores dolor voluptas'

---------------------------------------------------------------------------
