package org.openmrs.module.nmrsmetadata.model;

import java.util.List;

public class RegimenMappingDto {
	
	private Integer regimenConceptId;
	
	private List<DrugMapping> drugMappingList;
	
	public RegimenMappingDto() {
	}
	
	public RegimenMappingDto(Integer regimenConceptId, List<DrugMapping> drugMappingList) {
		this.regimenConceptId = regimenConceptId;
		this.drugMappingList = drugMappingList;
	}
	
	public Integer getRegimenConceptId() {
		return regimenConceptId;
	}
	
	public void setRegimenConceptId(Integer regimenConceptId) {
		this.regimenConceptId = regimenConceptId;
	}
	
	public List<DrugMapping> getDrugMappingList() {
		return drugMappingList;
	}
	
	public void setDrugMappingList(List<DrugMapping> drugMappingList) {
		this.drugMappingList = drugMappingList;
	}
}
