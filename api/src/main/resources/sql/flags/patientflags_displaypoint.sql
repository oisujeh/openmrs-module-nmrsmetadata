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

 Date: 12/11/2020 20:37:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patientflags_displaypoint
-- ----------------------------
DROP TABLE IF EXISTS `patientflags_displaypoint`;
CREATE TABLE `patientflags_displaypoint`  (
  `displaypoint_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) NULL DEFAULT NULL,
  `date_changed` datetime NULL DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT 0,
  `retired_by` int(11) NULL DEFAULT NULL,
  `date_retired` datetime NULL DEFAULT NULL,
  `retire_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uuid` char(38) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`displaypoint_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
