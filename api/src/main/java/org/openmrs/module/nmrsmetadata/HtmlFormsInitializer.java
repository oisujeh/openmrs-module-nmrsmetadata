package org.openmrs.module.nmrsmetadata;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.FormService;
import org.openmrs.api.context.Context;
import org.openmrs.module.htmlformentry.HtmlFormEntryService;
import org.openmrs.module.htmlformentryui.HtmlFormUtil;
import org.openmrs.ui.framework.resource.ResourceFactory;
import org.openmrs.ui.framework.resource.ResourceProvider;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class HtmlFormsInitializer implements Initializer {
	
	protected static final String providerName = "nmrsmetadata";
	
	protected static final String formsPath = "forms/";
	
	protected static final Log log = LogFactory.getLog(HtmlFormsInitializer.class);
	
	@Override
	public void started() {
		final ResourceFactory resourceFactory = ResourceFactory.getInstance();
		final ResourceProvider resourceProvider = resourceFactory.getResourceProviders().get(providerName);
		final File formsDir = resourceProvider.getResource(formsPath);
		final List<String> formPaths = new ArrayList<String>();
		// Scanning the forms resources folder
		if (formsDir != null && formsDir.listFiles() != null) {
			for (File file : formsDir.listFiles())
				formPaths.add(formsPath + file.getName());
		}
		final FormService formService = Context.getFormService();
		final HtmlFormEntryService hfeService = Context.getService(HtmlFormEntryService.class);
		if (formPaths.size() > 0) {
			for (String formPath : formPaths) {
				// Save form
				try {
					HtmlFormUtil.getHtmlFormFromUiResource(resourceFactory, formService, hfeService, providerName, formPath);
				}
				catch (IOException e) {
					log.error("Could not generate HTML form from the following resource file: " + formPath, e);
				}
				catch (IllegalArgumentException e) {
					log.error("Error while parsing the form's XML: " + formPath, e);
				}
			}
		}
	}
	
	@Override
	public void stopped() {
		
	}
}
