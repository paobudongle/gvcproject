
# -----------------------------------------------------------------------
# TD_SM_DICT
# -----------------------------------------------------------------------
drop table if exists TD_SM_DICT;

CREATE TABLE TD_SM_DICT
(
    DICT_ID VARCHAR(50) NOT NULL,
    HANDLER VARCHAR(50) NOT NULL,
    DICT_CODE VARCHAR(50) NOT NULL,
    DICT_NAME VARCHAR(50) NOT NULL,
    CACHE_ENABLE VARCHAR(1) NOT NULL,
    IS_TREE VARCHAR(1) NOT NULL,
    DICT_STATUS VARCHAR(1) default '1' NOT NULL,
    OWNER_ID VARCHAR(50) default '1',
    DICT_DESC VARCHAR(2000),
    PRIMARY KEY(DICT_ID)) ENGINE=InnoDB;


# -----------------------------------------------------------------------
# TD_SM_PARAMETERS
# -----------------------------------------------------------------------
drop table if exists TD_SM_PARAMETERS;

CREATE TABLE TD_SM_PARAMETERS
(
    PAEAM_ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    RN INTEGER(4) NOT NULL,
    data_order INTEGER(10) default 1 NOT NULL,
    VALUE VARCHAR(500),
    DICT_ID VARCHAR(50) NOT NULL,
    PRIMARY KEY(PAEAM_ID)) ENGINE=InnoDB;

