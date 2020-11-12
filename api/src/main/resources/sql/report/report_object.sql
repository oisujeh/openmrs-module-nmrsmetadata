/*
 Navicat MySQL Data Transfer

 Source Server         : nmrs
 Source Server Type    : MySQL
 Source Server Version : 50509
 Source Host           : localhost:3316
 Source Schema         : openmrs

 Target Server Type    : MySQL
 Target Server Version : 50509
 File Encoding         : 65001

 Date: 12/11/2020 20:40:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for report_object
-- ----------------------------
DROP TABLE IF EXISTS `report_object`;
CREATE TABLE `report_object`  (
  `report_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_object_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `report_object_sub_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xml_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) NULL DEFAULT NULL,
  `date_changed` datetime NULL DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT 0,
  `voided_by` int(11) NULL DEFAULT NULL,
  `date_voided` datetime NULL DEFAULT NULL,
  `void_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`report_object_id`) USING BTREE,
  UNIQUE INDEX `report_object_uuid_index`(`uuid`) USING BTREE,
  INDEX `user_who_changed_report_object`(`changed_by`) USING BTREE,
  INDEX `report_object_creator`(`creator`) USING BTREE,
  INDEX `user_who_voided_report_object`(`voided_by`) USING BTREE,
  CONSTRAINT `report_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_who_changed_report_object` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_who_voided_report_object` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of report_object
-- ----------------------------
INSERT INTO `report_object` VALUES (1, 'test', NULL, 'Data Export', 'Data Export', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<java version=\"1.8.0_151\" class=\"java.beans.XMLDecoder\">\n <object class=\"org.openmrs.reporting.export.DataExportReportObject\" id=\"DataExportReportObject0\">\n  <void property=\"columns\">\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.SimpleColumn\">\n     <void property=\"columnName\">\n      <string>Enrollment (PEPFAR) Number</string>\n     </void>\n     <void property=\"returnValue\">\n      <string>$!{fn.getPatientIdentifier(&apos;4&apos;)}</string>\n     </void>\n    </object>\n   </void>\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.SimpleColumn\">\n     <void property=\"columnName\">\n      <string>Hospital Number</string>\n     </void>\n     <void property=\"returnValue\">\n      <string>$!{fn.getPatientIdentifier(&apos;5&apos;)}</string>\n     </void>\n    </object>\n   </void>\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.ConceptColumn\">\n     <void property=\"columnName\">\n      <string>HIV VIRAL LOAD</string>\n     </void>\n     <void property=\"conceptId\">\n      <int>856</int>\n     </void>\n     <void property=\"extras\">\n      <array class=\"java.lang.String\" length=\"1\">\n       <void index=\"0\">\n        <string>obsDatetime</string>\n       </void>\n      </array>\n     </void>\n     <void property=\"modifier\">\n      <string>mostRecent</string>\n     </void>\n    </object>\n   </void>\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.ConceptColumn\">\n     <void property=\"columnName\">\n      <string>CD4 COUNT</string>\n     </void>\n     <void property=\"conceptId\">\n      <int>5497</int>\n     </void>\n     <void property=\"extras\">\n      <array class=\"java.lang.String\" length=\"1\">\n       <void index=\"0\">\n        <string>obsDatetime</string>\n       </void>\n      </array>\n     </void>\n     <void property=\"modifier\">\n      <string>mostRecent</string>\n     </void>\n    </object>\n   </void>\n  </void>\n  <void property=\"name\">\n   <string>test</string>\n  </void>\n  <void property=\"uuid\">\n   <string>9615e632-79f2-4735-9600-302120430b88</string>\n  </void>\n </object>\n</java>\n', 1, '2019-06-26 22:24:25', NULL, NULL, 0, NULL, NULL, NULL, '86222f73-a1a2-4ea3-9e5e-408d4839c553');
INSERT INTO `report_object` VALUES (2, 'ggtrgtht', NULL, 'Data Export', 'Data Export', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<java version=\"1.8.0_222\" class=\"java.beans.XMLDecoder\">\n <object class=\"org.openmrs.reporting.export.DataExportReportObject\" id=\"DataExportReportObject0\">\n  <void property=\"columns\">\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.SimpleColumn\">\n     <void property=\"columnName\">\n      <string>Given</string>\n     </void>\n     <void property=\"returnValue\">\n      <string>$!{fn.getPatientAttr(&apos;PersonName&apos;, &apos;givenName&apos;)}</string>\n     </void>\n    </object>\n   </void>\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.SimpleColumn\">\n     <void property=\"columnName\">\n      <string>Family Name</string>\n     </void>\n     <void property=\"returnValue\">\n      <string>$!{fn.getPatientAttr(&apos;PersonName&apos;, &apos;familyName&apos;)}</string>\n     </void>\n    </object>\n   </void>\n   <void method=\"add\">\n    <object class=\"org.openmrs.reporting.export.SimpleColumn\">\n     <void property=\"columnName\">\n      <string>ART Number</string>\n     </void>\n     <void property=\"returnValue\">\n      <string>$!{fn.getPatientIdentifier(&apos;4&apos;)}</string>\n     </void>\n    </object>\n   </void>\n  </void>\n  <void property=\"id\">\n   <int>2</int>\n  </void>\n  <void property=\"name\">\n   <string>ggtrgtht</string>\n  </void>\n  <void property=\"uuid\">\n   <string>600a1462-1762-448a-b561-d50509bc5684</string>\n  </void>\n </object>\n</java>\n', 1, '2019-09-27 12:48:13', 1, '2019-09-27 12:48:44', 0, NULL, NULL, NULL, '600a1462-1762-448a-b561-d50509bc5684');

SET FOREIGN_KEY_CHECKS = 1;
