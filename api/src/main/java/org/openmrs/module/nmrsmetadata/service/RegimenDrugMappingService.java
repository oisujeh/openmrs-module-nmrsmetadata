package org.openmrs.module.nmrsmetadata.service;

import org.openmrs.api.ConceptNameType;
import org.openmrs.api.ConceptService;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.nmrsmetadata.dao.RegimenDrugMappingDAO;
import org.openmrs.module.nmrsmetadata.model.DrugMapping;
import org.openmrs.module.nmrsmetadata.model.LocalConcept;
import org.openmrs.module.nmrsmetadata.model.RegimenDrugMapping;
import org.openmrs.module.nmrsmetadata.model.RegimenMappingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.util.*;

@Service(value = "regimenDrugMappingService")
public class RegimenDrugMappingService extends BaseOpenmrsService {
	
	RegimenDrugMappingDAO regimenDrugMappingDAO;
	
	@Autowired
	private ConceptService conceptService;
	
	public RegimenDrugMappingService() {
		this.regimenDrugMappingDAO = new RegimenDrugMappingDAO();
	}
	
	public RegimenMappingDto getRegimenMapping(Integer regimenConceptId) {
		List<RegimenDrugMapping> regimenDrugMapping = regimenDrugMappingDAO.getRegimenDrugMapping(regimenConceptId);
		if (regimenDrugMapping != null) {
			
			RegimenMappingDto regimenMappingDto = new RegimenMappingDto();
			
			if (regimenDrugMapping.size() > 0)
				regimenMappingDto.setRegimenConceptId(regimenConceptId);
				regimenMappingDto.setDrugMappingList(new ArrayList<>());
			for (RegimenDrugMapping regimenMapping : regimenDrugMapping) {
				DrugMapping drugMapping = new DrugMapping();
				if (regimenMapping.getDrugsConceptId() != null && regimenMapping.getDrugsConceptId() > 0) {
					drugMapping.setRegimenDrugMappingId(regimenMapping.getRegimenDrugMappingId());
					drugMapping.setDrugsConceptId(regimenMapping.getDrugsConceptId());
					drugMapping.setDrugName(conceptService.getConcept(regimenMapping.getDrugsConceptId())
					        .getName(Locale.ENGLISH, ConceptNameType.FULLY_SPECIFIED, null).getName());
				}
				
				if (regimenMapping.getPediatricStrength() != null && regimenMapping.getPediatricStrength() > 0) {
					drugMapping.setPediatricStrengthId(regimenMapping.getPediatricStrength());
					drugMapping.setPediatricStrength(conceptService.getConcept(regimenMapping.getPediatricStrength())
					        .getName(Locale.ENGLISH, ConceptNameType.FULLY_SPECIFIED, null).getName());
				}
				
				if (regimenMapping.getAdultStrength() != null && regimenMapping.getAdultStrength() > 0) {
					drugMapping.setAdultStrengthId(regimenMapping.getAdultStrength());
					drugMapping.setAdultStrength(conceptService.getConcept(regimenMapping.getAdultStrength())
					        .getName(Locale.ENGLISH, ConceptNameType.FULLY_SPECIFIED, null).getName());
				}
				regimenMappingDto.getDrugMappingList().add(drugMapping);
			}
			return regimenMappingDto;
		} else {
			return null;
		}
	}
	
	public int saveRegimenMapping(RegimenDrugMapping regimenDrugMapping) {
		System.out.println(regimenDrugMappingDAO);
		return regimenDrugMappingDAO.saveRegimenDrugMapping(regimenDrugMapping);
	}
	
	public List<LocalConcept> searchConcept(String criteria) {
		return regimenDrugMappingDAO.searchConcept(criteria);
	}
	
	public String deleteRegimenMapping(Integer criteria) {
		return regimenDrugMappingDAO.deleteMapping(criteria);
	}
}
