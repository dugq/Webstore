CREATE TABLE squirreldb.squirrel_commodity
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DOUBLE DEFAULT 0 NOT NULL,
    sales INT DEFAULT 0 COMMENT '销售量',
    shops_id INT NOT NULL COMMENT '商铺id',
    creation_time DATETIME NOT NULL COMMENT '创建时间',
    creation_user INT NOT NULL COMMENT '创建人',
    description VARCHAR(200) NOT NULL
);
CREATE UNIQUE INDEX squirrel_commodity_id_uindex ON squirreldb.squirrel_commodity (id);
ALTER TABLE squirreldb.squirrel_commodity COMMENT = '商品表';