CREATE DATABASE IF NOT EXISTS project_db CHARACTER SET utf8;
USE `project_db`;
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '轮播图',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `user_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户组',
  `mod_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块名',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面标题',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路由路径',
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级菜单',
  `parent_sort` int(10) NOT NULL DEFAULT '0' COMMENT '父级菜单排序',
  `position` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '位置',
  `mode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_blank' COMMENT '跳转方式',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看',
  `field_add` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '添加字段',
  `field_set` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '修改字段',
  `field_get` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '查询字段',
  `table_nav_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '跨表导航名称',
  `table_nav` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '跨表导航',
  `option` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '配置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `source_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户组';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '临时访问牌',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '信息',
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
DROP TABLE IF EXISTS `code_token`;
CREATE TABLE `code_token` (
  `code_token_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '验证码ID',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '令牌',
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '验证码',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '失效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`code_token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='验证码';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID',
  `source_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收藏';
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `operation_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志ID',
  `user_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户角色',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户账号',
  `routes` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作日志表';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='点赞';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：(1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在用户组',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：(0未认证|1审核中|2已认证)',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '邮箱',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：(0未认证|1审核中|2已认证)',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '针对获取用户信息字段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `vip_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员等级',
  `vip_discount` double(10,2) DEFAULT '0.00' COMMENT '会员折扣',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `balance` double(10,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户账户';
insert into `user` values ('1','1','管理员','2025-04-06 17:25:22.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg',null,'2025-04-30 17:35:13.0',null,'0.0','0','0.0');
ALTER TABLE `user` DROP COLUMN balance;
ALTER TABLE `user` DROP COLUMN integral;
ALTER TABLE `user` DROP COLUMN vip_level;
ALTER TABLE `user` DROP COLUMN vip_discount;
UPDATE user SET avatar = '/static/upload/admin_avatar.jpg';
DROP TABLE IF EXISTS `tenant_user`;
CREATE TABLE `tenant_user`(tenant_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '租客用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`mobile_phone_number` varchar(16) NOT NULL UNIQUE comment '手机号码',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (tenant_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '租客用户';
insert into `tenant_user` values (1,'用户姓名1','用户性别1','17287989918','已通过',2,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('租客用户','yonghu1','yonghu1','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');
insert into `tenant_user` values (2,'用户姓名2','用户性别2','17537410166','已通过',3,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('租客用户','yonghu2','yonghu2','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');
insert into `tenant_user` values (3,'用户姓名3','用户性别3','13543504971','已通过',4,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('租客用户','yonghu3','yonghu3','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');

DROP TABLE IF EXISTS `landlord_user`;
CREATE TABLE `landlord_user`(landlord_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房东用户ID',
`name_of_landlord` varchar(64) NOT NULL comment '房东姓名',
`landlord_gender` varchar(64) comment '房东性别',
`contact_number` varchar(16) NOT NULL comment '联系号码',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (landlord_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '房东用户';
insert into `landlord_user` values (1,'房东姓名1','房东性别1','15277255300','已通过',5,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('房东用户','yonghu4','yonghu4','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');
insert into `landlord_user` values (2,'房东姓名2','房东性别2','13109692504','已通过',6,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('房东用户','yonghu5','yonghu5','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');
insert into `landlord_user` values (3,'房东姓名3','房东性别3','17810170899','已通过',7,'2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into user(user_group,username,nickname,password,avatar) values ('房东用户','yonghu6','yonghu6','bfd59291e825b5f2bbf1eb76569f8fe7','/static/upload/default_avatar.jpg');

DROP TABLE IF EXISTS `regional_classification`;
CREATE TABLE `regional_classification`(regional_classification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '区域分类ID',
`area_type` varchar(64) NOT NULL comment '区域类型',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (regional_classification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '区域分类';
insert into `regional_classification` values (1,'区域类型1','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (2,'区域类型2','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (3,'区域类型3','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (4,'区域类型4','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (5,'区域类型5','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (6,'区域类型6','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (7,'区域类型7','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (8,'区域类型8','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (9,'区域类型9','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (10,'区域类型10','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (11,'区域类型11','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `regional_classification` values (12,'区域类型12','2025-06-21 09:16:18','2025-06-21 09:16:18');

DROP TABLE IF EXISTS `huxing_classification`;
CREATE TABLE `huxing_classification`(huxing_classification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '户型分类ID',
`type_of_house_type` varchar(64) NOT NULL comment '户型类型',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (huxing_classification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '户型分类';
insert into `huxing_classification` values (1,'户型类型1','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (2,'户型类型2','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (3,'户型类型3','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (4,'户型类型4','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (5,'户型类型5','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (6,'户型类型6','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (7,'户型类型7','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (8,'户型类型8','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (9,'户型类型9','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (10,'户型类型10','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (11,'户型类型11','2025-06-21 09:16:18','2025-06-21 09:16:18');
insert into `huxing_classification` values (12,'户型类型12','2025-06-21 09:16:18','2025-06-21 09:16:18');

DROP TABLE IF EXISTS `housing_information`;
CREATE TABLE `housing_information`(housing_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋信息ID',
`house_title` varchar(64) comment '房屋标题',
`area` varchar(64) comment '所在区域',
`house_type` varchar(64) comment '房屋户型',
`house_picture` varchar(255) comment '房屋图片',
`house_video` varchar(255) comment '房屋视频',
`house_status` varchar(64) comment '房屋状态',
`building_area` varchar(64) comment '建筑面积',
`housing_rent` double(8,2) DEFAULT 0 comment '房屋租金',
`housing_deposit` varchar(64) comment '房屋押金',
`price_description` varchar(64) comment '价格说明',
`house_address` varchar(64) comment '房屋地址',
`number_of_houses` varchar(64) comment '房屋数量',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`name_of_landlord` varchar(64) comment '房东姓名',
`supporting_facilities` text comment '配套设施',
`surrounding_environment` text comment '周边环境',
`house_introduction` longtext comment '房屋介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`collect_len` int(11) DEFAULT 0 NOT NULL comment '收藏数',
`comment_len` int(11) DEFAULT 0 NOT NULL comment '评论数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`appointment_to_see_the_room_limit_times` int(8) DEFAULT 0 NOT NULL comment '在线预约限制次数',
`financial_statements_limit_times` int(8) DEFAULT 0 NOT NULL comment '财务报表限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housing_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '房屋信息';
insert into `housing_information` values (1,'房屋标题1','所在区域1','房屋户型1','/static/upload/1834767781350866945.jpg','','房屋状态1','建筑面积1',1,'房屋押金1','价格说明1','房屋地址1','房屋数量1',0,'房东姓名1','配套设施1','周边环境1','此处可上传文字、图片、视频、超链接等内容区1',146,818,287,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (2,'房屋标题2','所在区域2','房屋户型2','/static/upload/1834767677386653696.jpg','','房屋状态2','建筑面积2',2,'房屋押金2','价格说明2','房屋地址2','房屋数量2',0,'房东姓名2','配套设施2','周边环境2','此处可上传文字、图片、视频、超链接等内容区2',496,827,972,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (3,'房屋标题3','所在区域3','房屋户型3','/static/upload/1834767598349189121.jpg','','房屋状态3','建筑面积3',3,'房屋押金3','价格说明3','房屋地址3','房屋数量3',0,'房东姓名3','配套设施3','周边环境3','此处可上传文字、图片、视频、超链接等内容区3',285,164,385,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (4,'房屋标题4','所在区域4','房屋户型4','/static/upload/1834767763546046464.jpg','','房屋状态4','建筑面积4',4,'房屋押金4','价格说明4','房屋地址4','房屋数量4',0,'房东姓名4','配套设施4','周边环境4','此处可上传文字、图片、视频、超链接等内容区4',641,691,294,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (5,'房屋标题5','所在区域5','房屋户型5','/static/upload/1834767635959513088.jpg','','房屋状态5','建筑面积5',5,'房屋押金5','价格说明5','房屋地址5','房屋数量5',0,'房东姓名5','配套设施5','周边环境5','此处可上传文字、图片、视频、超链接等内容区5',675,626,668,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (6,'房屋标题6','所在区域6','房屋户型6','/static/upload/1834767579827142657.jpg','','房屋状态6','建筑面积6',6,'房屋押金6','价格说明6','房屋地址6','房屋数量6',0,'房东姓名6','配套设施6','周边环境6','此处可上传文字、图片、视频、超链接等内容区6',662,798,432,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (7,'房屋标题7','所在区域7','房屋户型7','/static/upload/1834767616003014657.jpg','','房屋状态7','建筑面积7',7,'房屋押金7','价格说明7','房屋地址7','房屋数量7',0,'房东姓名7','配套设施7','周边环境7','此处可上传文字、图片、视频、超链接等内容区7',181,850,663,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (8,'房屋标题8','所在区域8','房屋户型8','/static/upload/1834767700514045953.jpg','','房屋状态8','建筑面积8',8,'房屋押金8','价格说明8','房屋地址8','房屋数量8',0,'房东姓名8','配套设施8','周边环境8','此处可上传文字、图片、视频、超链接等内容区8',51,522,390,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (9,'房屋标题9','所在区域9','房屋户型9','/static/upload/1834767726871052289.jpg','','房屋状态9','建筑面积9',9,'房屋押金9','价格说明9','房屋地址9','房屋数量9',0,'房东姓名9','配套设施9','周边环境9','此处可上传文字、图片、视频、超链接等内容区9',885,156,483,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (10,'房屋标题10','所在区域10','房屋户型10','/static/upload/1834767744113836032.jpg','','房屋状态10','建筑面积10',10,'房屋押金10','价格说明10','房屋地址10','房屋数量10',0,'房东姓名10','配套设施10','周边环境10','此处可上传文字、图片、视频、超链接等内容区10',954,856,913,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (11,'房屋标题11','所在区域11','房屋户型11','/static/upload/1834767657774088193.jpg','','房屋状态11','建筑面积11',11,'房屋押金11','价格说明11','房屋地址11','房屋数量11',0,'房东姓名11','配套设施11','周边环境11','此处可上传文字、图片、视频、超链接等内容区11',890,443,612,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `housing_information` values (12,'房屋标题12','所在区域12','房屋户型12','/static/upload/1834767562060070912.jpg','','房屋状态12','建筑面积12',12,'房屋押金12','价格说明12','房屋地址12','房屋数量12',0,'房东姓名12','配套设施12','周边环境12','此处可上传文字、图片、视频、超链接等内容区12',990,442,440,0,'已通过','',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `appointment_to_see_the_room`;
CREATE TABLE `appointment_to_see_the_room`(appointment_to_see_the_room_id int(11) NOT NULL AUTO_INCREMENT COMMENT '预约看房ID',
`booking_code` varchar(64) comment '预约编码',
`house_title` varchar(64) comment '房屋标题',
`area` varchar(64) comment '所在区域',
`house_type` varchar(64) comment '房屋户型',
`housing_rent` varchar(64) comment '房屋租金',
`housing_deposit` varchar(64) comment '房屋押金',
`price_description` varchar(64) comment '价格说明',
`house_address` varchar(64) comment '房屋地址',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`user_name` varchar(64) comment '用户姓名',
`mobile_phone_number` varchar(64) comment '手机号码',
`appointment_time` datetime comment '预约时间',
`appointment_remarks` text comment '预约备注',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`lease_contract_limit_times` int(8) DEFAULT 1 NOT NULL comment '租赁合同限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (appointment_to_see_the_room_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '预约看房';
insert into `appointment_to_see_the_room` values (1,'预约编码1','房屋标题1','所在区域1','房屋户型1','房屋租金1','房屋押金1','价格说明1','房屋地址1',0,0,'用户姓名1','手机号码1','2025-06-21 09:16:19','预约备注1','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (2,'预约编码2','房屋标题2','所在区域2','房屋户型2','房屋租金2','房屋押金2','价格说明2','房屋地址2',0,0,'用户姓名2','手机号码2','2025-06-21 09:16:19','预约备注2','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (3,'预约编码3','房屋标题3','所在区域3','房屋户型3','房屋租金3','房屋押金3','价格说明3','房屋地址3',0,0,'用户姓名3','手机号码3','2025-06-21 09:16:19','预约备注3','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (4,'预约编码4','房屋标题4','所在区域4','房屋户型4','房屋租金4','房屋押金4','价格说明4','房屋地址4',0,0,'用户姓名4','手机号码4','2025-06-21 09:16:19','预约备注4','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (5,'预约编码5','房屋标题5','所在区域5','房屋户型5','房屋租金5','房屋押金5','价格说明5','房屋地址5',0,0,'用户姓名5','手机号码5','2025-06-21 09:16:19','预约备注5','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (6,'预约编码6','房屋标题6','所在区域6','房屋户型6','房屋租金6','房屋押金6','价格说明6','房屋地址6',0,0,'用户姓名6','手机号码6','2025-06-21 09:16:19','预约备注6','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (7,'预约编码7','房屋标题7','所在区域7','房屋户型7','房屋租金7','房屋押金7','价格说明7','房屋地址7',0,0,'用户姓名7','手机号码7','2025-06-21 09:16:19','预约备注7','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (8,'预约编码8','房屋标题8','所在区域8','房屋户型8','房屋租金8','房屋押金8','价格说明8','房屋地址8',0,0,'用户姓名8','手机号码8','2025-06-21 09:16:19','预约备注8','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (9,'预约编码9','房屋标题9','所在区域9','房屋户型9','房屋租金9','房屋押金9','价格说明9','房屋地址9',0,0,'用户姓名9','手机号码9','2025-06-21 09:16:19','预约备注9','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (10,'预约编码10','房屋标题10','所在区域10','房屋户型10','房屋租金10','房屋押金10','价格说明10','房屋地址10',0,0,'用户姓名10','手机号码10','2025-06-21 09:16:19','预约备注10','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (11,'预约编码11','房屋标题11','所在区域11','房屋户型11','房屋租金11','房屋押金11','价格说明11','房屋地址11',0,0,'用户姓名11','手机号码11','2025-06-21 09:16:19','预约备注11','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `appointment_to_see_the_room` values (12,'预约编码12','房屋标题12','所在区域12','房屋户型12','房屋租金12','房屋押金12','价格说明12','房屋地址12',0,0,'用户姓名12','手机号码12','2025-06-21 09:16:19','预约备注12','已通过','',1,'2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `lease_contract`;
CREATE TABLE `lease_contract`(lease_contract_id int(11) NOT NULL AUTO_INCREMENT COMMENT '租赁合同ID',
`contract_code` varchar(64) comment '合同编码',
`booking_code` varchar(64) comment '预约编码',
`house_title` varchar(64) comment '房屋标题',
`area` varchar(64) comment '所在区域',
`house_type` varchar(64) comment '房屋户型',
`housing_rent` varchar(64) comment '房屋租金',
`housing_deposit` varchar(64) comment '房屋押金',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`lease_months` double(8,2) DEFAULT 0 comment '租赁月数',
`total_amount` varchar(64) comment '合计金额',
`contract_name` varchar(64) comment '合同名称',
`signing_time` date comment '签订时间',
`contract_documents` varchar(255) comment '合同文件',
`terms_of_lease` text comment '租赁条款',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`maintenance_records_limit_times` int(8) DEFAULT 0 NOT NULL comment '维修申请限制次数',
`complaint_records_limit_times` int(8) DEFAULT 0 NOT NULL comment '在线投诉限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (lease_contract_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '租赁合同';
insert into `lease_contract` values (1,'合同编码1','预约编码1','房屋标题1','所在区域1','房屋户型1','房屋租金1','房屋押金1',0,0,1,'合计金额1','合同名称1','2025-06-21','','租赁条款1','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (2,'合同编码2','预约编码2','房屋标题2','所在区域2','房屋户型2','房屋租金2','房屋押金2',0,0,2,'合计金额2','合同名称2','2025-06-21','','租赁条款2','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (3,'合同编码3','预约编码3','房屋标题3','所在区域3','房屋户型3','房屋租金3','房屋押金3',0,0,3,'合计金额3','合同名称3','2025-06-21','','租赁条款3','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (4,'合同编码4','预约编码4','房屋标题4','所在区域4','房屋户型4','房屋租金4','房屋押金4',0,0,4,'合计金额4','合同名称4','2025-06-21','','租赁条款4','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (5,'合同编码5','预约编码5','房屋标题5','所在区域5','房屋户型5','房屋租金5','房屋押金5',0,0,5,'合计金额5','合同名称5','2025-06-21','','租赁条款5','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (6,'合同编码6','预约编码6','房屋标题6','所在区域6','房屋户型6','房屋租金6','房屋押金6',0,0,6,'合计金额6','合同名称6','2025-06-21','','租赁条款6','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (7,'合同编码7','预约编码7','房屋标题7','所在区域7','房屋户型7','房屋租金7','房屋押金7',0,0,7,'合计金额7','合同名称7','2025-06-21','','租赁条款7','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (8,'合同编码8','预约编码8','房屋标题8','所在区域8','房屋户型8','房屋租金8','房屋押金8',0,0,8,'合计金额8','合同名称8','2025-06-21','','租赁条款8','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (9,'合同编码9','预约编码9','房屋标题9','所在区域9','房屋户型9','房屋租金9','房屋押金9',0,0,9,'合计金额9','合同名称9','2025-06-21','','租赁条款9','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (10,'合同编码10','预约编码10','房屋标题10','所在区域10','房屋户型10','房屋租金10','房屋押金10',0,0,10,'合计金额10','合同名称10','2025-06-21','','租赁条款10','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (11,'合同编码11','预约编码11','房屋标题11','所在区域11','房屋户型11','房屋租金11','房屋押金11',0,0,11,'合计金额11','合同名称11','2025-06-21','','租赁条款11','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `lease_contract` values (12,'合同编码12','预约编码12','房屋标题12','所在区域12','房屋户型12','房屋租金12','房屋押金12',0,0,12,'合计金额12','合同名称12','2025-06-21','','租赁条款12','未支付','支付宝',0,0,'2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `maintenance_records`;
CREATE TABLE `maintenance_records`(maintenance_records_id int(11) NOT NULL AUTO_INCREMENT COMMENT '维修记录ID',
`contract_code` varchar(64) comment '合同编码',
`house_title` varchar(64) comment '房屋标题',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`user_name` varchar(64) comment '用户姓名',
`repair_title` varchar(64) comment '报修标题',
`repair_date` date comment '报修日期',
`contents_of_repair_report` text comment '报修内容',
`maintenance_status` varchar(64) comment '维修状态',
`maintenance` text comment '维修情况',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (maintenance_records_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '维修记录';
insert into `maintenance_records` values (1,'合同编码1','房屋标题1',0,0,'用户姓名1','报修标题1','2025-06-21','报修内容1','维修状态1','维修情况1','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (2,'合同编码2','房屋标题2',0,0,'用户姓名2','报修标题2','2025-06-21','报修内容2','维修状态2','维修情况2','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (3,'合同编码3','房屋标题3',0,0,'用户姓名3','报修标题3','2025-06-21','报修内容3','维修状态3','维修情况3','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (4,'合同编码4','房屋标题4',0,0,'用户姓名4','报修标题4','2025-06-21','报修内容4','维修状态4','维修情况4','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (5,'合同编码5','房屋标题5',0,0,'用户姓名5','报修标题5','2025-06-21','报修内容5','维修状态5','维修情况5','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (6,'合同编码6','房屋标题6',0,0,'用户姓名6','报修标题6','2025-06-21','报修内容6','维修状态6','维修情况6','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (7,'合同编码7','房屋标题7',0,0,'用户姓名7','报修标题7','2025-06-21','报修内容7','维修状态7','维修情况7','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (8,'合同编码8','房屋标题8',0,0,'用户姓名8','报修标题8','2025-06-21','报修内容8','维修状态8','维修情况8','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (9,'合同编码9','房屋标题9',0,0,'用户姓名9','报修标题9','2025-06-21','报修内容9','维修状态9','维修情况9','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (10,'合同编码10','房屋标题10',0,0,'用户姓名10','报修标题10','2025-06-21','报修内容10','维修状态10','维修情况10','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (11,'合同编码11','房屋标题11',0,0,'用户姓名11','报修标题11','2025-06-21','报修内容11','维修状态11','维修情况11','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `maintenance_records` values (12,'合同编码12','房屋标题12',0,0,'用户姓名12','报修标题12','2025-06-21','报修内容12','维修状态12','维修情况12','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `complaint_records`;
CREATE TABLE `complaint_records`(complaint_records_id int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉记录ID',
`contract_code` varchar(64) comment '合同编码',
`house_title` varchar(64) comment '房屋标题',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`tenant_user` int(11) DEFAULT 0 comment '租客用户',
`user_name` varchar(64) comment '用户姓名',
`complaint_title` varchar(64) comment '投诉标题',
`date_of_complaint` date comment '投诉日期',
`complaint_content` text comment '投诉内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (complaint_records_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '投诉记录';
insert into `complaint_records` values (1,'合同编码1','房屋标题1',0,0,'用户姓名1','投诉标题1','2025-06-21','投诉内容1','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (2,'合同编码2','房屋标题2',0,0,'用户姓名2','投诉标题2','2025-06-21','投诉内容2','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (3,'合同编码3','房屋标题3',0,0,'用户姓名3','投诉标题3','2025-06-21','投诉内容3','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (4,'合同编码4','房屋标题4',0,0,'用户姓名4','投诉标题4','2025-06-21','投诉内容4','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (5,'合同编码5','房屋标题5',0,0,'用户姓名5','投诉标题5','2025-06-21','投诉内容5','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (6,'合同编码6','房屋标题6',0,0,'用户姓名6','投诉标题6','2025-06-21','投诉内容6','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (7,'合同编码7','房屋标题7',0,0,'用户姓名7','投诉标题7','2025-06-21','投诉内容7','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (8,'合同编码8','房屋标题8',0,0,'用户姓名8','投诉标题8','2025-06-21','投诉内容8','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (9,'合同编码9','房屋标题9',0,0,'用户姓名9','投诉标题9','2025-06-21','投诉内容9','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (10,'合同编码10','房屋标题10',0,0,'用户姓名10','投诉标题10','2025-06-21','投诉内容10','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (11,'合同编码11','房屋标题11',0,0,'用户姓名11','投诉标题11','2025-06-21','投诉内容11','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `complaint_records` values (12,'合同编码12','房屋标题12',0,0,'用户姓名12','投诉标题12','2025-06-21','投诉内容12','已通过','','2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `financial_statements`;
CREATE TABLE `financial_statements`(financial_statements_id int(11) NOT NULL AUTO_INCREMENT COMMENT '财务报表ID',
`report_title` varchar(64) comment '报表标题',
`house_title` varchar(64) comment '房屋标题',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`statistical_time` date comment '统计时间',
`housing_rental_rate` double(8,2) DEFAULT 0 comment '出租率 %',
`rental_income` double(8,2) DEFAULT 0 comment '租金收入',
`user_activity` double(8,2) DEFAULT 0 comment '用户活跃度',
`statistical_content` text comment '统计内容',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (financial_statements_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '财务报表';
insert into `financial_statements` values (1,'报表标题1','房屋标题1',0,'2025-06-21',1,1,1,'统计内容1','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (2,'报表标题2','房屋标题2',0,'2025-06-21',2,2,2,'统计内容2','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (3,'报表标题3','房屋标题3',0,'2025-06-21',3,3,3,'统计内容3','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (4,'报表标题4','房屋标题4',0,'2025-06-21',4,4,4,'统计内容4','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (5,'报表标题5','房屋标题5',0,'2025-06-21',5,5,5,'统计内容5','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (6,'报表标题6','房屋标题6',0,'2025-06-21',6,6,6,'统计内容6','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (7,'报表标题7','房屋标题7',0,'2025-06-21',7,7,7,'统计内容7','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (8,'报表标题8','房屋标题8',0,'2025-06-21',8,8,8,'统计内容8','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (9,'报表标题9','房屋标题9',0,'2025-06-21',9,9,9,'统计内容9','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (10,'报表标题10','房屋标题10',0,'2025-06-21',10,10,10,'统计内容10','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (11,'报表标题11','房屋标题11',0,'2025-06-21',11,11,11,'统计内容11','2025-06-21 09:16:19','2025-06-21 09:16:19');
insert into `financial_statements` values (12,'报表标题12','房屋标题12',0,'2025-06-21',12,12,12,'统计内容12','2025-06-21 09:16:19','2025-06-21 09:16:19');

DROP TABLE IF EXISTS `news_information`;
CREATE TABLE `news_information`(news_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻信息ID',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`news_name` varchar(64) NOT NULL comment '新闻名称',
`news_type` varchar(64) comment '新闻类型',
`news_pictures` varchar(255) comment '新闻图片',
`release_date` date comment '发布日期',
`news_brief` text comment '新闻简介',
`news_details` longtext comment '新闻详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`collect_len` int(11) DEFAULT 0 NOT NULL comment '收藏数',
`comment_len` int(11) DEFAULT 0 NOT NULL comment '评论数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (news_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '新闻信息';
insert into `news_information` values (1,0,'新闻名称1','新闻类型1','/static/upload/1834767726871052289.jpg','2025-06-21','新闻简介1','此处可上传文字、图片、视频、超链接等内容区1',138,972,633,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (2,0,'新闻名称2','新闻类型2','/static/upload/1834767635959513088.jpg','2025-06-21','新闻简介2','此处可上传文字、图片、视频、超链接等内容区2',849,490,581,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (3,0,'新闻名称3','新闻类型3','/static/upload/1834767744113836032.jpg','2025-06-21','新闻简介3','此处可上传文字、图片、视频、超链接等内容区3',501,401,538,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (4,0,'新闻名称4','新闻类型4','/static/upload/1834767657774088193.jpg','2025-06-21','新闻简介4','此处可上传文字、图片、视频、超链接等内容区4',578,453,575,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (5,0,'新闻名称5','新闻类型5','/static/upload/1834767781350866945.jpg','2025-06-21','新闻简介5','此处可上传文字、图片、视频、超链接等内容区5',853,530,836,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (6,0,'新闻名称6','新闻类型6','/static/upload/1834767579827142657.jpg','2025-06-21','新闻简介6','此处可上传文字、图片、视频、超链接等内容区6',670,604,333,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (7,0,'新闻名称7','新闻类型7','/static/upload/1834767616003014657.jpg','2025-06-21','新闻简介7','此处可上传文字、图片、视频、超链接等内容区7',957,800,660,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (8,0,'新闻名称8','新闻类型8','/static/upload/1834767677386653696.jpg','2025-06-21','新闻简介8','此处可上传文字、图片、视频、超链接等内容区8',125,4,293,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (9,0,'新闻名称9','新闻类型9','/static/upload/1834767700514045953.jpg','2025-06-21','新闻简介9','此处可上传文字、图片、视频、超链接等内容区9',205,606,228,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (10,0,'新闻名称10','新闻类型10','/static/upload/1834767763546046464.jpg','2025-06-21','新闻简介10','此处可上传文字、图片、视频、超链接等内容区10',744,769,469,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (11,0,'新闻名称11','新闻类型11','/static/upload/1834767598349189121.jpg','2025-06-21','新闻简介11','此处可上传文字、图片、视频、超链接等内容区11',680,864,547,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');
insert into `news_information` values (12,0,'新闻名称12','新闻类型12','/static/upload/1834767562060070912.jpg','2025-06-21','新闻简介12','此处可上传文字、图片、视频、超链接等内容区12',20,546,994,0,'2025-06-21 09:16:20','2025-06-21 09:16:20');

ALTER TABLE `maintenance_records` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
ALTER TABLE `appointment_to_see_the_room` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
ALTER TABLE `complaint_records` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
ALTER TABLE `lease_contract` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
ALTER TABLE `financial_statements` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
insert into `auth` values ('1','管理员','租客用户','tenant_user','租客用户','/tenant_user/table','','0','','_blank','1','1','1','1','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{"figure":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('2','管理员','租客用户','tenant_user','用户详情','/tenant_user/view','','0','','_blank','1','1','1','1','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('3','管理员','房东用户','landlord_user','房东用户','/landlord_user/table','','0','','_blank','1','1','1','1','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('4','管理员','房东用户','landlord_user','用户详情','/landlord_user/view','','0','','_blank','1','1','1','1','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('5','管理员','区域分类','regional_classification','区域分类','/regional_classification/table','','0','','_blank','1','1','1','1','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('6','管理员','区域分类','regional_classification','分类详情','/regional_classification/view','','0','','_blank','1','1','1','1','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('7','管理员','户型分类','huxing_classification','户型分类','/huxing_classification/table','','0','','_blank','1','1','1','1','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('8','管理员','户型分类','huxing_classification','分类详情','/huxing_classification/view','','0','','_blank','1','1','1','1','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('9','管理员','房屋信息','housing_information','房屋信息','/housing_information/table','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"figure":true,"examine":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('10','管理员','房屋信息','housing_information','信息详情','/housing_information/view','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('11','管理员','房屋信息','housing_information','房屋信息','/housing_information/list','','0','top','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('12','管理员','房屋信息','housing_information','信息详情','/housing_information/details','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('13','管理员','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/table','','0','','_blank','1','1','1','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('14','管理员','预约看房','appointment_to_see_the_room','看房详情','/appointment_to_see_the_room/view','','0','','_blank','1','1','1','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"can_limits":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('15','管理员','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/edit','','0','','_blank','1','1','1','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('16','管理员','租赁合同','lease_contract','租赁合同','/lease_contract/table','','0','','_blank','1','1','1','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{"figure":true,"pay":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('17','管理员','租赁合同','lease_contract','合同详情','/lease_contract/view','','0','','_blank','1','1','1','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('18','管理员','维修记录','maintenance_records','维修记录','/maintenance_records/table','','0','','_blank','1','1','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('19','管理员','维修记录','maintenance_records','记录详情','/maintenance_records/view','','0','','_blank','1','1','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('20','管理员','投诉记录','complaint_records','投诉记录','/complaint_records/table','','0','','_blank','1','1','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('21','管理员','投诉记录','complaint_records','记录详情','/complaint_records/view','','0','','_blank','1','1','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('22','管理员','财务报表','financial_statements','财务报表','/financial_statements/table','','0','','_blank','1','1','1','1','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{"figure":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('23','管理员','财务报表','financial_statements','报表详情','/financial_statements/view','','0','','_blank','1','1','1','1','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('24','管理员','新闻信息','news_information','新闻信息','/news_information/table','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('25','管理员','新闻信息','news_information','信息详情','/news_information/view','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('26','管理员','新闻信息','news_information','新闻信息','/news_information/list','','0','top','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('27','管理员','新闻信息','news_information','信息详情','/news_information/details','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('28','管理员','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('29','管理员','评论','comment','评论列表','/comment/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('30','管理员','评论','comment','评论详情','/comment/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('31','管理员','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('32','管理员','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('33','管理员','通知公告','notice','通知公告','/notice/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('34','管理员','通知公告','notice','公告详情','/notice/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('35','管理员','通知公告','notice','通知公告','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('36','管理员','通知公告','notice','公告详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('37','游客','租客用户','tenant_user','租客用户','/tenant_user/table','','0','','_blank','1','0','0','0','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{"figure":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('38','游客','租客用户','tenant_user','用户详情','/tenant_user/view','','0','','_blank','1','0','0','0','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('39','游客','房东用户','landlord_user','房东用户','/landlord_user/table','','0','','_blank','0','0','0','0','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('40','游客','房东用户','landlord_user','用户详情','/landlord_user/view','','0','','_blank','0','0','0','0','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('41','游客','区域分类','regional_classification','区域分类','/regional_classification/table','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('42','游客','区域分类','regional_classification','分类详情','/regional_classification/view','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('43','游客','户型分类','huxing_classification','户型分类','/huxing_classification/table','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('44','游客','户型分类','huxing_classification','分类详情','/huxing_classification/view','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('45','游客','房屋信息','housing_information','房屋信息','/housing_information/table','','0','','_blank','0','0','0','0','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"figure":false,"examine":false,"can_show_comment":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('46','游客','房屋信息','housing_information','信息详情','/housing_information/view','','0','','_blank','0','0','0','0','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('47','游客','房屋信息','housing_information','房屋信息','/housing_information/list','','0','top','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('48','游客','房屋信息','housing_information','信息详情','/housing_information/details','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('49','游客','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/table','','0','','_blank','0','0','0','0','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('50','游客','预约看房','appointment_to_see_the_room','看房详情','/appointment_to_see_the_room/view','','0','','_blank','0','0','0','0','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"can_limits":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('51','游客','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/edit','','0','','_blank','0','0','0','0','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('52','游客','租赁合同','lease_contract','租赁合同','/lease_contract/table','','0','','_blank','0','0','0','0','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{"figure":false,"pay":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('53','游客','租赁合同','lease_contract','合同详情','/lease_contract/view','','0','','_blank','0','0','0','0','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('54','游客','维修记录','maintenance_records','维修记录','/maintenance_records/table','','0','','_blank','0','0','0','0','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('55','游客','维修记录','maintenance_records','记录详情','/maintenance_records/view','','0','','_blank','0','0','0','0','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('56','游客','投诉记录','complaint_records','投诉记录','/complaint_records/table','','0','','_blank','0','0','0','0','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('57','游客','投诉记录','complaint_records','记录详情','/complaint_records/view','','0','','_blank','0','0','0','0','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('58','游客','财务报表','financial_statements','财务报表','/financial_statements/table','','0','','_blank','0','0','0','0','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{"figure":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('59','游客','财务报表','financial_statements','报表详情','/financial_statements/view','','0','','_blank','0','0','0','0','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('60','游客','新闻信息','news_information','新闻信息','/news_information/table','','0','','_blank','0','0','0','0','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_show_comment":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('61','游客','新闻信息','news_information','信息详情','/news_information/view','','0','','_blank','0','0','0','0','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('62','游客','新闻信息','news_information','新闻信息','/news_information/list','','0','top','_blank','0','0','0','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('63','游客','新闻信息','news_information','信息详情','/news_information/details','','0','','_blank','0','0','0','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_comment":false,"can_show_comment":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('64','游客','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('65','游客','评论','comment','评论列表','/comment/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('66','游客','评论','comment','评论详情','/comment/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('67','游客','评论','comment','我的评论','/comment/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('68','游客','评论','comment','评论详情','/comment/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('69','游客','通知公告','notice','通知公告','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('70','游客','通知公告','notice','公告详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('71','游客','通知公告','notice','通知公告','/notice/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('72','游客','通知公告','notice','公告详情','/notice/details','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('73','租客用户','租客用户','tenant_user','租客用户','/tenant_user/table','','0','','_blank','0','0','0','0','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{"figure":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('74','租客用户','租客用户','tenant_user','用户详情','/tenant_user/view','','0','','_blank','0','0','1','1','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('75','租客用户','房东用户','landlord_user','房东用户','/landlord_user/table','','0','','_blank','0','0','0','0','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('76','租客用户','房东用户','landlord_user','用户详情','/landlord_user/view','','0','','_blank','0','0','0','0','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('77','租客用户','区域分类','regional_classification','区域分类','/regional_classification/table','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('78','租客用户','区域分类','regional_classification','分类详情','/regional_classification/view','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('79','租客用户','户型分类','huxing_classification','户型分类','/huxing_classification/table','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('80','租客用户','户型分类','huxing_classification','分类详情','/huxing_classification/view','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('81','租客用户','房屋信息','housing_information','房屋信息','/housing_information/table','','0','','_blank','0','0','0','0','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"figure":false,"examine":false,"can_show_comment":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('82','租客用户','房屋信息','housing_information','信息详情','/housing_information/view','','0','','_blank','0','0','0','0','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('83','租客用户','房屋信息','housing_information','房屋信息','/housing_information/list','','0','top','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('84','租客用户','房屋信息','housing_information','信息详情','/housing_information/details','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('85','租客用户','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/table','','0','','_blank','0','0','0','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('86','租客用户','预约看房','appointment_to_see_the_room','看房详情','/appointment_to_see_the_room/view','','0','','_blank','0','0','0','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"can_limits":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('87','租客用户','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/edit','','0','','_blank','1','1','1','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('88','租客用户','租赁合同','lease_contract','租赁合同','/lease_contract/table','','0','','_blank','0','0','0','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{"figure":false,"pay":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('89','租客用户','租赁合同','lease_contract','合同详情','/lease_contract/view','','0','','_blank','0','0','0','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('90','租客用户','维修记录','maintenance_records','维修记录','/maintenance_records/table','','0','','_blank','1','1','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('91','租客用户','维修记录','maintenance_records','记录详情','/maintenance_records/view','','0','','_blank','1','1','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('92','租客用户','投诉记录','complaint_records','投诉记录','/complaint_records/table','','0','','_blank','1','1','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('93','租客用户','投诉记录','complaint_records','记录详情','/complaint_records/view','','0','','_blank','1','1','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('94','租客用户','财务报表','financial_statements','财务报表','/financial_statements/table','','0','','_blank','0','0','0','0','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{"figure":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('95','租客用户','财务报表','financial_statements','报表详情','/financial_statements/view','','0','','_blank','0','0','0','0','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('96','租客用户','新闻信息','news_information','新闻信息','/news_information/table','','0','','_blank','0','0','0','0','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_show_comment":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('97','租客用户','新闻信息','news_information','信息详情','/news_information/view','','0','','_blank','0','0','0','0','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('98','租客用户','新闻信息','news_information','新闻信息','/news_information/list','','0','top','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('99','租客用户','新闻信息','news_information','信息详情','/news_information/details','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('100','租客用户','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('101','租客用户','评论','comment','评论列表','/comment/table','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('102','租客用户','评论','comment','评论详情','/comment/view','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('103','租客用户','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('104','租客用户','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('105','租客用户','通知公告','notice','通知公告','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('106','租客用户','通知公告','notice','公告详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('107','租客用户','通知公告','notice','通知公告','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('108','租客用户','通知公告','notice','公告详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('109','房东用户','租客用户','tenant_user','租客用户','/tenant_user/table','','0','','_blank','0','0','0','0','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{"figure":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('110','房东用户','租客用户','tenant_user','用户详情','/tenant_user/view','','0','','_blank','0','0','0','0','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number','user_name,user_gender,mobile_phone_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('111','房东用户','房东用户','landlord_user','房东用户','/landlord_user/table','','0','','_blank','0','0','0','0','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('112','房东用户','房东用户','landlord_user','用户详情','/landlord_user/view','','0','','_blank','0','0','1','1','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number','name_of_landlord,landlord_gender,contact_number',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('113','房东用户','区域分类','regional_classification','区域分类','/regional_classification/table','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('114','房东用户','区域分类','regional_classification','分类详情','/regional_classification/view','','0','','_blank','0','0','0','0','area_type','area_type','area_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('115','房东用户','户型分类','huxing_classification','户型分类','/huxing_classification/table','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('116','房东用户','户型分类','huxing_classification','分类详情','/huxing_classification/view','','0','','_blank','0','0','0','0','type_of_house_type','type_of_house_type','type_of_house_type',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('117','房东用户','房屋信息','housing_information','房屋信息','/housing_information/table','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"figure":true,"examine":false,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('118','房东用户','房屋信息','housing_information','信息详情','/housing_information/view','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('119','房东用户','房屋信息','housing_information','房屋信息','/housing_information/list','','0','top','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('120','房东用户','房屋信息','housing_information','信息详情','/housing_information/details','','0','','_blank','1','1','1','1','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction','house_title,area,house_type,house_picture,house_video,house_status,building_area,housing_rent,housing_deposit,price_description,house_address,number_of_houses,landlord_user,name_of_landlord,supporting_facilities,surrounding_environment,house_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('121','房东用户','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/table','','0','','_blank','0','0','0','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('122','房东用户','预约看房','appointment_to_see_the_room','看房详情','/appointment_to_see_the_room/view','','0','','_blank','0','0','0','1','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{"can_limits":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('123','房东用户','预约看房','appointment_to_see_the_room','预约看房','/appointment_to_see_the_room/edit','','0','','_blank','0','0','0','0','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks','booking_code,house_title,area,house_type,housing_rent,housing_deposit,price_description,house_address,landlord_user,tenant_user,user_name,mobile_phone_number,appointment_time,appointment_remarks',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('124','房东用户','租赁合同','lease_contract','租赁合同','/lease_contract/table','','0','','_blank','1','1','1','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{"figure":true,"pay":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('125','房东用户','租赁合同','lease_contract','合同详情','/lease_contract/view','','0','','_blank','1','1','1','1','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease','contract_code,booking_code,house_title,area,house_type,housing_rent,housing_deposit,landlord_user,tenant_user,lease_months,total_amount,contract_name,signing_time,contract_documents,terms_of_lease',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('126','房东用户','维修记录','maintenance_records','维修记录','/maintenance_records/table','','0','','_blank','0','0','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{"examine":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('127','房东用户','维修记录','maintenance_records','记录详情','/maintenance_records/view','','0','','_blank','0','0','1','1','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance','maintenance_status,maintenance','contract_code,house_title,landlord_user,tenant_user,user_name,repair_title,repair_date,contents_of_repair_report,maintenance_status,maintenance',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('128','房东用户','投诉记录','complaint_records','投诉记录','/complaint_records/table','','0','','_blank','0','0','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{"examine":false}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('129','房东用户','投诉记录','complaint_records','记录详情','/complaint_records/view','','0','','_blank','0','0','0','1','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content','contract_code,house_title,landlord_user,tenant_user,user_name,complaint_title,date_of_complaint,complaint_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('130','房东用户','财务报表','financial_statements','财务报表','/financial_statements/table','','0','','_blank','1','1','1','1','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{"figure":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('131','房东用户','财务报表','financial_statements','报表详情','/financial_statements/view','','0','','_blank','1','1','1','1','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content','report_title,house_title,landlord_user,statistical_time,housing_rental_rate,rental_income,user_activity,statistical_content',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('132','房东用户','新闻信息','news_information','新闻信息','/news_information/table','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('133','房东用户','新闻信息','news_information','信息详情','/news_information/view','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('134','房东用户','新闻信息','news_information','新闻信息','/news_information/list','','0','top','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('135','房东用户','新闻信息','news_information','信息详情','/news_information/details','','0','','_blank','1','1','1','1','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details','landlord_user,news_name,news_type,news_pictures,release_date,news_brief,news_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('136','房东用户','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('137','房东用户','评论','comment','评论列表','/comment/table','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('138','房东用户','评论','comment','评论详情','/comment/view','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('139','房东用户','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('140','房东用户','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('141','房东用户','通知公告','notice','通知公告','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('142','房东用户','通知公告','notice','公告详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('143','房东用户','通知公告','notice','通知公告','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `auth` values ('144','房东用户','通知公告','notice','公告详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `user_group` values ('3','100','租客用户',null,'tenant_user','tenant_user_id','0','3','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `user_group` values ('4','100','房东用户',null,'landlord_user','landlord_user_id','0','1','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `collect` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `praise` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/static/upload/1834767404744310785.jpg','637','2025-06-21 09:16:20.0','2025-06-21 09:16:20.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/static/upload/1834767380874526721.jpg','826','2025-06-21 09:16:21.0','2025-06-21 09:16:21.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/static/upload/1915297550122876929.jpg','213','2025-06-21 09:16:21.0','2025-06-21 09:16:21.0');
