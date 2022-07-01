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

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.BaseModuleActivator;
import org.openmrs.GlobalProperty;
import org.openmrs.Patient;
import org.openmrs.api.AdministrationService;
import org.openmrs.api.context.Context;
import org.openmrs.scheduler.SchedulerService;
import org.openmrs.util.DatabaseUpdater;

/**
 * This class contains the logic that is run every time this module is either started or shutdown
 */
public class NMRSMetatadatModuleActivator extends BaseModuleActivator {
	
	private Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * @see #started()
	 */
	public void started() {
		//new ReportsInitializer().started();
		new JsonFormsInitializer().started();
		
		// set visit handler
		GlobalProperty globalProperty = Context.getAdministrationService().getGlobalPropertyObject(
		    "visits.assignmentHandler");
		globalProperty.setPropertyValue("org.openmrs.api.handler.ExistingOrNewVisitAssignmentHandler");
		Context.getAdministrationService().saveGlobalProperty(globalProperty);
		
		GlobalProperty isNmrsDistribution = Context.getAdministrationService().getGlobalPropertyObject("isNmrsDistribution");
		
		try {
			if (isNmrsDistribution != null) {
				//its PoC
				if (isNmrsDistribution.getPropertyValue().equalsIgnoreCase("true")) {
					//its poc final - execute poc liquibase					
					log.info("Executing POC Liquibase  and forms A");
					new PocHtmlFormsInitializer().started();
					new PatientQueuingClinicianLocationUUIDUpdate().started();
					DatabaseUpdater.executeChangelog("liquibase-poc.xml", null);
				} else {
					log.info("Executing Retrospective Liquibase B");
					new HtmlFormsInitializer().started();
					DatabaseUpdater.executeChangelog("liquibase-retrospective.xml", null);
				}
			} else {
				//its retrospective				
				log.info("Executing Retrospective Liquibase and forms C");
				new HtmlFormsInitializer().started();
				DatabaseUpdater.executeChangelog("liquibase-retrospective.xml", null);
			}
		}
		catch (Exception e) {
			log.error(e.getMessage());
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
