/* 
 * Some concept data types needed to change to accommodate dropdowns
 */
/**
 * Author:  The Bright
 * Created: Apr 18, 2021
 */

/* Changing Concept Data Type for Multimonth scripting to Coded datatype to allow for dropdown answers MMD<3, MMD3-5, MMD>=6 */
REPLACE INTO `concept` (`concept_id`,`retired`,`short_name`,`description`,`form_text`,`datatype_id`,`class_id`,`is_set`,`creator`,`date_created`,`version`,`changed_by`,`date_changed`,`retired_by`,`date_retired`,`retire_reason`,`uuid`) VALUES (166149,0,NULL,NULL,NULL,2,7,0,1,'2019-09-24 15:12:43',NULL,1,'2021-04-18 21:19:30',NULL,NULL,NULL,'7447a3fe-486d-4fb2-9e2d-c59a30da2f14');
/* Changing Concept Data Type for Facility Dispensing to Coded datatype to allow for dropdown answers Not Differenciated, Community Dispensing, Multimonth Scripting */
REPLACE INTO `concept` (`concept_id`,`retired`,`short_name`,`description`,`form_text`,`datatype_id`,`class_id`,`is_set`,`creator`,`date_created`,`version`,`changed_by`,`date_changed`,`retired_by`,`date_retired`,`retire_reason`,`uuid`) VALUES (166276,0,NULL,NULL,NULL,2,7,0,1,'2021-03-04 11:59:52',NULL,1,'2021-04-18 21:06:21',NULL,NULL,NULL,'60882cd1-1f42-485b-8afb-cd988282251e');
/* Changing Concept Data Type for Community Dispensing to Coded datatype to allow for dropdown answers Community Pharmacy, Community ART Group, Home Delivery */
REPLACE INTO `concept` (`concept_id`,`retired`,`short_name`,`description`,`form_text`,`datatype_id`,`class_id`,`is_set`,`creator`,`date_created`,`version`,`changed_by`,`date_changed`,`retired_by`,`date_retired`,`retire_reason`,`uuid`) VALUES (166277,0,NULL,NULL,NULL,2,7,0,1,'2021-03-04 12:00:38',NULL,1,'2021-04-18 21:15:14',NULL,NULL,NULL,'cd9b9087-bf24-4f08-a3a7-88bb37b0ff53');
