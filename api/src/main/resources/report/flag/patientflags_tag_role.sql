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

 Date: 07/09/2020 10:34:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Records of patientflags_tag_role
-- ----------------------------
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Adherence');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Anonymous');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Administers System');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Appointment Scheduling');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Forms');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Configures Metadata');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Edits Existing Encounters');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Enters ADT Events');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Enters Vitals');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Has Super User Privileges');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Manages Atlas');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Manages Provider Schedules');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Records Allergies');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Registers Patients');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Requests Appointments');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Schedules And Overbooks Appointments');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Schedules Appointments');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Sees Appointment Schedule');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Uses Capture Vitals App');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Uses Patient Summary');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Application: Writes Clinical Notes');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Authenticated');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Careandsupport');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Clinician');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Dataclerk');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Lab');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Organizational: Doctor');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Organizational: Hospital Administrator');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Organizational: Nurse');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Organizational: Registration Clerk');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Organizational: System Administrator');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Pharmacist');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Privilege Level: Full');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Privilege Level: High');
REPLACE INTO `patientflags_tag_role` VALUES (1, 'Provider');

SET FOREIGN_KEY_CHECKS = 1;
