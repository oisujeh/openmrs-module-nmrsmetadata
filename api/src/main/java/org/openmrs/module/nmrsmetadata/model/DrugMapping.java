package org.openmrs.module.nmrsmetadata.model;

import javax.persistence.Column;

public class DrugMapping {
	
	private Integer regimenDrugMappingId;
	
	private Integer drugsConceptId;
	
	private String drugName;
	
	private Integer pediatricStrengthId;
	
	private String pediatricStrength;
	
	private Integer adultStrengthId;
	
	private String adultStrength;
	
	public DrugMapping() {
	}
	
	public DrugMapping(Integer regimenDrugMappingId, Integer drugsConceptId, String drugName, Integer pediatricStrengthId,
	    String pediatricStrength, Integer adultStrengthId, String adultStrength) {
		this.regimenDrugMappingId = regimenDrugMappingId;
		this.drugsConceptId = drugsConceptId;
		this.drugName = drugName;
		this.pediatricStrengthId = pediatricStrengthId;
		this.pediatricStrength = pediatricStrength;
		this.adultStrengthId = adultStrengthId;
		this.adultStrength = adultStrength;
	}
	
	public Integer getRegimenDrugMappingId() {
		return regimenDrugMappingId;
	}
	
	public void setRegimenDrugMappingId(Integer regimenDrugMappingId) {
		this.regimenDrugMappingId = regimenDrugMappingId;
	}
	
	public Integer getDrugsConceptId() {
		return drugsConceptId;
	}
	
	public void setDrugsConceptId(Integer drugsConceptId) {
		this.drugsConceptId = drugsConceptId;
	}
	
	public String getDrugName() {
		return drugName;
	}
	
	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}
	
	public Integer getPediatricStrengthId() {
		return pediatricStrengthId;
	}
	
	public void setPediatricStrengthId(Integer pediatricStrengthId) {
		this.pediatricStrengthId = pediatricStrengthId;
	}
	
	public String getPediatricStrength() {
		return pediatricStrength;
	}
	
	public void setPediatricStrength(String pediatricStrength) {
		this.pediatricStrength = pediatricStrength;
	}
	
	public Integer getAdultStrengthId() {
		return adultStrengthId;
	}
	
	public void setAdultStrengthId(Integer adultStrengthId) {
		this.adultStrengthId = adultStrengthId;
	}
	
	public String getAdultStrength() {
		return adultStrength;
	}
	
	public void setAdultStrength(String adultStrength) {
		this.adultStrength = adultStrength;
	}
}
