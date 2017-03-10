CREATE TABLE squirrel_classification
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    creation_time DATETIME NOT NULL
);
CREATE UNIQUE INDEX squirrel_classification_id_uindex ON squirrel_classification (id);
CREATE UNIQUE INDEX squirrel_classification_name_uindex ON squirrel_classification (name);