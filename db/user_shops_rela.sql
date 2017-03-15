CREATE TABLE user_shops_rela
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    shop_id INT(11) NOT NULL,
    creation_time DATETIME NOT NULL,
    status TINYINT(4) DEFAULT '0' NOT NULL,
    num INT(11) DEFAULT '1' NOT NULL
);
CREATE UNIQUE INDEX user_shops_rela_id_uindex ON user_shops_rela (id);