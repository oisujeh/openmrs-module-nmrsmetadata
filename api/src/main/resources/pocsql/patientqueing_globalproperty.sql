SET FOREIGN_KEY_CHECKS=0;
UPDATE global_property SET property_value='b1a8b05e-3542-4037-bbd3-998ee9c40574,2131aff8-2e2a-480a-b7ab-4ac53250262b,58c57d25-8d39-41ab-8422-108a0c277d98,7f65d926-57d6-4402-ae10-a5b3bcbf7986,7fdfa2cb-bc95-405a-88c6-32b7673c0453,aff27d58-a15c-49a6-9beb-d30dcfc0c66e,8ae6ceea-1891-44f4-8f45-55ba7c12a2d0,be7e1e5c-9bb1-4a0d-9683-4662b31b18dc,22294cb2-739a-43d2-8689-82bc42ca09da,fb1fc5b5-d2e6-4d2b-a8df-28c059d86991,8114f65f-53ca-444d-8e46-abc67b614692,270c34e0-814c-442b-8a1b-55fe4bd76afc' WHERE property='patientqueueing.clinicianLocationUUIDS';
UPDATE global_property
SET property_value='<org.openmrs.layout.address.AddressTemplate>\n<nameMappings class=\"properties\">\n
			        <property name=\"postalCode\" value=\"Location.postalCode\"/>\n
			        <property name=\"address2\" value=\"Location.address2\"/>\n
			        <property name=\"address1\" value=\"Location.address1\"/>\n
			        <property name=\"country\" value=\"Location.country\"/>\n
			        <property name=\"stateProvince\" value=\"State\"/>\n
			        <property name=\"cityVillage\" value=\"Local Govt.\"/>\n</nameMappings>\n
			        <sizeMappings class=\"properties\">\n<property name=\"postalCode\" value=\"10\"/>\n
			        <property name=\"address2\" value=\"40\"/>\n<property name=\"address1\" value=\"40\"/>\n
			        <property name=\"country\" value=\"10\"/>\n<property name=\"stateProvince\" value=\"10\"/>\n
			        <property name=\"cityVillage\" value=\"10\"/>\n</sizeMappings>\n<lineByLineFormat>\n
			        <string>address1</string>\n<string>address2</string>\n
			        <string>cityVillage stateProvince country postalCode</string>\n</lineByLineFormat>\n
			        </org.openmrs.layout.address.AddressTemplate>'
WHERE property='layout.address.format';

SET FOREIGN_KEY_CHECKS=1;