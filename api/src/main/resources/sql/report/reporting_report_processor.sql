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

 Date: 12/11/2020 20:41:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for reporting_report_processor
-- ----------------------------
DROP TABLE IF EXISTS `reporting_report_processor`;
CREATE TABLE `reporting_report_processor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `processor_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `configuration` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `run_on_success` tinyint(1) NOT NULL DEFAULT 1,
  `run_on_error` tinyint(1) NOT NULL DEFAULT 0,
  `creator` int(11) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) NULL DEFAULT NULL,
  `date_changed` datetime NULL DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) NULL DEFAULT NULL,
  `date_retired` datetime NULL DEFAULT NULL,
  `retire_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_design_id` int(11) NULL DEFAULT NULL,
  `processor_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uuid`(`uuid`) USING BTREE,
  INDEX `creator_for_reporting_report_processor`(`creator`) USING BTREE,
  INDEX `changed_by_for_reporting_report_processor`(`changed_by`) USING BTREE,
  INDEX `retired_by_for_reporting_report_processor`(`retired_by`) USING BTREE,
  INDEX `reporting_report_processor_report_design`(`report_design_id`) USING BTREE,
  CONSTRAINT `changed_by_for_reporting_report_processor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `creator_for_reporting_report_processor` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reporting_report_processor_report_design` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `retired_by_for_reporting_report_processor` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
