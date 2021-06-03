
/**
 * Author:  The Melody
 * Created: Jun 04, 2021
 */
/*
  App to display patient tracking outcome on patient's dashboard
 */
REPLACE INTO `appframework_user_app` (`app_id`,`json`) VALUES
(
  'patient.lastTrackingOutcome',
  '{
  "id": "patient.lastTrackingOutcome",
  "instanceOf": "coreapps.template.dashboardWidget",
  "description": "coreapps.latestObsForConceptList.app.description",
  "order": 20,
  "config": {
    "widget": "latestobsforconceptlist",
    "obsGroupLabels": "FSN",
    "icon": "icon-user-md",
    "label": "Tracking Outcome",
    "concepts": "c2010e51-528a-4e9d-8478-df8cdfdbc484"
  },
  "extensions": [
    {
      "id": "org.openmrs.module.coreapps.mostRecentVitals.clinicianDashboardFirstColumn",
      "appId": "patient.lastTrackingOutcome",
      "extensionPointId": "patientDashboard.firstColumnFragments",
      "extensionParams": {
        "provider": "coreapps",
        "fragment": "dashboardwidgets/dashboardWidget"
      }
    }
  ]
}'
);
