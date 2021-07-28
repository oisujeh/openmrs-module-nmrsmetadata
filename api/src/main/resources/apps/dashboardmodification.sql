
REPLACE INTO `appframework_user_app` (`app_id`,`json`) VALUES
(
  'nextappointment.latestObsForConceptList',
  '{
  "id": "nextappointment.latestObsForConceptList",
  "instanceOf": "coreapps.template.dashboardWidget",
  "description": "coreapps.latestObsForConceptList.app.description",
  "order": 21,
  "config": {
    "widget": "latestobsforconceptlist",
    "obsGroupLabels": "FSN",
    "icon": "icon-user-md",
    "label": "Next Drug Refill Date",
    "concepts": "2200BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
  },
  "extensions": [
    {
      "id": "org.openmrs.module.coreapps.mostRecentVitals.clinicianDashboardFirstColumn",
      "appId": "nextappointment.latestObsForConceptList",
      "extensionPointId": "patientDashboard.firstColumnFragments",
      "extensionParams": {
        "provider": "coreapps",
        "fragment": "dashboardwidgets/dashboardWidget"
      }
    }
  ]
}'
);

REPLACE INTO `appframework_user_app` (`app_id`,`json`) VALUES
(
  'patientEncountersByType',
  '{
    "id": "patientEncountersByType",
    "description": "Patient Encounter by Type",
    "order": 7,
    "extensions": [
        {
        "id": "patientEncountersByType",
        "extensionPointId": "patientDashboard.overallActions",
        "type": "link",
        "label": "Past Encounters",
        "url": "nmrsclinicals/encounterbytype.page?patientId={{patient.uuid}}",
        "icon": "icon-hand-down ",
        "order": 1,
        "requiredPrivilege": "Some required privilege like ''Task: coreapps.createVisit''"
    }
    ]
}'
);

REPLACE INTO `appframework_user_app` (`app_id`,`json`) VALUES
(
  'referenceapplication.registrationapp.myRegisterPa',
  '    {
        "id": "referenceapplication.registrationapp.myRegisterPa",
        "instanceOf": "registrationapp.registerPatient",
        "label": "Register Patient",
        "description": "Create a new Patient Record",
        "extensions": [
            {
                "id": "referenceapplication.registrationapp.registerPatient.homepageLink",
                "extensionPointId": "org.openmrs.referenceapplication.homepageLink",
                "type": "link",
                "label": "referenceapplication.app.registerPatient.label",
                "url": "registrationapp/registerPatient.page?appId=referenceapplication.registrationapp.myRegisterPa",
                "icon": "icon-user",
                "order": 1,
                "requiredPrivilege": "App: registrationapp.registerPatient"
            }
        ],
        "config": {
			"allowUnknownPatients":false,
			"allowManualIdentifier":false,
			"allowRetrospectiveEntry":true,
            "afterCreatedUrl": "/htmlformentryui/htmlform/enterHtmlFormWithStandardUi.page?patientId={{patientId}}&formUuid=ba30ac98-1c5d-4e93-84b7-54e3f6e1796e&returnUrl=%2Fopenmrs%2Fcoreapps%2Fclinicianfacing%2Fpatient.page%3FpatientId%3Da2dde911-f71f-4a17-82c7-c171a704d44f%26",
            "sections": [
                {
                    "id": "contactInfo",
                    "label": "registrationapp.patient.contactInfo.label",
                    "questions": [
                        {
                            "legend": "Person.address",
                            "fields": [
                                {
                                    "type": "personAddress",
                                    "label": "registrationapp.patient.address.question",
                                    "widget": {
                                        "providerName": "registrationapp",
                                        "fragmentId": "field/personAddressWithHierarchy",
                                        "config" : {
                                            "shortcutFor": "address1",
                                            "manualFields": ["address2"],
                                            "required": true
                                            }
                                    }
                                }
                            ]
                        },
                        {
                            "legend": "registrationapp.patient.phone.label",
                            "id": "phoneNumberLabel",
                            "fields": [
                                {
                                    "type": "personAttribute",
                                    "label": "registrationapp.patient.phone.question",
                                    "formFieldName": "phoneNumber",
                                    "uuid": "14d4f066-15f5-102d-96e4-000c29c2a5d7",
                                    "widget": {
                                        "providerName": "uicommons",
                                        "fragmentId": "field/text"
                                    },
                                    "cssClasses": ["phone"]
                                }]
                        }

                    ]
                },
                {
                    "id": "relationships-info",
                    "label": "registrationapp.person.relationship",
                    "questions": [
                        {
                            "legend": "registrationapp.person.relationship.label",
                            "header": "registrationapp.person.relationship.question",
                            "fields": [
                                {
                                    "type": "personRelationships",
                                    "widget": {
                                        "providerName": "registrationapp",
                                        "fragmentId": "field/personRelationship"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "id": "hospital-ids",
                    "label": "Patient Identifier",
                    "questions": [
                        {
                            "legend": "Hospital Number",
                            "id": "OpenMRS_ID_patientIdentifier",
                            "fields": [
                                {
                                    "type": "patientIdentifier",
                                    "label": "Hospital Number",
                                    "formFieldName": "HospitalNumberId",
                                    "uuid": "fd0df06c-fcd4-4625-89b2-6b72ca44b8ed",
                                    "widget": {
                                        "providerName": "uicommons",
                                        "fragmentId": "field/text"
                                    },
                                    "cssClasses": [""]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    }

'
);

UPDATE `delta_ch_agbor`.`address_hierarchy_level` SET `required`='1' WHERE `address_hierarchy_level_id`='5';
UPDATE `delta_ch_agbor`.`address_hierarchy_level` SET `required`='1' WHERE `address_hierarchy_level_id`='3';
UPDATE `delta_ch_agbor`.`address_hierarchy_level` SET `required`='1' WHERE `address_hierarchy_level_id`='2';
UPDATE `delta_ch_agbor`.`address_hierarchy_level` SET `required`='1' WHERE `address_hierarchy_level_id`='1';