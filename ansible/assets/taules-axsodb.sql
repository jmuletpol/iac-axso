--fitxer: taules-axsodb.sql
USE axso2021db;

DROP TABLE IF EXISTS etc_passwd_group;
DROP TABLE IF EXISTS etc_passwd;
DROP TABLE IF EXISTS etc_group;

CREATE TABLE IF NOT EXISTS etc_group (
    group_name varchar(255) NOT NULL,
    password varchar(255) NOT NULL DEFAULT '',
    gid INTEGER,
    group_list varchar(3200) NOT NULL,
    CONSTRAINT pk_etc_group PRIMARY KEY(group_name),
    CONSTRAINT uk_etc_group_gid UNIQUE (gid)
);

CREATE TABLE IF NOT EXISTS etc_passwd (
	username varchar(32) NOT NULL,
	password varchar(255) NOT NULL DEFAULT 'x',
	uid INTEGER,
	primary_gid INTEGER,
	uid_info varchar(255),
	home varchar(255) NOT NULL,
	shell varchar(25) NOT NULL,
	CONSTRAINT pk_etc_passwd PRIMARY KEY(username),
	CONSTRAINT uk_etc_passwd_uid UNIQUE(uid),
 	CONSTRAINT fk_etc_passwd_gid FOREIGN KEY(primary_gid) REFERENCES etc_group(gid)
);

CREATE TABLE IF NOT EXISTS etc_passwd_group (
	username varchar(32),
	group_name varchar(255),
	CONSTRAINT pk_etc_passwd_group PRIMARY KEY (username, group_name),
	CONSTRAINT fk_etc_passwd_group_u FOREIGN KEY (username) REFERENCES etc_passwd(username),
	CONSTRAINT fk_etc_passwd_group_g FOREIGN KEY (group_name) REFERENCES etc_group(group_name)
);