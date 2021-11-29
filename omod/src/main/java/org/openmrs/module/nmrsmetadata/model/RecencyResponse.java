package org.openmrs.module.nmrsmetadata.model;

import java.util.List;

public class RecencyResponse {
	
	int totalCount;
	
	String quaterStatus;
	
	List<String> firstname;
	
	List<String> lastname;
	
	List<String> sex;
	
	List<Integer> age;
	
	List<Integer> patientUUID;
	
	List<Integer> visitID;
	
	public RecencyResponse() {
	}
	
	public RecencyResponse(int totalCount, String quaterStatus, List<String> firstname, List<String> lastname,
	    List<String> sex, List<Integer> age, List<Integer> patientUUID, List<Integer> visitID) {
		this.totalCount = totalCount;
		this.quaterStatus = quaterStatus;
		this.firstname = firstname;
		this.lastname = lastname;
		this.sex = sex;
		this.age = age;
		this.patientUUID = patientUUID;
		this.visitID = visitID;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public String getQuaterStatus() {
		return quaterStatus;
	}
	
	public void setQuaterStatus(String quaterStatus) {
		this.quaterStatus = quaterStatus;
	}
	
	public List<String> getFirstname() {
		return firstname;
	}
	
	public void setFirstname(List<String> firstname) {
		this.firstname = firstname;
	}
	
	public List<String> getLastname() {
		return lastname;
	}
	
	public void setLastname(List<String> lastname) {
		this.lastname = lastname;
	}
	
	public List<String> getSex() {
		return sex;
	}
	
	public void setSex(List<String> sex) {
		this.sex = sex;
	}
	
	public List<Integer> getAge() {
		return age;
	}
	
	public void setAge(List<Integer> age) {
		this.age = age;
	}
	
	public List<Integer> getPatientUUID() {
		return patientUUID;
	}
	
	public void setPatientUUID(List<Integer> patientUUID) {
		this.patientUUID = patientUUID;
	}
	
	public List<Integer> getVisitID() {
		return visitID;
	}
	
	public void setVisitID(List<Integer> visitID) {
		this.visitID = visitID;
	}
}
