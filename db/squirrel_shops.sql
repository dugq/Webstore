CREATE TABLE squirrel_shops
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    creation_time DATETIME NOT NULL,
    shopkeeper INT(11) NOT NULL COMMENT '店主。指向userId',
    description VARCHAR(100) NOT NULL,
    status TINYINT(4) DEFAULT '0' NOT NULL,
    img_url VARCHAR(100)
);
CREATE UNIQUE INDEX squirrel_shops_id_uindex ON squirrel_shops (id);