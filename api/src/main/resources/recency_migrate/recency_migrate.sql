-- Create Encounterid for Recency from existing Client intake form
INSERT INTO encounter(encounter_type,patient_id,location_id,form_id,encounter_datetime,creator,date_created,voided,void_reason,visit_id,UUID)

SELECT 39,A.patient_id,A.location_id,75,A.encounter_datetime,A.creator,A.date_created,A.voided,'Recency',A.visit_id,UUID()
 FROM
(SELECT * FROM encounter WHERE encounter_type IN (2, 20) AND voided = 0) AS A
INNER JOIN
(SELECT person_id,obs_datetime,encounter_id
FROM obs WHERE concept_id IN (166216 ,165849) AND voided = 0) AS B
ON A.patient_id = B.person_id AND A.encounter_id = B.encounter_id;

-- Update Obs data for Recency from the existing Client intake form

UPDATE
  obs AS ob
  INNER JOIN (

  SELECT A.patient_id,A.encounter_type,A.encounter_id AS encounter_idA,B.encounter_id AS encounter_idB,B.obs_datetime,B.obs_id,B.concept_id
  FROM
(SELECT * FROM encounter WHERE void_reason = 'Recency' AND voided = 0) AS A
  INNER JOIN
 (SELECT RecentOBS.person_id,RecentOBS.obs_datetime,RecentOBS.encounter_id,RecentOBS.value_text,RecentOBS.obs_id,
 RecentOBS.concept_id
FROM
(SELECT patient_id, encounter_id FROM encounter WHERE encounter_type IN (2,20) AND voided = 0) AS ClientIntake
INNER JOIN
(SELECT person_id,obs_datetime,encounter_id,value_text,obs_id,concept_id
FROM obs WHERE voided = 0 AND concept_id IN
(166216 ,165849,166210,166212,166243,166211,165850,166213,165853,166244,159951,165715,162476,166233,856,165856)
) AS RecentOBS ON ClientIntake.patient_id = RecentOBS.person_id AND ClientIntake.encounter_id = RecentOBS.encounter_id) AS B
ON A.patient_id = B.person_id


) AS obb ON ob.obs_id= obb.obs_id AND ob.`person_id`= obb.`patient_id` AND ob.encounter_id = obb.encounter_idB AND ob.obs_datetime = obb.obs_datetime
SET ob.encounter_id = obb.encounter_idA WHERE obb.concept_id IN

(166216 ,165849,166210,166212,166243,166211,165850,166213,165853,166244,159951,165715,162476,166233,856,165856);

UPDATE encounter SET void_reason = NULL WHERE void_reason = 'Recency';

