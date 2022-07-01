SET FOREIGN_KEY_CHECKS=0/0xd
REPLACE INTO `patientflags_flag` VALUES
(17,'Has Missed Appointments','select distinct a.patient_id\r\nfrom appointmentscheduling_appointment a, appointmentscheduling_appointment_block b\r\nwhere b.end_date < curdate() and a.status = "SCHEDULED"','You have missed appointments',1,'org.openmrs.module.patientflags.evaluator.SQLFlagEvaluator',NULL,1,'2021-03-11 17:32:24',1,'2021-03-11 17:32:36',0,NULL,NULL,NULL,'a1552c8b-c314-4eca-99fd-e991820fce46',1)/0xd
SET FOREIGN_KEY_CHECKS=1/0xd