package org.openmrs.module.nmrsmetadata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "nmrsmetadata.RegimenDrugMapping")
@Table(name = "regimen_drug_mappings")
public class RegimenDrugMapping {
	
	@Id
	@Column(name = "regimen_drug_mapping_id")
	private Integer regimenDrugMappingId;
	
	@Column(name = "regimen_concept_id")
	private Integer regimenConceptId;
	
	@Column(name = "drugs_concept_id")
	private Integer drugsConceptId;
	
	@Column(name = "pediatric_strength")
	private Integer pediatricStrength;
	
	@Column(name = "adult_strength")
	private Integer adultStrength;
	
	public RegimenDrugMapping() {
	}
	
	public RegimenDrugMapping(Integer regimenDrugMappingId, Integer regimenConceptId, Integer drugsConceptId,
	    Integer pediatricStrength, Integer adultStrength) {
		this.regimenDrugMappingId = regimenDrugMappingId;
		this.regimenConceptId = regimenConceptId;
		this.drugsConceptId = drugsConceptId;
		this.pediatricStrength = pediatricStrength;
		this.adultStrength = adultStrength;
	}
	
	public Integer getRegimenDrugMappingId() {
		return regimenDrugMappingId;
	}
	
	public void setRegimenDrugMappingId(Integer regimenDrugMappingId) {
		this.regimenDrugMappingId = regimenDrugMappingId;
	}
	
	public Integer getRegimenConceptId() {
		return regimenConceptId;
	}
	
	public void setRegimenConceptId(Integer regimenConceptId) {
		this.regimenConceptId = regimenConceptId;
	}
	
	public Integer getDrugsConceptId() {
		return drugsConceptId;
	}
	
	public void setDrugsConceptId(Integer drugsConceptId) {
		this.drugsConceptId = drugsConceptId;
	}
	
	public Integer getPediatricStrength() {
		return pediatricStrength;
	}
	
	public void setPediatricStrength(Integer pediatricStrength) {
		this.pediatricStrength = pediatricStrength;
	}
	
	public Integer getAdultStrength() {
		return adultStrength;
	}
	
	public void setAdultStrength(Integer adultStrength) {
		this.adultStrength = adultStrength;
	}
}
