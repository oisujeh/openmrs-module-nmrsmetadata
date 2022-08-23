package org.openmrs.module.nmrsmetadata;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.openmrs.Form;
import org.openmrs.FormResource;
import org.openmrs.api.FormService;
import org.openmrs.api.context.Context;
import org.openmrs.ui.framework.resource.ResourceFactory;
import org.openmrs.ui.framework.resource.ResourceProvider;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class JsonFormsInitializer implements Initializer {
	
	protected static final String providerName = "nmrsmetadata-poc";
	
	protected static final String formsPath = "jsonforms/";
	
	protected static final Log log = LogFactory.getLog(JsonFormsInitializer.class);
	
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
		
		if (formPaths.size() > 0) {
			for (String formPath : formPaths) {
				// Save form
				try {
					String json = resourceFactory.getResourceAsString(providerName, formPath);
					
					if (json != null) {
						Map valueReference = new ObjectMapper().readValue(json, Map.class);
						
						Form form = formService.getFormByUuid((String) valueReference.get("uuid"));
						
						if (form != null) {
							Collection<FormResource> formResource2 = formService.getFormResourcesForForm(form);
							
							FormResource formResourceL = new FormResource();
							for (FormResource e : formResource2)
								formResourceL = e;
							
							FormResource formResource = formService.getFormResource(formResourceL.getFormResourceId());
							
							if (formResource == null) {
								formResource = new FormResource();
								formResource.setForm(form);
								formResource.setName("json");
								formResource.setValueReferenceInternal(json);
								formResource.setValue(json);
								formResource.setDatatypeClassname("org.openmrs.customdatatype.datatype.FreeTextDatatype");
								formService.saveFormResource(formResource);
							} else {
								FormResource newFormResource = new FormResource(formResource);
								newFormResource.setValueReferenceInternal(json);
								newFormResource.setValue(json);
								formService.saveFormResource(newFormResource);
							}
						}
					}
				}
				catch (Exception e) {
					log.error("Could not generate Json form from the following resource file: " + formPath, e);
				}
			}
		}
	}
	
	@Override
	public void stopped() {
		
	}
}
