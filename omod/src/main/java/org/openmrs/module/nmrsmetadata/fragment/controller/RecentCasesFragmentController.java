package org.openmrs.module.nmrsmetadata.fragment.controller;

import com.google.gson.Gson;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.Obs;
import org.openmrs.api.LocationService;
import org.openmrs.api.ObsService;
import org.openmrs.module.nmrsmetadata.model.RecencyResponse;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.springframework.stereotype.Controller;

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
	
	private List<Concept> questions_rrt = new LinkedList<Concept>();
	
	public String getPatientRecentCases(@SpringBean("obsService") ObsService service ) {
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
		List<Obs> obsList = service.getObservations(null, null, questions, answers, null, null, null, null, null, startDate,
				endDate, false);
		questions_rrt.add(new Concept(166892));
		List<Obs> obsList2 = service.getObservations(null, null, questions_rrt, null, null, null, null, null, null, startDate,
				endDate, false);


//		List<Obs> differenceBetweenTwoList = obsList.stream()
//				.filter(obsvalues -> obsList2.remove(obsvalues))
//				.collect(Collectors.toList());

		//List<Obs> differenceBetweenTwoList = obsList.removeIf(x -> obsList2.contains(x));
		List aList = obsList2.stream().map(Obs::getPersonId).collect(Collectors.toList());

		givenName = new ArrayList<String>();
		familyName = new ArrayList<String>();
		sex = new ArrayList<String>();
		age = new ArrayList<Integer>();
		patientUUID = new ArrayList<>();
		visitID = new ArrayList<>();
			for (Obs obs : obsList) {
				if(!aList.contains(obs.getPersonId())) {
					count++;
					givenName.add(obs.getPerson().getGivenName());
					recencyResponse.setFirstname(givenName);
					familyName.add(obs.getPerson().getFamilyName());
					recencyResponse.setLastname(familyName);
					sex.add(obs.getPerson().getGender());
					recencyResponse.setSex(sex);
					age.add(obs.getPerson().getAge());
					recencyResponse.setAge(age);
					patientUUID.add(obs.getPersonId());
					recencyResponse.setPatientUUID(patientUUID);
					visitID.add(obs.getEncounter().getEncounterId());
					recencyResponse.setVisitID(visitID);
				}
			}

		recencyResponse.setTotalCount(count);
		recencyResponse.setQuaterStatus(chf.quaterStatus);
		response = gson.toJson(recencyResponse);
		return response;
	}
}
