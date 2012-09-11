# First version

# --- !Ups

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
CREATE TABLE `user` (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX email (email ASC));

-- -----------------------------------------------------
-- Table rcacase
-- -----------------------------------------------------
CREATE TABLE rcacase (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  INDEX fk_rcacase_2 (ownerId ASC));

-- -----------------------------------------------------
-- Table cause
-- -----------------------------------------------------
CREATE TABLE cause (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NULL DEFAULT NULL,
  creatorId BIGINT(20) UNSIGNED NULL,
  rcaCaseId BIGINT(20) UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX fk_cause_1 (creatorId ASC),
  INDEX fk_cause_2 (rcaCaseId ASC));

-- -----------------------------------------------------
-- Table relation
-- -----------------------------------------------------
CREATE TABLE relation (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeFrom BIGINT(20) UNSIGNED NOT NULL,
  causeTo BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_relation_1 (causeFrom ASC),
  INDEX fk_relation_2 (causeTo ASC));

-- -----------------------------------------------------
-- Table correction
-- -----------------------------------------------------
CREATE TABLE correction (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeId BIGINT(20) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_correction_1 (causeId ASC));

-- -----------------------------------------------------
-- Table usercases
-- -----------------------------------------------------
CREATE TABLE usercases (
  userId BIGINT(20) UNSIGNED NOT NULL,
  caseId BIGINT(20) UNSIGNED NULL,
  PRIMARY KEY (userId, caseId),
  INDEX fk_usercases_1 (caseId ASC),
  INDEX fk_usercases_2 (userId ASC));

-- -----------------------------------------------------
-- Table invitation
-- -----------------------------------------------------
CREATE TABLE invitation (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  hash VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX hash_UNIQUE (hash ASC),
  UNIQUE INDEX email_UNIQUE (email ASC),
  UNIQUE INDEX id_UNIQUE (id ASC));

-- -----------------------------------------------------
-- Table invitationCases
-- -----------------------------------------------------
CREATE TABLE invitationCases (
  invitationId BIGINT(20) UNSIGNED NOT NULL,
  caseId BIGINT(20) UNSIGNED NULL,
  PRIMARY KEY (invitationId, caseId),
  INDEX fk_invitationCases_1 (invitationId ASC),
  INDEX fk_invitationCases_2 (caseId ASC));

# --- !Downs

DROP TABLE invitationCases;
DROP TABLE invitation;
DROP TABLE usercases;
DROP TABLE correction;
DROP TABLE relation;
DROP TABLE cause;
DROP TABLE rcacase;
DROP TABLE `user`;
