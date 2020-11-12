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

 Date: 12/11/2020 20:38:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patientflags_tag_role
-- ----------------------------
DROP TABLE IF EXISTS `patientflags_tag_role`;
CREATE TABLE `patientflags_tag_role`  (
  `tag_id` int(11) NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `role`(`role`) USING BTREE,
  INDEX `tag_role_id`(`tag_id`) USING BTREE,
  CONSTRAINT `patientflags_tag_role_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patientflags_tag_role_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patientflags_tag_role
-- ----------------------------
INSERT INTO `patientflags_tag_role` VALUES (1, 'Adherence');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Anonymous');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Administers System');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Appointment Scheduling');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Forms');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Metadata');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Edits Existing Encounters');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Enters ADT Events');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Enters Vitals');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Has Super User Privileges');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Manages Atlas');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Manages Provider Schedules');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Records Allergies');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Registers Patients');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Requests Appointments');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Schedules And Overbooks Appointments');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Schedules Appointments');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Sees Appointment Schedule');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Uses Capture Vitals App');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Uses Patient Summary');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Application: Writes Clinical Notes');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Authenticated');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Careandsupport');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Clinician');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Dataclerk');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Lab');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Organizational: Doctor');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Organizational: Hospital Administrator');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Organizational: Nurse');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Organizational: Registration Clerk');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Organizational: System Administrator');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Pharmacist');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Privilege Level: Full');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Privilege Level: High');
INSERT INTO `patientflags_tag_role` VALUES (1, 'Provider');

SET FOREIGN_KEY_CHECKS = 1;
