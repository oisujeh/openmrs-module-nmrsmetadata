/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.nmrsmetadata;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.GlobalProperty;
import org.openmrs.Privilege;
import org.openmrs.api.AdministrationService;
import org.openmrs.api.context.Context;
import org.openmrs.module.BaseModuleActivator;
import org.openmrs.scheduler.SchedulerService;

/**
 * This class contains the logic that is run every time this module is either started or shutdown
 */
public class NMRSMetatadatModuleActivator extends BaseModuleActivator {
	
	private Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * @see #started()
	 */
	@SuppressWarnings("deprecation")
	public void started() {
		new HtmlFormsInitializer().started();
		new ReportsInitializer().started();
		new JsonFormsInitializer().started();
		new PatientQueuingClinicianLocationUUIDUpdate().started();
		
		// set visit handler
		GlobalProperty globalProperty = Context.getAdministrationService().getGlobalPropertyObject(
		    "visits.assignmentHandler");
		globalProperty.setPropertyValue("org.openmrs.api.handler.ExistingOrNewVisitAssignmentHandler");
		Context.getAdministrationService().saveGlobalProperty(globalProperty);
		
		//create new privilege 
		//check if Lims module privilege already exist, if exist dont create
		Privilege isPrivilegeAlreadySaved = null;
		isPrivilegeAlreadySaved = Context.getUserService().getPrivilege("Apps: LIMS Module Privilege");
		if (isPrivilegeAlreadySaved.getPrivilege().equals("Apps: LIMS Module Privilege")) {} else {
			Privilege priv = new Privilege();
			priv.setPrivilege("Apps: LIMS Module Privilege");
			Context.getUserService().savePrivilege(priv);
		}
		
		//check if export module privilege already exist, if exist dont create
		Privilege isPrivilegeAlreadySavedExp = null;
		isPrivilegeAlreadySavedExp = Context.getUserService().getPrivilege("Apps: Export Module Privilege");
		if (isPrivilegeAlreadySavedExp.getPrivilege().equals("Apps: Export Module Privilege")) {} else {
			Privilege privv = new Privilege();
			privv.setPrivilege("Apps: Export Module Privilege");
			Context.getUserService().savePrivilege(privv);
		}
		
		log.info("Started NMRS Metatadat Module ");
	}
	
	/**
	 * @see #shutdown()
	 */
	public void shutdown() {
		log.info("Shutdown NMRS Metatadat Module ");
	}
	
}
