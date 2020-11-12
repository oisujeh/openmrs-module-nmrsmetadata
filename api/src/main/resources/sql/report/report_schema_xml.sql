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

 Date: 12/11/2020 20:41:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for report_schema_xml
-- ----------------------------
DROP TABLE IF EXISTS `report_schema_xml`;
CREATE TABLE `report_schema_xml`  (
  `report_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xml_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uuid` char(38) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`report_schema_id`) USING BTREE,
  UNIQUE INDEX `report_schema_xml_uuid_index`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
