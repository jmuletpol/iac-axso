-- Fitxer: importar-etcdata.sql
-- Importa les dades del fitxer /etc/group a la taula axso2021db.etc_group

USE axso2021db;

LOAD DATA INFILE '/etc/group'
REPLACE INTO TABLE axso2021db.etc_group
FIELDS TERMINATED BY ':'
LINES TERMINATED BY '\n'
(group_name, password, gid, group_list);

LOAD DATA INFILE '/etc/passwd' 
REPLACE INTO TABLE axso2021db.etc_passwd
FIELDS TERMINATED BY ':' 
LINES TERMINATED BY '\n'
(username, password, uid, primary_gid, uid_info, home, shell);

-- finalment importa el fitxer de la relació N:M
LOAD DATA LOCAL INFILE '/tmp/usuari-grup.csv'
REPLACE INTO TABLE axso2021db.etc_passwd_group
FIELDS TERMINATED BY ':' 
LINES TERMINATED BY '\n'
(group_name, username);

