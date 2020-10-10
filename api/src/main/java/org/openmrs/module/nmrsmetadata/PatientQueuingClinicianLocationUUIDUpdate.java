package org.openmrs.module.nmrsmetadata;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.GlobalProperty;
import org.openmrs.api.context.Context;

public class PatientQueuingClinicianLocationUUIDUpdate implements Initializer {
	
	protected static final Log log = LogFactory.getLog(PatientQueuingClinicianLocationUUIDUpdate.class);
	
	@Override
	public void started() {
		try {
			//get the patient queuing clinician uuid property value
			String clinicUUID = "patientqueueing.clinicianLocationUUIDS";
			GlobalProperty globalProp = Context.getAdministrationService().getGlobalPropertyObject(clinicUUID);
			String propertyVal = globalProp.getPropertyValue();
			//set all locations uuid
			String locUUID = ",7f65d926-57d6-4402-ae10-a5b3bcbf7986,7fdfa2cb-bc95-405a-88c6-32b7673c0453,aff27d58-a15c-49a6-9beb-d30dcfc0c66e,8ae6ceea-1891-44f4-8f45-55ba7c12a2d0,be7e1e5c-9bb1-4a0d-9683-4662b31b18dc,22294cb2-739a-43d2-8689-82bc42ca09da,fb1fc5b5-d2e6-4d2b-a8df-28c059d86991,8114f65f-53ca-444d-8e46-abc67b614692";
			//concatenate property value to the locUUiD
			propertyVal += locUUID;
			//set property value
			Context.getAdministrationService().updateGlobalProperty(clinicUUID, propertyVal);
			//update patient registration state and lga
			String prop = "layout.address.format";
			String val = "<org.openmrs.layout.address.AddressTemplate>\n" + "<nameMappings class=\"properties\">\n"
			        + "<property name=\"postalCode\" value=\"Location.postalCode\"/>\n"
			        + "<property name=\"address2\" value=\"Location.address2\"/>\n"
			        + "<property name=\"address1\" value=\"Location.address1\"/>\n"
			        + "<property name=\"country\" value=\"Location.country\"/>\n"
			        + "<property name=\"stateProvince\" value=\"State\"/>\n"
			        + "<property name=\"cityVillage\" value=\"Local Govt.\"/>\n" + "</nameMappings>\n"
			        + "<sizeMappings class=\"properties\">\n" + "<property name=\"postalCode\" value=\"10\"/>\n"
			        + "<property name=\"address2\" value=\"40\"/>\n" + "<property name=\"address1\" value=\"40\"/>\n"
			        + "<property name=\"country\" value=\"10\"/>\n" + "<property name=\"stateProvince\" value=\"10\"/>\n"
			        + "<property name=\"cityVillage\" value=\"10\"/>\n" + "</sizeMappings>\n" + "<lineByLineFormat>\n"
			        + "<string>address1</string>\n" + "<string>address2</string>\n"
			        + "<string>cityVillage stateProvince country postalCode</string>\n" + "</lineByLineFormat>\n"
			        + "</org.openmrs.layout.address.AddressTemplate>";
			Context.getAdministrationService().updateGlobalProperty(prop, val);
		}
		catch (Exception e) {
			log.error("Could not update property value for patient queueing: ", e);
		}
	}
	
	@Override
	public void stopped() {
		
	}
	
}
