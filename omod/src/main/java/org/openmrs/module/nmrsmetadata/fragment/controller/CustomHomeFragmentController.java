/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.nmrsmetadata.fragment.controller;

import com.google.gson.Gson;
import org.apache.commons.lang3.Range;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.*;
import org.openmrs.api.ObsService;
import org.openmrs.api.context.Context;
import org.openmrs.module.appframework.context.AppContextModel;
import org.openmrs.module.appframework.service.AppFrameworkService;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.nmrsmetadata.dbmanager.NdrDBManager;
import org.openmrs.module.nmrsmetadata.model.RecencyResponse;
import org.openmrs.module.referenceapplication.ReferenceApplicationConstants;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.stereotype.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Spring MVC controller that takes over /index.htm and processes requests to show the home page so
 * users don't see the legacy OpenMRS UI
 */
@Controller
public class CustomHomeFragmentController {
	
	private Obs rovingObs;
	
	Gson gson = new Gson();
	
	RecencyResponse recencyResponse = new RecencyResponse();
	
	private Map<Integer, String> conceptIDMappings = new HashMap<>();

	List<Concept> questions = new LinkedList<Concept>();
	List<Concept> answers = new LinkedList<Concept>();
	List<Concept> questions_rrt = new LinkedList<Concept>();
	Range<Integer> RangeQ1, RangeQ2, RangeQ3, RangeQ4;
	String startDate1 = "";
	String endDate1 = "";
	String quaterStatus="";
	Date startDate = null, endDate = null;
	List<EncounterType> encounterTypes = new ArrayList<>();
	List<EncounterType> encounterTypes2 = new ArrayList<>();
	
	protected final Log log = LogFactory.getLog(getClass());
	
	//	@RequestMapping("/index.htm")
	//	public String overrideHomepage() {
	//		return "forward:/" + ReferenceApplicationConstants.MODULE_ID + "/home.page";
	//	}
	//
	/**
	 * @should limit which apps are shown on the homepage based on location
	 */
	
	public Object controller(PageModel model, @SpringBean("appFrameworkService") AppFrameworkService appFrameworkService,
	        UiSessionContext sessionContext) {
		
		AppContextModel contextModel = sessionContext.generateAppContextModel();
		
		model.addAttribute("extensions", appFrameworkService.getExtensionsForCurrentUser(
		    ReferenceApplicationConstants.HOME_PAGE_EXTENSION_POINT_ID, contextModel));
		model.addAttribute("authenticatedUser", Context.getAuthenticatedUser());

		return null;
	}
	
	public String getRecencyCount(@SpringBean("obsService") ObsService service) {
		NdrDBManager ndr = new NdrDBManager();
		questions.add(new Concept(166213));
		answers.add(new Concept(165852));

		String response = "";

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd", Locale.ENGLISH);
		calculateQuarterDates();
		try {
			startDate = formatter.parse(startDate1);
			endDate = formatter.parse(endDate1);
		}
		catch (ParseException e) {
			e.printStackTrace();
		}


//		encounterTypes.add(new EncounterType(39));
//		List <Encounter> listEncounter =  Context.getEncounterService().getEncounters(null, null, null, null, null, encounterTypes, null,null, null, false);
//
//		questions_rrt.add(new Concept(166210));
//		int total_rrt = service.getObservationCount(null,listEncounter,questions_rrt,null,null,null,null,startDate,endDate, false);
//
//		encounterTypes2.add(new EncounterType(20));
//		List <Encounter> listEncounter2 =  Context.getEncounterService().getEncounters(null, null, null, null, null, encounterTypes2, null,null, null, false);
//		int total_rtri = service.getObservationCount(null,listEncounter2,questions,answers,null,null,null,startDate,endDate,false);
		int total_rtri =0,total_rrt=0;
		try {
			ndr.openConnection();
			 total_rtri = ndr.getTotalRecentCasesByQtr(startDate1,endDate1);
			ndr.closeConnection();
		}
		catch (Exception ex) {
			System.out.println(ex);
		}

		try {
			ndr.openConnection();
			total_rrt = ndr.getTotalRRByQtr(startDate1,endDate1);
			ndr.closeConnection();
		}
		catch (Exception ex) {
			System.out.println(ex);
		}



		recencyResponse.setTotalCount(total_rtri-total_rrt);
		recencyResponse.setQuaterStatus(quaterStatus);
		response = gson.toJson(recencyResponse);
		return response;
	}
	
	private String getMappedAnswerValue(int conceptID) {
		if (conceptIDMappings.containsKey(conceptID)) {
			return conceptIDMappings.get(conceptID);
		}
		return "";
	}
	
//	public static Obs extractObs(int conceptID, List<Obs> obsList) {
//
//		if (obsList == null) {
//			return null;
//		}
//		return obsList.stream().filter(ele -> ele.getConcept().getConceptId() == conceptID).findFirst().orElse(null);
//	}

	public void calculateQuarterDates(){
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("yyyy");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now));
		String dateckeck=dtf.format(now);
		List<String> arrayoption = Arrays.asList(dateckeck.split("\\s*-\\s*"));

		RangeQ2 = Range.between(1,3);
		RangeQ3 = Range.between(4,6);
		RangeQ4 = Range.between(7,9);
		RangeQ1 = Range.between(10,12);

		if(RangeQ1.contains(Integer.parseInt(arrayoption.get(1)))){
			startDate1 = dtf2.format(now)+"-10-01";
			endDate1 = dtf2.format(now)+"-12-31";
			quaterStatus="Q1";
		}
		if(RangeQ2.contains(Integer.parseInt(arrayoption.get(1)))){
			startDate1 = dtf2.format(now)+"-01-01";
			endDate1 = dtf2.format(now)+"-03-31";
			quaterStatus="Q2";
		}
		if(RangeQ3.contains(Integer.parseInt(arrayoption.get(1)))){
			startDate1 = dtf2.format(now)+"-04-01";
			endDate1 = dtf2.format(now)+"-06-30";
			quaterStatus="Q3";
		}
		if(RangeQ4.contains(Integer.parseInt(arrayoption.get(1)))){
			startDate1 = dtf2.format(now)+"-07-01";
			endDate1 = dtf2.format(now)+"-09-30";
			quaterStatus="Q4";
		}
	}


}
