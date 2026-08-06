
# -----------------------------------------------------------------------
# authtemptokens
# -----------------------------------------------------------------------
drop table if exists authtemptokens;

CREATE TABLE authtemptokens
(
    ID VARCHAR(100) NOT NULL,
    token VARCHAR(100),
    signtoken VARCHAR(1000),
    createTime DECIMAL(20),
    lastVistTime DECIMAL(20),
    livetime DECIMAL(20),
    appid VARCHAR(100),
    secret VARCHAR(100),
    validate_ VARCHAR(10),
    PRIMARY KEY(ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# dualtokens
# -----------------------------------------------------------------------
drop table if exists dualtokens;

CREATE TABLE dualtokens
(
    ID VARCHAR(100) NOT NULL,
    token VARCHAR(100),
    signtoken VARCHAR(1000),
    createTime DECIMAL(20),
    lastVistTime DECIMAL(20),
    livetime DECIMAL(20),
    appid VARCHAR(100),
    secret VARCHAR(100),
    validate_ VARCHAR(10),
    PRIMARY KEY(ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# temptokens
# -----------------------------------------------------------------------
drop table if exists temptokens;

CREATE TABLE temptokens
(
    ID VARCHAR(100) NOT NULL,
    token VARCHAR(1000),
    createTime DECIMAL(20),
    livetime DECIMAL(20),
    validate_ VARCHAR(10),
    PRIMARY KEY(ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# eckeypairs
# -----------------------------------------------------------------------
drop table if exists eckeypairs;

CREATE TABLE eckeypairs
(
    appid VARCHAR(100) NOT NULL,
    privateKey VARCHAR(1500),
    createTime DECIMAL(20),
    publicKey VARCHAR(1500),
    PRIMARY KEY(appid)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# tickets
# -----------------------------------------------------------------------
drop table if exists tickets;

CREATE TABLE tickets
(
    token VARCHAR(100) NOT NULL,
    ticket VARCHAR(1500),
    createTime DECIMAL(20),
    livetime DECIMAL(20),
    appid VARCHAR(100),
    lastVistTime DECIMAL(20),
    PRIMARY KEY(token)) ENGINE=InnoDB;

