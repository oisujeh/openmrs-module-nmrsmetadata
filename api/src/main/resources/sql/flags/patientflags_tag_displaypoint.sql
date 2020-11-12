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

 Date: 12/11/2020 20:38:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patientflags_tag_displaypoint
-- ----------------------------
DROP TABLE IF EXISTS `patientflags_tag_displaypoint`;
CREATE TABLE `patientflags_tag_displaypoint`  (
  `tag_id` int(11) NOT NULL,
  `displaypoint_id` int(11) NOT NULL,
  INDEX `tag_displaypoint_id`(`tag_id`) USING BTREE,
  INDEX `patientflags_tag_displaypoint_ibfk_2`(`displaypoint_id`) USING BTREE,
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_2` FOREIGN KEY (`displaypoint_id`) REFERENCES `patientflags_displaypoint` (`displaypoint_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
