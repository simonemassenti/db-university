-- Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- Selezionare tutti i corsi che valgono più di 10 crediti
SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE DATEDIFF(CURRENT_DATE, `date_of_birth`) >= 10957;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea
SELECT *
FROM `courses`
WHERE `period` = "I Semestre" AND `year` = 1;

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020
SELECT *
FROM `exams`
WHERE `date` = "2020-06-20" AND `hour` > "14:00:00";

-- Selezionare tutti i corsi di laurea magistrale
SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- Da quanti dipartimenti è composta l'università?
SELECT COUNT(*) AS "num_departments"
FROM `departments`;

-- Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT COUNT(*) AS "num_teachers"
FROM `teachers`
WHERE `phone` IS NOT NULL;