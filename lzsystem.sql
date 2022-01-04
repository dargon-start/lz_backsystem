/*
 Navicat Premium Data Transfer

 Source Server         : longzai
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : lzsystem

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 03/01/2022 19:21:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (1, '1640619114739.png', 'image/png', 140805, 9, '2021-12-27 23:31:54', '2021-12-27 23:31:54');
INSERT INTO `avatar` VALUES (2, '1640622338229.png', 'image/png', 140805, 9, '2021-12-28 00:25:38', '2021-12-28 00:25:38');
INSERT INTO `avatar` VALUES (3, '1640622384546.png', 'image/png', 140805, 9, '2021-12-28 00:26:24', '2021-12-28 00:26:24');
INSERT INTO `avatar` VALUES (4, '1640622429769.png', 'image/png', 140805, 9, '2021-12-28 00:27:09', '2021-12-28 00:27:09');
INSERT INTO `avatar` VALUES (5, '1640622478566.png', 'image/png', 140805, 9, '2021-12-28 00:27:58', '2021-12-28 00:27:58');
INSERT INTO `avatar` VALUES (6, '1640622529845.png', 'image/png', 140805, 9, '2021-12-28 00:28:49', '2021-12-28 00:28:49');
INSERT INTO `avatar` VALUES (7, '1640622568243.png', 'image/png', 140805, 9, '2021-12-28 00:29:28', '2021-12-28 00:29:28');
INSERT INTO `avatar` VALUES (8, '1640622617399.png', 'image/png', 140805, 9, '2021-12-28 00:30:17', '2021-12-28 00:30:17');
INSERT INTO `avatar` VALUES (9, '1640622683260.png', 'image/png', 140805, 9, '2021-12-28 00:31:23', '2021-12-28 00:31:23');
INSERT INTO `avatar` VALUES (10, '1640622794114.png', 'image/png', 140805, 9, '2021-12-28 00:33:14', '2021-12-28 00:33:14');
INSERT INTO `avatar` VALUES (11, '1641184245333.png', 'image/png', 140805, 9, '2022-01-03 12:30:45', '2022-01-03 12:30:45');
INSERT INTO `avatar` VALUES (12, '1641184582080.png', 'image/png', 140805, 9, '2022-01-03 12:36:22', '2022-01-03 12:36:22');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (3, '你说的不对。', 6, 9, NULL);
INSERT INTO `comment` VALUES (6, '66666', 6, 9, NULL);
INSERT INTO `comment` VALUES (8, '66666', 1, 11, NULL);
INSERT INTO `comment` VALUES (9, '写的太棒了', 2, 11, NULL);
INSERT INTO `comment` VALUES (10, '写的太棒了', 4, 11, NULL);
INSERT INTO `comment` VALUES (11, '哇，你说的太棒了。', 6, 11, 3);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mimetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `moment_id` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `filename`(`filename`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `moment_id`(`moment_id`) USING BTREE,
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (3, '1641188823010.webp', 'image/webp', 9458, 9, 6, '2022-01-03 13:47:03', '2022-01-03 13:47:03');
INSERT INTO `file` VALUES (4, '1641188823012.png', 'image/png', 38591, 9, 6, '2022-01-03 13:47:03', '2022-01-03 13:47:03');
INSERT INTO `file` VALUES (5, '1641188867430.webp', 'image/webp', 9458, 9, 6, '2022-01-03 13:47:47', '2022-01-03 13:47:47');
INSERT INTO `file` VALUES (6, '1641188867434.png', 'image/png', 38591, 9, 6, '2022-01-03 13:47:47', '2022-01-03 13:47:47');
INSERT INTO `file` VALUES (7, '1641192293393.png', 'image/png', 300294, 9, 6, '2022-01-03 14:44:54', '2022-01-03 14:44:54');
INSERT INTO `file` VALUES (8, '1641192293411.png', 'image/png', 40258, 9, 6, '2022-01-03 14:44:54', '2022-01-03 14:44:54');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, '前端', '2021-12-26 22:17:28', '2021-12-26 22:17:28');
INSERT INTO `label` VALUES (2, '后端', '2021-12-26 22:28:02', '2021-12-26 22:28:02');
INSERT INTO `label` VALUES (3, '爱情', '2021-12-27 15:11:58', '2021-12-27 15:11:58');
INSERT INTO `label` VALUES (4, '生活', '2021-12-27 15:11:58', '2021-12-27 15:11:58');
INSERT INTO `label` VALUES (9, '事业', '2021-12-27 15:42:05', '2021-12-27 15:42:05');
INSERT INTO `label` VALUES (11, '学习', '2021-12-27 16:04:51', '2021-12-27 16:04:51');
INSERT INTO `label` VALUES (12, '你好', '2021-12-27 16:05:27', '2021-12-27 16:05:27');
INSERT INTO `label` VALUES (13, '技术', '2021-12-27 16:06:38', '2021-12-27 16:06:38');
INSERT INTO `label` VALUES (14, '心情', '2021-12-27 16:06:38', '2021-12-27 16:06:38');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `creatat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, '今天的心情很棒啊！', 9, '2021-12-19 21:37:08', '2021-12-19 21:37:08');
INSERT INTO `moment` VALUES (2, '今天的心情很棒啊！', 9, '2021-12-19 21:37:31', '2021-12-19 21:37:31');
INSERT INTO `moment` VALUES (4, '有是忙碌的一天，疲惫有充实 ', 9, '2021-12-19 21:39:12', '2021-12-19 21:39:12');
INSERT INTO `moment` VALUES (5, '修改一下数据', 9, '2021-12-19 22:36:31', '2021-12-21 22:09:59');
INSERT INTO `moment` VALUES (6, 'hello word!', 4, '2021-12-19 23:10:58', '2021-12-21 22:18:33');
INSERT INTO `moment` VALUES (7, '曾几何时，他也好，她也好，都是这家伙的被害者。所以我才憎恶着。这个强求着所谓“大家”的世界。必须建立在牺牲某人之上才能成立的低劣的和平。以温柔和正义粉饰，明明是恶毒之物却登大雅之堂，随着时间的流逝越发凶恶，除欺瞒外别无其二的空虚的概念。过去和世界都是无法改变的。发生过的事情和所谓的“大家”都是无法改变的。但是，并不是说自己只能隶属于他们', 4, '2021-12-19 23:12:44', '2021-12-19 23:12:44');

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label`  (
  `moment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`, `label_id`) USING BTREE,
  INDEX `label_id`(`label_id`) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
INSERT INTO `moment_label` VALUES (1, 1, '2021-12-27 15:40:57', '2021-12-27 15:40:57');
INSERT INTO `moment_label` VALUES (1, 3, '2021-12-27 15:40:57', '2021-12-27 15:40:57');
INSERT INTO `moment_label` VALUES (1, 9, '2021-12-27 16:04:19', '2021-12-27 16:04:19');
INSERT INTO `moment_label` VALUES (1, 11, '2021-12-27 16:04:51', '2021-12-27 16:04:51');
INSERT INTO `moment_label` VALUES (1, 12, '2021-12-27 16:05:27', '2021-12-27 16:05:27');
INSERT INTO `moment_label` VALUES (2, 13, '2021-12-27 16:06:38', '2021-12-27 16:06:38');
INSERT INTO `moment_label` VALUES (2, 14, '2021-12-27 16:06:38', '2021-12-27 16:06:38');
INSERT INTO `moment_label` VALUES (6, 2, '2021-12-27 19:46:50', '2021-12-27 19:46:50');
INSERT INTO `moment_label` VALUES (6, 3, '2021-12-27 19:47:12', '2021-12-27 19:47:12');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creatat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'wang', '123456', '2021-12-13 22:25:13', '2021-12-13 22:25:13', NULL);
INSERT INTO `users` VALUES (3, '马腾飞', '1589789', '2021-12-13 23:16:32', '2021-12-13 23:16:32', NULL);
INSERT INTO `users` VALUES (4, '李鹏程', '1589789', '2021-12-13 23:18:09', '2021-12-13 23:18:09', NULL);
INSERT INTO `users` VALUES (5, '李官曦', '123456789', '2021-12-13 23:21:24', '2021-12-13 23:21:24', NULL);
INSERT INTO `users` VALUES (6, 'fef', '4564', '2021-12-16 20:32:24', '2021-12-16 20:32:24', NULL);
INSERT INTO `users` VALUES (7, 'cccf', '298f1ea88408dbaf076145c16cb9c688', '2021-12-16 20:40:38', '2021-12-16 20:40:38', NULL);
INSERT INTO `users` VALUES (8, 'abc', '13880c6d032683c5c26933463b6b7945', '2021-12-16 20:42:48', '2021-12-16 20:42:48', NULL);
INSERT INTO `users` VALUES (9, 'aaa', 'e10adc3949ba59abbe56e057f20f883e', '2021-12-16 22:17:42', '2021-12-28 00:33:14', 'http://localhost:8000/user/9/avatar');
INSERT INTO `users` VALUES (10, 'aa', 'e10adc3949ba59abbe56e057f20f883e', '2021-12-16 23:02:47', '2021-12-16 23:02:47', NULL);
INSERT INTO `users` VALUES (11, 'longzai', 'e10adc3949ba59abbe56e057f20f883e', '2021-12-23 09:45:47', '2021-12-23 09:45:47', NULL);

SET FOREIGN_KEY_CHECKS = 1;
