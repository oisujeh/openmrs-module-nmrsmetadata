package org.openmrs.module.nmrsmetadata.fragment.controller;

import com.google.gson.Gson;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.*;
import org.openmrs.api.LocationService;
import org.openmrs.api.ObsService;
import org.openmrs.api.context.Context;
import org.openmrs.module.nmrsmetadata.dbmanager.NdrDBManager;
import org.openmrs.module.nmrsmetadata.model.RecencyResponse;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.springframework.stereotype.Controller;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class RecentCasesFragmentController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	List<Concept> questions = new LinkedList<Concept>();
	
	List<Concept> answers = new LinkedList<Concept>();
	
	Date startDate = null, endDate = null;
	
	CustomHomeFragmentController chf = new CustomHomeFragmentController();
	
	RecencyResponse recencyResponse;
	
	Gson gson = new Gson();
	
	List<String> givenName, familyName, sex;
	
	List<Integer> age, patientUUID, visitID;

    List<EncounterType> encounterTypes = new ArrayList<>();
    List<EncounterType> encounterTypes2 = new ArrayList<>();
    Person person = null;
	private List<Concept> questions_rrt = new LinkedList<Concept>();
    ResultSet rs = null;
	
	public String getPatientRecentCases(@SpringBean("obsService") ObsService service ) {
        NdrDBManager ndr = new NdrDBManager();
		questions.add(new Concept(166213));
		answers.add(new Concept(165852));
		int count = 0;
		recencyResponse = new RecencyResponse();
		String response = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd", Locale.ENGLISH);
		chf.calculateQuarterDates();
		try {
			startDate = formatter.parse(chf.startDate1);
			endDate = formatter.parse(chf.endDate1);
		} catch (ParseException e) {
			e.printStackTrace();
		}

//        encounterTypes2.add(new EncounterType(20));
//        List <Encounter> listEncounter2 =  Context.getEncounterService().getEncounters(null, null, null, null, null, encounterTypes2, null,null, null, false);
//
//        List<Obs> obsList = service.getObservations(null, listEncounter2, questions, answers, null, null, null, null, null, startDate,
//				endDate, false);
//
//        encounterTypes.add(new EncounterType(39));
//        List <Encounter> listEncounter =  Context.getEncounterService().getEncounters(null, null, null, null, null, encounterTypes, null,null, null, false);
//
//		questions_rrt.add(new Concept(166210));
//		List<Obs> obsList2 = service.getObservations(null, listEncounter, questions_rrt, null, null, null, null, null, null, startDate,	endDate, false);
//
//		List aList = obsList2.stream().map(Obs::getPersonId).collect(Collectors.toList());

		givenName = new ArrayList<String>();
		familyName = new ArrayList<String>();
		sex = new ArrayList<String>();
		age = new ArrayList<Integer>();
		patientUUID = new ArrayList<>();
		visitID = new ArrayList<>();
//			for (Obs obs : obsList) {
//				if(!aList.contains(obs.getPersonId())) {
//					count++;
//					givenName.add(obs.getPerson().getGivenName());
//					recencyResponse.setFirstname(givenName);
//					familyName.add(obs.getPerson().getFamilyName());
//					recencyResponse.setLastname(familyName);
//					sex.add(obs.getPerson().getGender());
//					recencyResponse.setSex(sex);
//					age.add(obs.getPerson().getAge());
//					recencyResponse.setAge(age);
//					patientUUID.add(obs.getPersonId());
//					recencyResponse.setPatientUUID(patientUUID);
//					visitID.add(obs.getEncounter().getEncounterId());
//					recencyResponse.setVisitID(visitID);
//				}
//			}

        try {
            ndr.openConnection();
            rs = ndr.getListRecentCasesQrt(chf.startDate1,chf.endDate1);
            while (rs.next()){
                count++;
                person = Context.getPersonService().getPerson(rs.getInt("personid"));
                givenName.add(person.getGivenName());
                recencyResponse.setFirstname(givenName);
                familyName.add(person.getFamilyName());
                recencyResponse.setLastname(familyName);
                sex.add(person.getGender());
                recencyResponse.setSex(sex);
                age.add(person.getAge());
                recencyResponse.setAge(age);
                patientUUID.add(person.getPersonId());
                recencyResponse.setPatientUUID(patientUUID);
                visitID.add(rs.getInt("encounterid"));
                recencyResponse.setVisitID(visitID);

            }

            ndr.closeConnection();
        }
        catch (Exception ex) {
            System.out.println(ex);
        }

		recencyResponse.setTotalCount(count);
		recencyResponse.setQuaterStatus(chf.quaterStatus);
		response = gson.toJson(recencyResponse);
		return response;
	}
	

}
