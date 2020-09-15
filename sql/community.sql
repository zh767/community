/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云2 MySQL
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 101.200.154.195:3306
 Source Schema         : community

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 15/09/2020 23:53:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `gmt_start` bigint(20) NULL DEFAULT NULL,
  `gmt_end` bigint(20) NULL DEFAULT NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `pos` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `commentator` bigint(20) NOT NULL,
  `gmt_create` bigint(20) NOT NULL,
  `gmt_modified` bigint(20) NOT NULL,
  `like_count` bigint(20) NULL DEFAULT 0,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, 1, 1600183550790, 1600183550790, 0, '123', 2);
INSERT INTO `comment` VALUES (2, 1, 2, 1, 1600183555131, 1600183555131, 0, '312', NULL);
INSERT INTO `comment` VALUES (3, 1, 2, 1, 1600183560422, 1600183560422, 0, '1321111', NULL);
INSERT INTO `comment` VALUES (4, 2, 1, 1, 1600183658132, 1600183658132, 0, '不错', 2);
INSERT INTO `comment` VALUES (5, 4, 2, 1, 1600183664253, 1600183664253, 0, '说的对', NULL);
INSERT INTO `comment` VALUES (6, 4, 2, 1, 1600183669510, 1600183669510, 0, '嗯嗯', NULL);
INSERT INTO `comment` VALUES (7, 4, 1, 1, 1600184075675, 1600184075675, 0, 'aqaz', 0);
INSERT INTO `comment` VALUES (8, 8, 1, 1, 1600184157214, 1600184157214, 0, '123', 0);

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '1', 'Create user table', 'SQL', 'V1__Create_user_table.sql', -455966630, 'root', '2020-09-15 22:51:34', 155, 1);
INSERT INTO `flyway_schema_history` VALUES (2, '2', 'Add bio col to user table', 'SQL', 'V2__Add_bio_col_to_user_table.sql', -1023348034, 'root', '2020-09-15 22:51:34', 178, 1);
INSERT INTO `flyway_schema_history` VALUES (3, '3', 'Create question table', 'SQL', 'V3__Create_question_table.sql', -1507234838, 'root', '2020-09-15 22:51:35', 154, 1);
INSERT INTO `flyway_schema_history` VALUES (4, '4', 'Add avatar url to user table', 'SQL', 'V4__Add_avatar_url_to_user_table.sql', -569878267, 'root', '2020-09-15 22:51:35', 172, 1);
INSERT INTO `flyway_schema_history` VALUES (5, '5', 'Create comment table', 'SQL', 'V5__Create_comment_table.sql', -1827362333, 'root', '2020-09-15 22:51:36', 154, 1);
INSERT INTO `flyway_schema_history` VALUES (6, '6', 'Add content to comment table', 'SQL', 'V6__Add_content_to_comment_table.sql', 310873417, 'root', '2020-09-15 22:51:36', 165, 1);
INSERT INTO `flyway_schema_history` VALUES (7, '7', 'Change id column type', 'SQL', 'V7__Change_id_column_type.sql', 297438663, 'root', '2020-09-15 22:51:37', 293, 1);
INSERT INTO `flyway_schema_history` VALUES (8, '8', 'Change creator column type', 'SQL', 'V8__Change_creator_column_type.sql', 216027660, 'root', '2020-09-15 22:51:38', 342, 1);
INSERT INTO `flyway_schema_history` VALUES (9, '9', 'Add comment count to comment table', 'SQL', 'V9__Add_comment_count_to_comment_table.sql', 1336498195, 'root', '2020-09-15 22:51:38', 204, 1);
INSERT INTO `flyway_schema_history` VALUES (10, '10', 'Create notification table', 'SQL', 'V10__Create_notification_table.sql', -2134859776, 'root', '2020-09-15 22:51:39', 194, 1);
INSERT INTO `flyway_schema_history` VALUES (11, '11', 'Add name and title to notification table', 'SQL', 'V11__Add_name_and_title_to_notification_table.sql', -51660302, 'root', '2020-09-15 22:51:40', 333, 1);
INSERT INTO `flyway_schema_history` VALUES (12, '12', 'Change id column type', 'SQL', 'V12__Change_id_column_type.sql', -1086591921, 'root', '2020-09-15 22:51:41', 347, 1);
INSERT INTO `flyway_schema_history` VALUES (13, '13', 'Create nav table', 'SQL', 'V13__Create_nav_table.sql', 920296989, 'root', '2020-09-15 22:51:41', 190, 1);
INSERT INTO `flyway_schema_history` VALUES (14, '14', 'Create ad table', 'SQL', 'V14__Create_ad_table.sql', -1944623777, 'root', '2020-09-15 22:51:42', 199, 1);

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT 0,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nav
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notifier` bigint(20) NOT NULL,
  `receiver` bigint(20) NOT NULL,
  `outerid` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `gmt_create` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `notifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `outer_title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  `comment_count` int(11) NULL DEFAULT 0,
  `view_count` int(11) NULL DEFAULT 0,
  `like_count` int(11) NULL DEFAULT 0,
  `tag` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '421', '![](http://zh767.oss-cn-beijing.aliyuncs.com/20200915/16001834379771621.jpg)\r\n\r\n```java\r\n@GetMapping(\"/logout\")\r\n    public String logout(HttpServletRequest request,\r\n                         HttpServletResponse response) {\r\n        request.getSession().removeAttribute(\"user\");\r\n        Cookie cookie = new Cookie(\"token\", null);\r\n        cookie.setMaxAge(0);\r\n        response.addCookie(cookie);\r\n        return \"redirect:/\";\r\n    }\r\n```', 1600183468651, 1600183524354, 1, 1, 6, 0, 'css');
INSERT INTO `question` VALUES (2, 'spring boot', '使用阿里云的oss上传图片\r\n\r\n```java\r\n@RequestMapping(\"/file/upload\")\r\n    @ResponseBody\r\n    public FileDTO upload(HttpServletRequest request) {\r\n        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;\r\n        MultipartFile multipartFile = multipartRequest.getFile(\"editormd-image-file\");\r\n        FileDTO fileDTO = new FileDTO();\r\n\r\n        // 2. 准备上传API的参数\r\n        SimpleDateFormat sdf = new SimpleDateFormat(\"yyyyMMdd\");\r\n        String fileName = multipartFile.getOriginalFilename();\r\n        String finalFileName = System.currentTimeMillis() + \"\" + new SecureRandom().nextInt(0x0400) + fileName;\r\n        String filePath = sdf.format(new Date()) + \"/\" + finalFileName;\r\n\r\n        // 3. 上传至阿里OSS\r\n        try {\r\n            ossClient.putObject(aliyunConfig.getBucketName(), filePath, new ByteArrayInputStream(multipartFile.getBytes()));\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n            // 上传失败\r\n            fileDTO.setSuccess(0);\r\n            fileDTO.setMessage(\"error\");\r\n            return fileDTO;\r\n        }\r\n        // 上传成功\r\n        fileDTO.setMessage(\"done\");\r\n        // 文件名(即直接访问的完整路径)\r\n        fileDTO.setSuccess(1);\r\n        fileDTO.setUrl(aliyunConfig.getUrlPrefix() + filePath);\r\n        return fileDTO;\r\n    }\r\n```', 1600183633206, 1600183633206, 1, 1, 5, 0, 'java');
INSERT INTO `question` VALUES (3, 'test123', 'test123', 1600184036768, 1600184036768, 1, 0, 1, 0, 'javascript,scala,coffeescript');
INSERT INTO `question` VALUES (4, 'test241', '###### 哈哈哈\r\ntest132111', 1600184066999, 1600184066999, 1, 1, 2, 0, 'sublime-text,xcode intellij-idea');
INSERT INTO `question` VALUES (5, 'haha', 'gagag', 1600184090359, 1600184090359, 1, 0, 0, 0, 'html');
INSERT INTO `question` VALUES (6, 'test12333', '33333', 1600184101600, 1600184101600, 1, 0, 0, 0, 'django');
INSERT INTO `question` VALUES (7, 'qwe', 'qwe', 1600184111544, 1600184111544, 1, 0, 0, 0, 'html5');
INSERT INTO `question` VALUES (8, 'spring ioc aop', 'spring **ioc** **aop**', 1600184149890, 1600184149890, 1, 1, 2, 0, 'css,html');
INSERT INTO `question` VALUES (9, 'springboot1', 'spring123', 1600184179348, 1600184179348, 1, 0, 0, 0, 'c');
INSERT INTO `question` VALUES (10, 'zxcdsa', 'dsaaada', 1600184188864, 1600184188864, 1, 0, 0, 0, 'html5');
INSERT INTO `question` VALUES (11, 'asda', 'dsadas', 1600184203265, 1600184203265, 1, 0, 0, 0, 'shell');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `bio` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `avatar_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '62821221', 'zh767', 'c4d31829-c5fd-414a-b3eb-0b2b5bd044b9', 1600183406399, 1600183406399, NULL, 'https://avatars3.githubusercontent.com/u/62821221?v=4');

SET FOREIGN_KEY_CHECKS = 1;
