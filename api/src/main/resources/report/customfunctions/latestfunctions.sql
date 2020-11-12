drop function if exists getconceptval;
drop function if exists getoutcome;
drop procedure if exists drugduration;
drop function if exists daysofarvrefil;
drop function if exists getdaysofarvrefil;


DELIMITER ;;
CREATE FUNCTION `getconceptval`(`obsid` int,`cid` int, pid int) RETURNS decimal(10,0)
BEGIN

	#Routine body goes here...

   DECLARE value_num INT;

    SELECT DISTINCT obs.value_numeric into value_num from obs WHERE  obs.obs_group_id is not null and obs.obs_group_id=obsid and obs.concept_id=cid and obs.person_id=pid and obs.voided=0 LIMIT 1;

	RETURN value_num;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE FUNCTION `getdaysofarvrefil`(`obsid` numeric,`obsgroupid` numeric,`valuenumeric` numeric) RETURNS decimal(10,0)
BEGIN

	#Routine body goes here...

DECLARE ans NUMERIC;


IF obsid=obsgroupid THEN

        SET ans = valuenumeric;

ELSE

         SET ans = null;

END IF;

RETURN ans;

END ;;
DELIMITER ;



DELIMITER ;;
CREATE FUNCTION `getoutcome`(`lastpickupdate` date,`daysofarvrefill` numeric,`ltfudays` numeric, `enddate` date) RETURNS text CHARSET utf8
BEGIN

DECLARE  ltfudate DATE;

DECLARE  ltfunumber NUMERIC;

DECLARE  daysdiff NUMERIC;

DECLARE outcome text;

SET ltfunumber=daysofarvrefill+ltfudays;

SELECT DATE_ADD(lastpickupdate, INTERVAL ltfunumber DAY) INTO ltfudate;

SELECT DATEDIFF(ltfudate,enddate) into daysdiff;

SELECT IF(daysdiff >=0,"Active","LTFU") into outcome;

RETURN outcome;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `drugduration`(IN `enddate` date)
BEGIN

	#Routine body goes here...

drop table if exists arvmedication;

create   table  arvmedication as 

select  DISTINCT obs.person_id, obs.obs_id from obs where concept_id=162240 and voided=0 and obs.obs_datetime <=enddate

GROUP BY obs.person_id,obs.concept_id ORDER BY  obs.obs_datetime DESC;

CREATE  INDEX pid ON arvmedication(person_id);



END ;;
DELIMITER ;


DROP FUNCTION IF EXISTS `getreporteddate`;
DELIMITER ;;
CREATE FUNCTION `getreporteddate`(`encounter_id` int,`reporteddateconcept_id` int,`patientid` int) RETURNS date
BEGIN
	#Routine body goes here...
DECLARE val_date date;
select obs.value_datetime into val_date from obs where 
concept_id=reporteddateconcept_id 
and
obs.encounter_id=encounter_id
and
obs.person_id=patientid
and
voided=0 LIMIT 1;
RETURN val_date;
END
;;
DELIMITER ;

DROP FUNCTION IF EXISTS `getcurrentregimen`;
DELIMITER ;;
CREATE FUNCTION `getcurrentregimen`(`cid` int,`eid` int) RETURNS text CHARSET utf8
BEGIN
 DECLARE regimen text;
   SELECT cn1.name INTO regimen from 
   obs INNER JOIN concept_name cn1 on(obs.value_coded=cn1.concept_id and cn1.locale='en' and cn1.locale_preferred=1)  where obs.concept_id=cid AND obs.encounter_id=eid  AND obs.voided=0 LIMIT 1;
	
	RETURN regimen;
END
;;
DELIMITER ;



