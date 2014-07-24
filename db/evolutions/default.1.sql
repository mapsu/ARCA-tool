# First database schema

# --- !Ups

-- -----------------------------------------------------
-- Table rcacase
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS rcacase (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  URLHash varchar(255) DEFAULT NULL,
  importId bigint(20) unsigned DEFAULT NULL,
  problemId BIGINT(20) UNSIGNED NULL,
  ownerId BIGINT(20) UNSIGNED NULL,
  name VARCHAR(255) NOT NULL,
  companyName VARCHAR(255) NOT NULL,
  caseTypeValue SMALLINT(6) NOT NULL,
  companySizeValue SMALLINT(6) NOT NULL,
  isMultinational TINYINT(1) NULL DEFAULT '0',
  isCasePublic TINYINT(1) NULL DEFAULT '0',
  caseGoals TEXT NOT NULL,
  companyProducts TEXT NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_rcacase_1 (problemId ASC),
  INDEX fk_rcacase_2 (ownerId ASC)
);


-- -----------------------------------------------------
-- Table cause
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS cause (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NULL DEFAULT NULL,
  creatorId BIGINT(20) UNSIGNED NULL,
  rcaCaseId BIGINT(20) UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX fk_cause_1 (creatorId ASC),
  INDEX fk_cause_2 (rcaCaseId ASC)
);


-- -----------------------------------------------------
-- Table relation
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS relation (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeFrom BIGINT(20) UNSIGNED NOT NULL,
  causeTo BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_relation_1 (causeFrom ASC),
  INDEX fk_relation_2 (causeTo ASC)
);


-- -----------------------------------------------------
-- Table correction
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS correction (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeId BIGINT(20) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_correction_1 (causeId ASC)
);


# --- !Downs

DROP TABLE rcacase;
DROP TABLE cause;
DROP TABLE relation;
DROP TABLE correction;
