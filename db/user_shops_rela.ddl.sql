CREATE TABLE user_shops_rela
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    shop_id INT(11) NOT NULL,
    creation_time DATETIME NOT NULL
);
CREATE UNIQUE INDEX user_shops_rela_id_uindex ON user_shops_rela (id);