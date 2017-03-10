CREATE TABLE squirrel_user
(
    user_name VARCHAR(100) NOT NULL,
    user_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    real_name VARCHAR(100) NOT NULL,
    password VARCHAR(10) NOT NULL,
    user_type TINYINT(4) DEFAULT '0' NOT NULL COMMENT '用户类型0:普通用户（买家）
1：商家
2：管理员',
    email VARCHAR(100),
    money DOUBLE DEFAULT '0'
);
CREATE UNIQUE INDEX squirrel_user_user_id_uindex ON squirrel_user (user_id);