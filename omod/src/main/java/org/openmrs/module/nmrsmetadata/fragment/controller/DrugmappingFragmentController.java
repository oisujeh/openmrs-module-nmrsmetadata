package org.openmrs.module.nmrsmetadata.fragment.controller;

import org.openmrs.api.EncounterService;
import org.openmrs.api.PatientService;
import org.openmrs.module.nmrsmetadata.model.LocalConcept;
import org.openmrs.module.nmrsmetadata.model.RegimenDrugMapping;
import org.openmrs.module.nmrsmetadata.model.RegimenMappingDto;
import org.openmrs.module.nmrsmetadata.service.RegimenDrugMappingService;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public class DrugmappingFragmentController {
	
	public void controller(FragmentModel model, @SpringBean("encounterService") EncounterService encounterService,
	        @SpringBean("patientService") PatientService patientService,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
	}
	
	public List<LocalConcept> searchConcept(@RequestParam("criteria") String criteria,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
		System.out.println(criteria);
		return regimenDrugMappingService.searchConcept(criteria);
	}
	
	public RegimenMappingDto getRegimenMapping(@RequestParam("criteria") String criteria,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
		System.out.println(criteria);
		return regimenDrugMappingService.getRegimenMapping(Integer.valueOf(criteria));
	}
	
	public String deleteRegimenMapping(@RequestParam("criteria") String criteria,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
		System.out.println(criteria);
		return regimenDrugMappingService.deleteRegimenMapping(Integer.valueOf(criteria));
	}
	
	public int saveRegimenMapping(@RequestBody RegimenDrugMapping regimenDrugMapping,
	        @SpringBean("regimenDrugMappingService") RegimenDrugMappingService regimenDrugMappingService) {
		System.out.println("Saving Mapping here");
		System.out.println(regimenDrugMapping.getPediatricStrength());
		System.out.println(regimenDrugMapping);
		
		//		RegimenDrugMapping regimenDrugMapping1 = new RegimenDrugMapping(164505, "114349,118833,119570", "166073,166075",
		//		        "165618,165619");
		return regimenDrugMappingService.saveRegimenMapping(regimenDrugMapping);
	}
}
