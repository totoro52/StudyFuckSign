/*
 Navicat Premium Data Transfer

 Source Server         : Totoro
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : sign.cn

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/05/2020 17:42:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '主面板', 'fa-bar-chart', '/', NULL, NULL, '2020-03-15 02:02:05');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '后台管理', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员列表', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, '令牌列表', 'fa-american-sign-language-interpreting', 'signTokens', NULL, '2020-03-15 02:04:16', '2020-03-15 16:40:22');
INSERT INTO `admin_menu` VALUES (9, 0, 9, '网站设置', 'fa-suitcase', 'settings', NULL, '2020-03-15 16:40:04', '2020-03-15 16:40:08');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-14 11:45:52', '2020-03-14 11:45:52');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-14 19:46:58', '2020-03-14 19:46:58');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:03', '2020-03-14 19:47:03');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:05', '2020-03-14 19:47:05');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:07', '2020-03-14 19:47:07');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-14 19:47:08', '2020-03-14 19:47:08');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:10', '2020-03-14 19:47:10');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:11', '2020-03-14 19:47:11');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-03-14 19:47:31', '2020-03-14 19:47:31');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:47:34', '2020-03-14 19:47:34');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-14 19:48:35', '2020-03-14 19:48:35');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-14 19:48:50', '2020-03-14 19:48:50');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:59:04', '2020-03-14 19:59:04');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 19:59:07', '2020-03-14 19:59:07');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:02:39', '2020-03-14 20:02:39');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:02:41', '2020-03-14 20:02:41');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:02:43', '2020-03-14 20:02:43');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:02:44', '2020-03-14 20:02:44');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:02:44', '2020-03-14 20:02:44');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:09:12', '2020-03-14 20:09:12');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:09:12', '2020-03-14 20:09:12');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:09:13', '2020-03-14 20:09:13');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-14 20:09:13', '2020-03-14 20:09:13');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 02:01:50', '2020-03-15 02:01:50');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:01:55', '2020-03-15 02:01:55');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:01:56', '2020-03-15 02:01:56');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:01:59', '2020-03-15 02:01:59');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/1', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4e3b\\u9762\\u677f\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"wFf6sBKPhGSkhRUzCyYbMpJlx3m2LxSuK3O3CZOF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\\/auth\\/menu\"}', '2020-03-15 02:02:05', '2020-03-15 02:02:05');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 02:02:05', '2020-03-15 02:02:05');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:02:07', '2020-03-15 02:02:07');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '[]', '2020-03-15 02:03:09', '2020-03-15 02:03:09');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:12', '2020-03-15 02:03:12');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:16', '2020-03-15 02:03:16');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:17', '2020-03-15 02:03:17');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:18', '2020-03-15 02:03:18');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:27', '2020-03-15 02:03:27');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:27', '2020-03-15 02:03:27');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-03-15 02:03:29', '2020-03-15 02:03:29');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:31', '2020-03-15 02:03:31');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:32', '2020-03-15 02:03:32');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:33', '2020-03-15 02:03:33');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:03:34', '2020-03-15 02:03:34');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7b7e\\u5230\\u4ee4\\u724c\\u7ba1\\u7406\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"signTokens\",\"roles\":[null],\"permission\":null,\"_token\":\"wFf6sBKPhGSkhRUzCyYbMpJlx3m2LxSuK3O3CZOF\"}', '2020-03-15 02:04:15', '2020-03-15 02:04:15');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 02:04:16', '2020-03-15 02:04:16');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"wFf6sBKPhGSkhRUzCyYbMpJlx3m2LxSuK3O3CZOF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2020-03-15 02:04:21', '2020-03-15 02:04:21');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:21', '2020-03-15 02:04:21');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 02:04:23', '2020-03-15 02:04:23');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:25', '2020-03-15 02:04:25');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:26', '2020-03-15 02:04:26');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:33', '2020-03-15 02:04:33');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:35', '2020-03-15 02:04:35');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7b7e\\u5230\\u4ee4\\u724c\\u5217\\u8868\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"signTokens\",\"roles\":[null],\"permission\":null,\"_token\":\"wFf6sBKPhGSkhRUzCyYbMpJlx3m2LxSuK3O3CZOF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\\/auth\\/menu\"}', '2020-03-15 02:04:39', '2020-03-15 02:04:39');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 02:04:39', '2020-03-15 02:04:39');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:40', '2020-03-15 02:04:40');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 02:04:41', '2020-03-15 02:04:41');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:43', '2020-03-15 02:04:43');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:04:46', '2020-03-15 02:04:46');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 02:05:38', '2020-03-15 02:05:38');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:06:23', '2020-03-15 02:06:23');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/signTokens/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:06:24', '2020-03-15 02:06:24');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/signTokens', 'POST', '127.0.0.1', '{\"uuid\":\"3543\",\"cookie\":\"453453453\",\"name\":\"4535435434\",\"_token\":\"wFf6sBKPhGSkhRUzCyYbMpJlx3m2LxSuK3O3CZOF\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\\/signTokens\"}', '2020-03-15 02:06:30', '2020-03-15 02:06:30');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 02:06:30', '2020-03-15 02:06:30');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 02:06:50', '2020-03-15 02:06:50');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 02:18:57', '2020-03-15 02:18:57');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 02:19:16', '2020-03-15 02:19:16');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 02:19:24', '2020-03-15 02:19:24');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 16:21:25', '2020-03-15 16:21:25');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:21:29', '2020-03-15 16:21:29');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_SignToken\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-03-15 16:21:36', '2020-03-15 16:21:36');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:21:36', '2020-03-15 16:21:36');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 16:25:14', '2020-03-15 16:25:14');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 16:25:40', '2020-03-15 16:25:40');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:42', '2020-03-15 16:25:42');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:45', '2020-03-15 16:25:45');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:48', '2020-03-15 16:25:48');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:53', '2020-03-15 16:25:53');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:54', '2020-03-15 16:25:54');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:55', '2020-03-15 16:25:55');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:55', '2020-03-15 16:25:55');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:56', '2020-03-15 16:25:56');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:57', '2020-03-15 16:25:57');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:25:59', '2020-03-15 16:25:59');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:26:00', '2020-03-15 16:26:00');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:38:35', '2020-03-15 16:38:35');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:39:26', '2020-03-15 16:39:26');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:39:29', '2020-03-15 16:39:29');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7f51\\u7ad9\\u8bbe\\u7f6e\",\"icon\":\"fa-suitcase\",\"uri\":\"settings\",\"roles\":[null],\"permission\":null,\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:40:04', '2020-03-15 16:40:04');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 16:40:05', '2020-03-15 16:40:05');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":9}]\"}', '2020-03-15 16:40:08', '2020-03-15 16:40:08');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:08', '2020-03-15 16:40:08');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 16:40:09', '2020-03-15 16:40:09');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:11', '2020-03-15 16:40:11');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:15', '2020-03-15 16:40:15');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:18', '2020-03-15 16:40:18');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:20', '2020-03-15 16:40:20');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ee4\\u724c\\u5217\\u8868\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"signTokens\",\"roles\":[null],\"permission\":null,\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\\/auth\\/menu\"}', '2020-03-15 16:40:22', '2020-03-15 16:40:22');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-03-15 16:40:22', '2020-03-15 16:40:22');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:23', '2020-03-15 16:40:23');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 16:40:25', '2020-03-15 16:40:25');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:27', '2020-03-15 16:40:27');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"name\":\"John Doe\",\"email\":\"John.Doe@gmail.com\",\"created_at\":\"2020-03-15 16:40:27\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:40:30', '2020-03-15 16:40:30');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:40:30', '2020-03-15 16:40:30');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:40:31', '2020-03-15 16:40:31');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:48:15', '2020-03-15 16:48:15');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"512212142\",\"web_no\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:48:34', '2020-03-15 16:48:34');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:48:35', '2020-03-15 16:48:35');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"512212142\",\"web_no\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:49:51', '2020-03-15 16:49:51');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:49:51', '2020-03-15 16:49:51');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"512212142\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:50:35', '2020-03-15 16:50:35');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:50:35', '2020-03-15 16:50:35');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:50:37', '2020-03-15 16:50:37');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"dsfds\",\"api_key\":\"dsfsd\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:51:23', '2020-03-15 16:51:23');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:51:38', '2020-03-15 16:51:38');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"sadsa\",\"api_key\":\"sadas\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:51:43', '2020-03-15 16:51:43');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:51:49', '2020-03-15 16:51:49');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:52:35', '2020-03-15 16:52:35');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"sadsa\",\"api_key\":\"sadsad\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:52:39', '2020-03-15 16:52:39');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:52:39', '2020-03-15 16:52:39');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:52:41', '2020-03-15 16:52:41');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:52:42', '2020-03-15 16:52:42');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:53:17', '2020-03-15 16:53:17');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"65543\",\"api_key\":\"45345\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:53:24', '2020-03-15 16:53:24');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:53:24', '2020-03-15 16:53:24');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:53:25', '2020-03-15 16:53:25');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"123\",\"api_key\":\"123\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:53:38', '2020-03-15 16:53:38');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:53:38', '2020-03-15 16:53:38');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:54:01', '2020-03-15 16:54:01');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:54:16', '2020-03-15 16:54:16');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"123\",\"api_key\":\"123\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:54:17', '2020-03-15 16:54:17');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:54:17', '2020-03-15 16:54:17');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$Y5cOixxkl.UK6d\\/je\\/TihOzCkViszcvU5O51.zbH37qM\\/CSTVrpNS\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:54:34', '2020-03-15 16:54:34');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:54:34', '2020-03-15 16:54:34');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:56:03', '2020-03-15 16:56:03');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:56:04', '2020-03-15 16:56:04');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$DbTTdI07pzB4zWa6S8xpaeDDixuc1MY4TTitLQVEbNsBLncOWreDW\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:56:06', '2020-03-15 16:56:06');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:56:06', '2020-03-15 16:56:06');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:56:08', '2020-03-15 16:56:08');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:56:18', '2020-03-15 16:56:18');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$sBZrIyVAsaahPluF.d7LGORo1hdYiDWBnXB9TO5HXAHepBOYueX6S\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:56:20', '2020-03-15 16:56:20');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:56:20', '2020-03-15 16:56:20');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$2C\\/NCqmULW0jmOLkIx0sUei11v1nuNNKDedFKkJBubS4t5YGtcDku\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:56:59', '2020-03-15 16:56:59');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:56:59', '2020-03-15 16:56:59');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$xdlBq\\/bu3CMvMHR47bceG.JUjIrxo6Se\\/EV4aAM1Bvkz777Knuf.K\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:57:05', '2020-03-15 16:57:05');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:57:05', '2020-03-15 16:57:05');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:57:22', '2020-03-15 16:57:22');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$7H5bY3K4X6M.KzJAxyVEeeBa8eShw76Fae.pIryixF1GFTxZUJnjG\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:57:23', '2020-03-15 16:57:23');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:57:24', '2020-03-15 16:57:24');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$30m7Nq94DAac3BrcZoeDHuses\\/z973cxoN.miqHP2QWVVo\\/LHoNwa\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:57:26', '2020-03-15 16:57:26');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:57:26', '2020-03-15 16:57:26');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:57:45', '2020-03-15 16:57:45');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:58:55', '2020-03-15 16:58:55');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:56', '2020-03-15 16:58:56');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:56', '2020-03-15 16:58:56');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:56', '2020-03-15 16:58:56');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:56', '2020-03-15 16:58:56');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:57', '2020-03-15 16:58:57');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$tvGYm8LeyIWbNElD\\/9WLeORq0IUTD6u1dVuq2gPLHoJ3Wld4zJeGy\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:58:57', '2020-03-15 16:58:57');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:57', '2020-03-15 16:58:57');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:57', '2020-03-15 16:58:57');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:58', '2020-03-15 16:58:58');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:58', '2020-03-15 16:58:58');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:58', '2020-03-15 16:58:58');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:59', '2020-03-15 16:58:59');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:59', '2020-03-15 16:58:59');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:58:59', '2020-03-15 16:58:59');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:00', '2020-03-15 16:59:00');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:00', '2020-03-15 16:59:00');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:00', '2020-03-15 16:59:00');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:00', '2020-03-15 16:59:00');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:01', '2020-03-15 16:59:01');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:01', '2020-03-15 16:59:01');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:01', '2020-03-15 16:59:01');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:02', '2020-03-15 16:59:02');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:02', '2020-03-15 16:59:02');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:02', '2020-03-15 16:59:02');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:02', '2020-03-15 16:59:02');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:03', '2020-03-15 16:59:03');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:59:05', '2020-03-15 16:59:05');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:06', '2020-03-15 16:59:06');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:08', '2020-03-15 16:59:08');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:10', '2020-03-15 16:59:10');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:17', '2020-03-15 16:59:17');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$tvGYm8LeyIWbNElD\\/9WLeORq0IUTD6u1dVuq2gPLHoJ3Wld4zJeGy\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:59:19', '2020-03-15 16:59:19');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 16:59:19', '2020-03-15 16:59:19');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:59:56', '2020-03-15 16:59:56');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$Un9MyW4VvM8TcXKAQ1\\/qceaQvSnvAa2KYXGHKyV94lHtqv7XkOlI2\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 16:59:57', '2020-03-15 16:59:57');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 16:59:59', '2020-03-15 16:59:59');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$Un9MyW4VvM8TcXKAQ1\\/qceaQvSnvAa2KYXGHKyV94lHtqv7XkOlI2\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:00:00', '2020-03-15 17:00:00');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:00:02', '2020-03-15 17:00:02');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$Un9MyW4VvM8TcXKAQ1\\/qceaQvSnvAa2KYXGHKyV94lHtqv7XkOlI2\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:00:15', '2020-03-15 17:00:15');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:00:15', '2020-03-15 17:00:15');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$t13smzEp1sNBcwnLcrfQeuSBDTb1eM8O7Zxz48AiAc4vg9YkaNkjO\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:01:33', '2020-03-15 17:01:33');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:01:33', '2020-03-15 17:01:33');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$sIOusAO43q9CQpjBps4YoePVMq2k9jih\\/q3ZYmy5z4DajkWJjVCbC\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:01:39', '2020-03-15 17:01:39');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:01:39', '2020-03-15 17:01:39');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$EeqaF9FmO.5BSVKDQrOX5uUdGp25cbMPiKioxdJjVpMI4YTHjnBpW\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:01:57', '2020-03-15 17:01:57');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:01:58', '2020-03-15 17:01:58');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$o7iO2QtmbMugZswvKibGk.66jgoAfBUfeUPLUnWkgwjKvPI.1tP5.\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:00', '2020-03-15 17:02:00');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:00', '2020-03-15 17:02:00');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"$2y$10$xiebZ6FaYYaComeQBYN\\/C.mZENTX6yJdPdGkPTWtn2joT8CfyDNSq\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:09', '2020-03-15 17:02:09');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:09', '2020-03-15 17:02:09');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"68351487728bbc90af2c53e29db599e2\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:11', '2020-03-15 17:02:11');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:12', '2020-03-15 17:02:12');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"e4d2e7b1255c1391649318bf69bc638a\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:13', '2020-03-15 17:02:13');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:13', '2020-03-15 17:02:13');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"a1c7a8cb7b05899fd82cc43f3dda6ce9\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:15', '2020-03-15 17:02:15');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:15', '2020-03-15 17:02:15');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"35801452efbcc6c4ee0894100fa3667c\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:02:17', '2020-03-15 17:02:17');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:02:17', '2020-03-15 17:02:17');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:02:45', '2020-03-15 17:02:45');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:02:45', '2020-03-15 17:02:45');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:02:47', '2020-03-15 17:02:47');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:02:48', '2020-03-15 17:02:48');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:03:10', '2020-03-15 17:03:10');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:03:10', '2020-03-15 17:03:10');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:03:50', '2020-03-15 17:03:50');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:03:57', '2020-03-15 17:03:57');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"57374a165f471739b707f68d6e5f7a78\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:03:58', '2020-03-15 17:03:58');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:03:59', '2020-03-15 17:03:59');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"9905421644b41b0c6439ddd552fd4fcd\",\"web_on\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:04:02', '2020-03-15 17:04:02');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:04:02', '2020-03-15 17:04:02');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:04:14', '2020-03-15 17:04:14');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"3be55d1a09ba4aa2fb2aa8518b7c730a\",\"web_on\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:04:16', '2020-03-15 17:04:16');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:04:16', '2020-03-15 17:04:16');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:04:46', '2020-03-15 17:04:46');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:04:51', '2020-03-15 17:04:51');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:05:08', '2020-03-15 17:05:08');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:05:46', '2020-03-15 17:05:46');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:05:55', '2020-03-15 17:05:55');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:08:08', '2020-03-15 17:08:08');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 17:08:20', '2020-03-15 17:08:20');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"e30f384a8a328d90161005b1a492cc76\",\"web_status\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:08:21', '2020-03-15 17:08:21');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:08:21', '2020-03-15 17:08:21');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"3993a734360dafb2a7ea9ba72ccc6e8e\",\"web_status\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:08:23', '2020-03-15 17:08:23');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:08:23', '2020-03-15 17:08:23');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"bd454c6891ce240550833dbc3e93d04e\",\"web_status\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\"}', '2020-03-15 17:08:25', '2020-03-15 17:08:25');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-15 17:08:25', '2020-03-15 17:08:25');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 18:22:59', '2020-03-15 18:22:59');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:23:02', '2020-03-15 18:23:02');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:23:03', '2020-03-15 18:23:03');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:23:04', '2020-03-15 18:23:04');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:23:05', '2020-03-15 18:23:05');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:34:12', '2020-03-15 18:34:12');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:54:04', '2020-03-15 18:54:04');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 18:54:05', '2020-03-15 18:54:05');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-15 19:41:34', '2020-03-15 19:41:34');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 19:44:54', '2020-03-15 19:44:54');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/signTokens', 'GET', '127.0.0.1', '[]', '2020-03-15 20:15:46', '2020-03-15 20:15:46');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:15:49', '2020-03-15 20:15:49');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:15:51', '2020-03-15 20:15:51');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"password_confirmation\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\"}', '2020-03-15 20:15:55', '2020-03-15 20:15:55');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:15:55', '2020-03-15 20:15:55');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:15:58', '2020-03-15 20:15:58');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:16:00', '2020-03-15 20:16:00');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:16:09', '2020-03-15 20:16:09');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:16:52', '2020-03-15 20:16:52');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"password_confirmation\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_method\":\"PUT\"}', '2020-03-15 20:16:59', '2020-03-15 20:16:59');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:16:59', '2020-03-15 20:16:59');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:17:18', '2020-03-15 20:17:18');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:17:20', '2020-03-15 20:17:20');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:20:18', '2020-03-15 20:20:18');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:20:19', '2020-03-15 20:20:19');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:20:21', '2020-03-15 20:20:21');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:20:23', '2020-03-15 20:20:23');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"password_confirmation\":\"$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66\",\"_token\":\"HDNAJ1rHhNX73CKfIwZAuupHwyX5tZBsIjDjuXf9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/sign.cn\\/admin\\/auth\\/users\"}', '2020-03-15 20:20:27', '2020-03-15 20:20:27');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-03-15 20:20:28', '2020-03-15 20:20:28');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-15 20:28:31', '2020-03-15 20:28:31');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-03-17 18:32:46', '2020-03-17 18:32:46');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-03-17 18:32:50', '2020-03-17 18:32:50');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"6ce8f19cf0fb76561e0c45c11e6a1b7b\",\"web_status\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"F0jDzDCX54Bh8NeU1jZt3gZs9JitahZZGCz7JVek\"}', '2020-03-17 18:32:53', '2020-03-17 18:32:53');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-17 18:32:53', '2020-03-17 18:32:53');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"1e8fb66e718c1768fa2193ca62ee415d\",\"web_status\":\"2\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"F0jDzDCX54Bh8NeU1jZt3gZs9JitahZZGCz7JVek\"}', '2020-03-17 18:33:11', '2020-03-17 18:33:11');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-17 18:33:11', '2020-03-17 18:33:11');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/_handle_form_', 'POST', '127.0.0.1', '{\"title\":\"\\u81ea\\u52a8\\u7b7e\\u5230\",\"api_key\":\"1b7591199bf4e83928f0374134d7caa7\",\"web_status\":\"1\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\Setting\\\\Basic\",\"_token\":\"F0jDzDCX54Bh8NeU1jZt3gZs9JitahZZGCz7JVek\"}', '2020-03-17 18:33:36', '2020-03-17 18:33:36');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2020-03-17 18:33:36', '2020-03-17 18:33:36');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-07 17:40:33', '2020-05-07 17:40:33');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:37', '2020-05-07 17:40:37');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"3\",\"_model\":\"App_Models_SignToken\",\"_token\":\"HrkXAAau4d4c1gtlAPvw1XtUdqBKKYC9wido2Zxc\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-07 17:40:40', '2020-05-07 17:40:40');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:40', '2020-05-07 17:40:40');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"App_Models_SignToken\",\"_token\":\"HrkXAAau4d4c1gtlAPvw1XtUdqBKKYC9wido2Zxc\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-07 17:40:48', '2020-05-07 17:40:48');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:48', '2020-05-07 17:40:48');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:51', '2020-05-07 17:40:51');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:51', '2020-05-07 17:40:51');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:52', '2020-05-07 17:40:52');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:52', '2020-05-07 17:40:52');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:54', '2020-05-07 17:40:54');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:54', '2020-05-07 17:40:54');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:55', '2020-05-07 17:40:55');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/signTokens', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:56', '2020-05-07 17:40:56');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-07 17:40:57', '2020-05-07 17:40:57');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-03-14 11:45:34', '2020-03-14 11:45:34');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$VbuCvYHw3jCWLKf13PBoW.PHcqUMHaB.GkU2nfKmHzBI5vsiXTU66', 'Administrator', 'images/bd341c375264b73f7e6d70f6f87c3ad1.jpg', 'gqvIhey5KSJMF5QOHYxW5ojvKz74sFHnyZslucr5FAMzHFEl76KmngFhET32', '2020-03-14 11:45:34', '2020-03-15 20:20:28');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2020_03_15_013722_create_sign_token_table', 2);
INSERT INTO `migrations` VALUES (5, '2020_03_15_013739_create_sign_course_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_03_15_162710_create_settings_table', 3);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '自动签到',
  `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$06hNaDOYdkM.Io/Mr725qefktXcQScgj.DVuXR2hzFLk9xVn6gXvm',
  `web_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, '自动签到', 'b55fd639d1d2a38a3b0af759713bd6e0', 1, '2020-03-15 16:50:35', '2020-03-17 18:33:36');

-- ----------------------------
-- Table structure for sign_course
-- ----------------------------
DROP TABLE IF EXISTS `sign_course`;
CREATE TABLE `sign_course`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `course_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sign_course_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sign_token
-- ----------------------------
DROP TABLE IF EXISTS `sign_token`;
CREATE TABLE `sign_token`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` int(11) NOT NULL,
  `cookie` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sign_token_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
