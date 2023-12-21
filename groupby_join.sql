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

