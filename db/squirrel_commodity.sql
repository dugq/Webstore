CREATE TABLE squirrel_commodity
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DOUBLE DEFAULT '0' NOT NULL,
    sales INT(11) DEFAULT '0' COMMENT '销售量',
    shops_id INT(11) NOT NULL COMMENT '商铺id',
    creation_time DATETIME NOT NULL COMMENT '创建时间',
    creation_user INT(11) NOT NULL COMMENT '创建人',
    description VARCHAR(200) NOT NULL,
    img_url VARCHAR(100) NOT NULL,
    class_Id INT(11)
);
CREATE UNIQUE INDEX squirrel_commodity_id_uindex ON squirrel_commodity (id);