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

 Date: 12/11/2020 20:38:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patientflags_tag
-- ----------------------------
DROP TABLE IF EXISTS `patientflags_tag`;
CREATE TABLE `patientflags_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `patientflags_tag_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patientflags_tag
-- ----------------------------
INSERT INTO `patientflags_tag` VALUES (1, 'sys developer', NULL, 1, '2019-09-27 09:14:59', NULL, NULL, 0, NULL, NULL, NULL, '3883d897-cac5-4e3e-803d-788cbd075b45');

SET FOREIGN_KEY_CHECKS = 1;
