--GROUP BY
-- Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS "year", COUNT(*) AS "students_number"  
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS "teachers_number", `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`), `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT AVG(`vote`) AS "average_vote", `courses`.`name`
FROM `exam_student`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id`= `courses`.`id`
GROUP BY `courses`.`name`;

--JOIN
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `degrees`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "Magistrale"
AND `departments`.`name` = "Dipartimento di neuroscienze";

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id`=`course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id`= 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`,`students`.`name`, `degrees`.`name` AS "degree_name", `departments`.`name` AS "department_name"
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id`= `departments`.`id`
ORDER BY `students`.`surname` ASC, `students`.`name` ASC;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`, `courses`.`name`, `teachers`.`name`,`teachers`.`surname`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`surname`, `teachers`.`name` 
FROM `teachers` 
JOIN `course_teacher` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `degrees` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id` 
WHERE `departments`.`name` = "Dipartimento di Matematica";

