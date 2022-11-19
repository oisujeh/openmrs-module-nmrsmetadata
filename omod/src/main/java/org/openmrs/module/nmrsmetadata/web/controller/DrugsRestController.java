package org.openmrs.module.nmrsmetadata.web.controller;

import org.openmrs.api.ConceptService;
import org.openmrs.module.nmrsmetadata.dao.RegimenDrugMappingDAO;
import org.openmrs.module.nmrsmetadata.model.LocalConcept;
import org.openmrs.module.nmrsmetadata.model.RegimenDrugMapping;
import org.openmrs.module.nmrsmetadata.model.RegimenMappingDto;
import org.openmrs.module.nmrsmetadata.service.RegimenDrugMappingService;
import org.openmrs.module.webservices.rest.web.RestConstants;
import org.openmrs.module.webservices.rest.web.v1_0.controller.BaseRestController;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/rest/" + RestConstants.VERSION_1 + "/nmrsmetadata/drugs")
public class DrugsRestController extends BaseRestController {
	
	@Autowired
	RegimenDrugMappingService regimenDrugMappingDAO;
	
	@RequestMapping(method = RequestMethod.GET, value = { "/{regimenId}" })
	@ResponseBody
	public RegimenMappingDto index(@PathVariable("regimenId") Integer regimenId) {
		return regimenDrugMappingDAO.getRegimenMapping(regimenId);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = { "/new" })
	@ResponseBody
	public int saveMapping(@RequestBody RegimenDrugMapping regimenDrugMapping) {
		System.out.println(regimenDrugMappingDAO);
		System.out.println("Received Regimen mapping call");
		return regimenDrugMappingDAO.saveRegimenMapping(regimenDrugMapping);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = { "/search_concept/{criteria}" })
	@ResponseBody
	public List<LocalConcept> searchConcept(@PathVariable("criteria") String criteria,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
		System.out.println(criteria);
		List<LocalConcept> response = regimenDrugMappingService.searchConcept(criteria);
		System.out.println(response);
		return response;
	}
	
}
