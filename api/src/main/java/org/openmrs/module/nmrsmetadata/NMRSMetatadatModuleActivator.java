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
		//new ReportsInitializer().started();
		new JsonFormsInitializer().started();
		new PatientQueuingClinicianLocationUUIDUpdate().started();
		
		// set visit handler
		GlobalProperty globalProperty = Context.getAdministrationService().getGlobalPropertyObject(
		    "visits.assignmentHandler");
		globalProperty.setPropertyValue("org.openmrs.api.handler.ExistingOrNewVisitAssignmentHandler");
		Context.getAdministrationService().saveGlobalProperty(globalProperty);
		
		log.info("Started NMRS Metatadat Module ");
	}
	
	/**
	 * @see #shutdown()
	 */
	public void shutdown() {
		log.info("Shutdown NMRS Metatadat Module ");
	}
	
}
