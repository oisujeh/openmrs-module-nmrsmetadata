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

 Date: 12/11/2020 20:38:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patientflags_flag_tag
-- ----------------------------
DROP TABLE IF EXISTS `patientflags_flag_tag`;
CREATE TABLE `patientflags_flag_tag`  (
  `flag_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  INDEX `flag_id`(`flag_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `patientflags_flag_tag_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `patientflags_flag` (`flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patientflags_flag_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patientflags_flag_tag
-- ----------------------------
INSERT INTO `patientflags_flag_tag` VALUES (3, 1);
INSERT INTO `patientflags_flag_tag` VALUES (4, 1);
INSERT INTO `patientflags_flag_tag` VALUES (9, 1);
INSERT INTO `patientflags_flag_tag` VALUES (7, 1);
INSERT INTO `patientflags_flag_tag` VALUES (14, 1);
INSERT INTO `patientflags_flag_tag` VALUES (5, 1);
INSERT INTO `patientflags_flag_tag` VALUES (1, 1);
INSERT INTO `patientflags_flag_tag` VALUES (2, 1);
INSERT INTO `patientflags_flag_tag` VALUES (13, 1);
INSERT INTO `patientflags_flag_tag` VALUES (8, 1);
INSERT INTO `patientflags_flag_tag` VALUES (10, 1);
INSERT INTO `patientflags_flag_tag` VALUES (12, 1);
INSERT INTO `patientflags_flag_tag` VALUES (11, 1);
INSERT INTO `patientflags_flag_tag` VALUES (6, 1);

SET FOREIGN_KEY_CHECKS = 1;
