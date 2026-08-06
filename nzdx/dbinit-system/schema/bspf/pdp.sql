ALTER TABLE TD_SM_GROUPROLE 
        DROP FOREIGN KEY TD_SM_GROUPROLE_FK_1;
    
ALTER TABLE TD_SM_LOGDETAIL 
        DROP FOREIGN KEY TD_SM_LOGDETAIL_FK_1;
    
ALTER TABLE TD_SM_LOGDETAIL_HIS 
        DROP FOREIGN KEY TD_SM_LOGDETAIL_HIS_FK_1;
    
ALTER TABLE TD_SM_ORGJOBROLE 
        DROP FOREIGN KEY TD_SM_ORGJOBROLE_FK_1;
    
ALTER TABLE TD_SM_ORGJOBROLE 
        DROP FOREIGN KEY TD_SM_ORGJOBROLE_FK_2;
    
ALTER TABLE TD_SM_ORGJOBROLE 
        DROP FOREIGN KEY TD_SM_ORGJOBROLE_FK_3;
    
ALTER TABLE TD_SM_ORGMANAGER 
        DROP FOREIGN KEY TD_SM_ORGMANAGER_FK_1;
    
ALTER TABLE TD_SM_ORGMANAGER 
        DROP FOREIGN KEY TD_SM_ORGMANAGER_FK_2;
    
ALTER TABLE TD_SM_ORGROLE 
        DROP FOREIGN KEY TD_SM_ORGROLE_FK_1;
    

# -----------------------------------------------------------------------
# TD_SM_GROUPROLE
# -----------------------------------------------------------------------
drop table if exists TD_SM_GROUPROLE;

CREATE TABLE TD_SM_GROUPROLE
(
    GROUP_ID VARCHAR(50) NOT NULL,
    ROLE_ID VARCHAR(50) NOT NULL,
    RESOP_ORIGIN_USERID VARCHAR(50) default '1',
    PRIMARY KEY(GROUP_ID,ROLE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_LOGDETAIL
# -----------------------------------------------------------------------
drop table if exists TD_SM_LOGDETAIL;

CREATE TABLE TD_SM_LOGDETAIL
(
    DETAIL_ID VARCHAR(50) NOT NULL,
    OPER_TABLE VARCHAR(50),
    LOG_ID VARCHAR(50),
    OP_KEY_ID VARCHAR(50),
    DETAIL_CONTENT LONGTEXT,
    OP_TYPE INTEGER(1),
    PRIMARY KEY(DETAIL_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_LOGDETAIL_HIS
# -----------------------------------------------------------------------
drop table if exists TD_SM_LOGDETAIL_HIS;

CREATE TABLE TD_SM_LOGDETAIL_HIS
(
    DETAIL_ID VARCHAR(50) NOT NULL,
    OPER_TABLE VARCHAR(50),
    LOG_ID VARCHAR(50),
    OP_KEY_ID VARCHAR(50),
    DETAIL_CONTENT LONGTEXT,
    OP_TYPE INTEGER(1),
    PRIMARY KEY(DETAIL_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGJOBROLE
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGJOBROLE;

CREATE TABLE TD_SM_ORGJOBROLE
(
    ORG_ID VARCHAR(50) NOT NULL,
    JOB_ID VARCHAR(50) NOT NULL,
    ROLE_ID VARCHAR(50) NOT NULL,
    RESOP_ORIGIN_USERID VARCHAR(50) default '1',
    PRIMARY KEY(ORG_ID,JOB_ID,ROLE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGMANAGER
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGMANAGER;

CREATE TABLE TD_SM_ORGMANAGER
(
    USER_ID VARCHAR(50) NOT NULL,
    ORG_ID VARCHAR(50) NOT NULL,
    PRIMARY KEY(USER_ID,ORG_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGROLE
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGROLE;

CREATE TABLE TD_SM_ORGROLE
(
    ORG_ID VARCHAR(50) NOT NULL,
    ROLE_ID VARCHAR(50) NOT NULL,
    RESOP_ORIGIN_USERID VARCHAR(50) default '1',
    PRIMARY KEY(ORG_ID,ROLE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_GROUP
# -----------------------------------------------------------------------
drop table if exists TD_SM_GROUP;

CREATE TABLE TD_SM_GROUP
(
    GROUP_ID VARCHAR(50) NOT NULL,
    GROUP_NAME VARCHAR(100),
    GROUP_DESC VARCHAR(100),
    REMARK1 VARCHAR(100),
    REMARK2 VARCHAR(100),
    REMARK3 VARCHAR(100),
    REMARK4 VARCHAR(100),
    REMARK5 VARCHAR(100),
    PARENT_ID VARCHAR(50),
    GROUP_TREE_LEVEL VARCHAR(200),
    OWNER_ID VARCHAR(50) default '1',
    PRIMARY KEY(GROUP_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_JOB
# -----------------------------------------------------------------------
drop table if exists TD_SM_JOB;

CREATE TABLE TD_SM_JOB
(
    JOB_ID VARCHAR(50) NOT NULL,
    JOB_NAME VARCHAR(100),
    JOB_DESC VARCHAR(200),
    JOB_FUNCTION VARCHAR(200),
    JOB_AMOUNT VARCHAR(100),
    JOB_NUMBER VARCHAR(100),
    JOB_CONDITION VARCHAR(200),
    JOB_RANK VARCHAR(100),
    OWNER_ID VARCHAR(50) default '1',
    PRIMARY KEY(JOB_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_LOG
# -----------------------------------------------------------------------
drop table if exists TD_SM_LOG;

CREATE TABLE TD_SM_LOG
(
    LOG_ID VARCHAR(50) NOT NULL,
    LOG_OPERUSER VARCHAR(50),
    OP_ORGID VARCHAR(50),
    OPER_MODULE VARCHAR(200),
    LOG_VISITORIAL VARCHAR(200),
    LOG_OPERTIME DATETIME,
    LOG_CONTENT LONGTEXT,
    REMARK1 VARCHAR(100),
    OPER_TYPE INTEGER(1),
    PRIMARY KEY(LOG_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_LOGMODULE
# -----------------------------------------------------------------------
drop table if exists TD_SM_LOGMODULE;

CREATE TABLE TD_SM_LOGMODULE
(
    LOGMODULE VARCHAR(50),
    STATUS INTEGER(2),
    MODULE_DESC VARCHAR(50),
    ID VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_LOG_HIS
# -----------------------------------------------------------------------
drop table if exists TD_SM_LOG_HIS;

CREATE TABLE TD_SM_LOG_HIS
(
    LOG_ID VARCHAR(50) NOT NULL,
    LOG_OPERUSER VARCHAR(50),
    OP_ORGID VARCHAR(50),
    OPER_MODULE VARCHAR(200),
    LOG_VISITORIAL VARCHAR(200),
    LOG_OPERTIME DATETIME,
    LOG_CONTENT LONGTEXT,
    REMARK1 VARCHAR(100),
    OPER_TYPE INTEGER(1),
    LOG_ARCHTIME DATETIME,
    PRIMARY KEY(LOG_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGANIZATION
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGANIZATION;

CREATE TABLE TD_SM_ORGANIZATION
(
    ORG_ID VARCHAR(50) NOT NULL,
    ORG_SN INTEGER(10) NOT NULL,
    ORG_NAME VARCHAR(100) NOT NULL,
    PARENT_ID VARCHAR(100) NOT NULL,
    PATH VARCHAR(1000),
    LAYER VARCHAR(200),
    CHILDREN VARCHAR(1000),
    CODE VARCHAR(100),
    JP VARCHAR(40),
    QP VARCHAR(40),
    CREATINGTIME DATETIME,
    CREATOR VARCHAR(100) default '1',
    ORGNUMBER VARCHAR(100),
    ORGDESC VARCHAR(300),
    REMARK1 VARCHAR(100),
    REMARK2 VARCHAR(100),
    REMARK3 VARCHAR(100),
    REMARK4 VARCHAR(100),
    REMARK5 VARCHAR(100),
    CHARGEORGID VARCHAR(50),
    ISPARTYBUSSINESS INTEGER(1) default 1,
    SATRAPJOBID VARCHAR(50),
    ORG_LEVEL VARCHAR(1) default '1',
    ORG_XZQM VARCHAR(10),
    ORG_TREE_LEVEL VARCHAR(500),
    ISDIRECTLYPARTY INTEGER(1) default 0,
    ISFOREIGNPARTY INTEGER(1) default 0,
    ISJICHAPARTY INTEGER(1) default 0,
    ISDIRECTGUANHU INTEGER(1) default 0,
    ORGLEADER VARCHAR(50),
    PRIMARY KEY(ORG_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGJOB
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGJOB;

CREATE TABLE TD_SM_ORGJOB
(
    ORG_ID VARCHAR(50) NOT NULL,
    JOB_ID VARCHAR(50) NOT NULL,
    JOB_SN INTEGER(10),
    PRIMARY KEY(ORG_ID,JOB_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGUSER
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGUSER;

CREATE TABLE TD_SM_ORGUSER
(
    ORG_ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    PRIMARY KEY(USER_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_RES
# -----------------------------------------------------------------------
drop table if exists TD_SM_RES;

CREATE TABLE TD_SM_RES
(
    RES_ID VARCHAR(50) NOT NULL,
    RESTYPE_ID VARCHAR(50),
    RESTYPE_Name VARCHAR(50),
    RES_NAME VARCHAR(500),
    RES_CODE VARCHAR(500),
    ROLE_USAGE VARCHAR(1),
    PARENT_ID VARCHAR(50),
    PATH VARCHAR(1000),
    MARKER VARCHAR(200),
    RESERVED1 VARCHAR(200),
    RESERVED3 VARCHAR(200),
    RESERVED4 VARCHAR(200),
    RESERVED5 VARCHAR(200),
    ATTR1 VARCHAR(200),
    ATTR2 VARCHAR(200),
    ATTR3 VARCHAR(200),
    ATTR4 VARCHAR(200),
    ATTR5 VARCHAR(200),
    ATTR6 VARCHAR(200),
    ATTR7 VARCHAR(200),
    ATTR8 VARCHAR(200),
    ATTR9 VARCHAR(200),
    ATTR10 VARCHAR(200),
    ATTR11 VARCHAR(200),
    ATTR12 VARCHAR(200),
    ATTR13 VARCHAR(200),
    ATTR14 VARCHAR(200),
    ATTR15 VARCHAR(200),
    ATTR16 VARCHAR(200),
    ATTR17 VARCHAR(200),
    ATTR18 VARCHAR(200),
    ATTR19 VARCHAR(200),
    ATTR20 VARCHAR(200),
    ATTR21 VARCHAR(200),
    ATTR22 VARCHAR(200),
    ATTR23 VARCHAR(200),
    ATTR24 VARCHAR(200),
    ATTR25 VARCHAR(200),
    ATTR26 VARCHAR(200) default '0',
    ATTR27 VARCHAR(1000),
    TITLE VARCHAR(500),
    PRIMARY KEY(RES_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ROLE
# -----------------------------------------------------------------------
drop table if exists TD_SM_ROLE;

CREATE TABLE TD_SM_ROLE
(
    ROLE_ID VARCHAR(50) NOT NULL,
    ROLE_NAME VARCHAR(100) NOT NULL,
    ROLE_TYPE VARCHAR(100),
    ROLE_DESC VARCHAR(1024),
    ROLE_USAGE VARCHAR(1),
    REMARK1 VARCHAR(100),
    REMARK2 VARCHAR(100),
    REMARK3 VARCHAR(100),
    OWNER_ID VARCHAR(50) default '1',
    PRIMARY KEY(ROLE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ROLERESOP
# -----------------------------------------------------------------------
drop table if exists TD_SM_ROLERESOP;

CREATE TABLE TD_SM_ROLERESOP
(
    OP_ID VARCHAR(50) NOT NULL,
    RES_ID VARCHAR(100) NOT NULL,
    ROLE_ID VARCHAR(50) NOT NULL,
    RESTYPE_ID VARCHAR(50) NOT NULL,
    AUTO VARCHAR(50),
    RES_NAME VARCHAR(500),
    TYPES VARCHAR(50) NOT NULL,
    AUTHORIZATION_TYPE INTEGER(2) default 0,
    USE_COUNT INTEGER(10),
    AUTHORIZATION_STIME DATETIME,
    AUTHORIZATION_ETIME DATETIME,
    USE_COUNTED INTEGER(10),
    PRIMARY KEY(OP_ID,RES_ID,ROLE_ID,RESTYPE_ID,TYPES)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ROLETYPE
# -----------------------------------------------------------------------
drop table if exists TD_SM_ROLETYPE;

CREATE TABLE TD_SM_ROLETYPE
(
    TYPE_NAME VARCHAR(100),
    TYPE_DESC VARCHAR(500),
    TYPE_ID VARCHAR(50) NOT NULL,
    CREATOR_USER_ID VARCHAR(20) default '1',
    CREATOR_ORG_ID VARCHAR(20) default '1',
    PRIMARY KEY(TYPE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USER
# -----------------------------------------------------------------------
drop table if exists TD_SM_USER;

CREATE TABLE TD_SM_USER
(
    USER_ID VARCHAR(50) NOT NULL,
    USER_SN INTEGER(10) NOT NULL,
    USER_NAME VARCHAR(200) NOT NULL,
    USER_PASSWORD VARCHAR(200) NOT NULL,
    USER_REALNAME VARCHAR(100) NOT NULL,
    USER_PINYIN VARCHAR(100),
    USER_SEX VARCHAR(100),
    USER_HOMETEL VARCHAR(100),
    USER_WORKTEL VARCHAR(100),
    USER_WORKNUMBER VARCHAR(100),
    USER_MOBILETEL1 VARCHAR(100),
    USER_MOBILETEL2 VARCHAR(100),
    USER_FAX VARCHAR(100),
    USER_OICQ VARCHAR(100),
    USER_BIRTHDAY DATETIME,
    USER_EMAIL VARCHAR(100),
    USER_ADDRESS VARCHAR(200),
    USER_POSTALCODE VARCHAR(10),
    USER_IDCARD VARCHAR(50),
    USER_ISVALID INTEGER(2),
    USER_REGDATE DATETIME,
    USER_LOGINCOUNT INTEGER(10),
    USER_TYPE VARCHAR(100),
    REMARK1 VARCHAR(100),
    REMARK2 VARCHAR(100),
    REMARK3 VARCHAR(100),
    REMARK4 VARCHAR(100),
    REMARK5 VARCHAR(100),
    PAST_TIME DATETIME,
    DREDGE_TIME VARCHAR(50),
    LASTLOGIN_DATE DATETIME,
    WORKLENGTH VARCHAR(50),
    POLITICS VARCHAR(100),
    ISTAXMANAGER INTEGER(1),
    LOGON_IP VARCHAR(15),
    CERT_SN VARCHAR(50),
    PASSWORD_UPDATETIME TIMESTAMP NULL DEFAULT NULL,
    Password_DualTime INTEGER(10),
    PASSWORD_TEXT VARCHAR(50),
    DEPART_ID VARCHAR(50),
    USER_PICTURE VARCHAR(500),
    update_time TIMESTAMP NULL DEFAULT NULL,
    USER_JOB VARCHAR(100),
    PRIMARY KEY(USER_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USERGROUP
# -----------------------------------------------------------------------
drop table if exists TD_SM_USERGROUP;

CREATE TABLE TD_SM_USERGROUP
(
    GROUP_ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    PRIMARY KEY(GROUP_ID,USER_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USERJOBORG
# -----------------------------------------------------------------------
drop table if exists TD_SM_USERJOBORG;

CREATE TABLE TD_SM_USERJOBORG
(
    USER_ID VARCHAR(50) NOT NULL,
    JOB_ID VARCHAR(50) NOT NULL,
    ORG_ID VARCHAR(50) NOT NULL,
    SAME_JOB_USER_SN INTEGER(10),
    JOB_SN INTEGER(10),
    JOB_STARTTIME DATETIME,
    JOB_FETTLE INTEGER(10),
    PRIMARY KEY(USER_ID,JOB_ID,ORG_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USERJOBORG_HISTORY
# -----------------------------------------------------------------------
drop table if exists TD_SM_USERJOBORG_HISTORY;

CREATE TABLE TD_SM_USERJOBORG_HISTORY
(
    USER_ID VARCHAR(50) NOT NULL,
    JOB_ID VARCHAR(50) NOT NULL,
    JOB_NAME VARCHAR(100) NOT NULL,
    ORG_ID VARCHAR(50) NOT NULL,
    ORG_NAME VARCHAR(100) NOT NULL,
    JOB_STARTTIME DATETIME,
    JOB_QUASHTIME DATETIME,
    JOB_FETTLE INTEGER(10)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USERROLE
# -----------------------------------------------------------------------
drop table if exists TD_SM_USERROLE;

CREATE TABLE TD_SM_USERROLE
(
    USER_ID VARCHAR(50) NOT NULL,
    ROLE_ID VARCHAR(50) NOT NULL,
    RESOP_ORIGIN_USERID VARCHAR(50) default '1',
    START_DATE DATETIME,
    END_DATE DATETIME,
    PRIMARY KEY(USER_ID,ROLE_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# td_sm_deskmenu
# -----------------------------------------------------------------------
drop table if exists td_sm_deskmenu;

CREATE TABLE td_sm_deskmenu
(
    menupath VARCHAR(150) NOT NULL,
    userid VARCHAR(50) NOT NULL,
    subsystem VARCHAR(50) NOT NULL,
    item_order INTEGER(10) default 0 NOT NULL,
    PRIMARY KEY(menupath,userid,subsystem)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# td_sm_menucustom
# -----------------------------------------------------------------------
drop table if exists td_sm_menucustom;

CREATE TABLE td_sm_menucustom
(
    menupath VARCHAR(150) NOT NULL,
    userid VARCHAR(40) NOT NULL,
    subsystem VARCHAR(50) NOT NULL,
    width INTEGER(10) default 0 NOT NULL,
    height INTEGER(10) default 0 NOT NULL,
    PRIMARY KEY(menupath,userid,subsystem)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# td_sm_desktopblackground
# -----------------------------------------------------------------------
drop table if exists td_sm_desktopblackground;

CREATE TABLE td_sm_desktopblackground
(
    userid VARCHAR(10) NOT NULL,
    subsystem VARCHAR(50) NOT NULL,
    filename VARCHAR(200) NOT NULL,
    fit VARCHAR(2) default '0' NOT NULL,
    PRIMARY KEY(userid,subsystem)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# Td_sm_desktopstylecustom
# -----------------------------------------------------------------------
drop table if exists Td_sm_desktopstylecustom;

CREATE TABLE Td_sm_desktopstylecustom
(
    userid VARCHAR(40) NOT NULL,
    subsystem VARCHAR(50) NOT NULL,
    filename VARCHAR(150) NOT NULL,
    cn_name VARCHAR(200) default '0' NOT NULL,
    creatdate TIMESTAMP NULL DEFAULT NULL,
    picture LONGBLOB,
    PRIMARY KEY(userid,subsystem,filename)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_PASSWORDHIS
# -----------------------------------------------------------------------
drop table if exists TD_SM_PASSWORDHIS;

CREATE TABLE TD_SM_PASSWORDHIS
(
    USER_ID VARCHAR(50),
    PASSWORD_ VARCHAR(100),
    PASSWORD_TIME TIMESTAMP NULL DEFAULT NULL) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_USERPARAMETERS
# -----------------------------------------------------------------------
drop table if exists TD_SM_USERPARAMETERS;

CREATE TABLE TD_SM_USERPARAMETERS
(
    PARAM_TYPE VARCHAR(50) NOT NULL,
    NODE_ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    RN INTEGER(10) NOT NULL,
    VALUE VARCHAR(200),
    ISBIGDATA INTEGER(1),
    BIGDATA LONGBLOB,
    PRIMARY KEY(PARAM_TYPE,NODE_ID,NAME,RN)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_ORGPARAMETERS
# -----------------------------------------------------------------------
drop table if exists TD_SM_ORGPARAMETERS;

CREATE TABLE TD_SM_ORGPARAMETERS
(
    PARAM_TYPE VARCHAR(50) NOT NULL,
    NODE_ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    RN INTEGER(10) NOT NULL,
    VALUE VARCHAR(200),
    ISBIGDATA INTEGER(1),
    BIGDATA LONGBLOB,
    PRIMARY KEY(PARAM_TYPE,NODE_ID,NAME,RN)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_IPCONTROL
# -----------------------------------------------------------------------
drop table if exists TD_SM_IPCONTROL;

CREATE TABLE TD_SM_IPCONTROL
(
    ID VARCHAR(50) NOT NULL,
    IP VARCHAR(1000),
    CONTROLUSER VARCHAR(100),
    FILTERTYPE VARCHAR(1),
    IPDESC VARCHAR(2000),
    PRIMARY KEY(ID)) ENGINE=InnoDB;

ALTER TABLE TD_SM_GROUPROLE
    ADD CONSTRAINT TD_SM_GROUPROLE_FK_1
    FOREIGN KEY (ROLE_ID)
    REFERENCES TD_SM_ROLE (ROLE_ID)
;

ALTER TABLE TD_SM_LOGDETAIL
    ADD CONSTRAINT TD_SM_LOGDETAIL_FK_1
    FOREIGN KEY (LOG_ID)
    REFERENCES TD_SM_LOG (LOG_ID)
;

ALTER TABLE TD_SM_LOGDETAIL_HIS
    ADD CONSTRAINT TD_SM_LOGDETAIL_HIS_FK_1
    FOREIGN KEY (LOG_ID)
    REFERENCES TD_SM_LOG_HIS (LOG_ID)
;

ALTER TABLE TD_SM_ORGJOBROLE
    ADD CONSTRAINT TD_SM_ORGJOBROLE_FK_1
    FOREIGN KEY (ROLE_ID)
    REFERENCES TD_SM_ROLE (ROLE_ID)
;

ALTER TABLE TD_SM_ORGJOBROLE
    ADD CONSTRAINT TD_SM_ORGJOBROLE_FK_2
    FOREIGN KEY (ORG_ID)
    REFERENCES TD_SM_ORGANIZATION (ORG_ID)
;

ALTER TABLE TD_SM_ORGJOBROLE
    ADD CONSTRAINT TD_SM_ORGJOBROLE_FK_3
    FOREIGN KEY (JOB_ID)
    REFERENCES TD_SM_JOB (JOB_ID)
;

ALTER TABLE TD_SM_ORGMANAGER
    ADD CONSTRAINT TD_SM_ORGMANAGER_FK_1
    FOREIGN KEY (USER_ID)
    REFERENCES TD_SM_USER (USER_ID)
;

ALTER TABLE TD_SM_ORGMANAGER
    ADD CONSTRAINT TD_SM_ORGMANAGER_FK_2
    FOREIGN KEY (ORG_ID)
    REFERENCES TD_SM_ORGANIZATION (ORG_ID)
;

ALTER TABLE TD_SM_ORGROLE
    ADD CONSTRAINT TD_SM_ORGROLE_FK_1
    FOREIGN KEY (ROLE_ID)
    REFERENCES TD_SM_ROLE (ROLE_ID)
;

