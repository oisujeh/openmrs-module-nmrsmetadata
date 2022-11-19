package org.openmrs.module.nmrsmetadata.model;

public class LocalConcept {
	
	private Integer conceptId;
	
	private String conceptName;
	
	public LocalConcept() {
	}
	
	public LocalConcept(Integer conceptId, String conceptName) {
		this.conceptId = conceptId;
		this.conceptName = conceptName;
	}
	
	public Integer getConceptId() {
		return conceptId;
	}
	
	public void setConceptId(Integer conceptId) {
		this.conceptId = conceptId;
	}
	
	public String getConceptName() {
		return conceptName;
	}
	
	public void setConceptName(String conceptName) {
		this.conceptName = conceptName;
	}
}
