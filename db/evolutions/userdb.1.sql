# First database schema

# --- !Ups

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS user (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  email VARCHAR(255) NOT NULL ,
  name VARCHAR(255) NOT NULL ,
  password VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id) ,
  UNIQUE INDEX email (email ASC)
);

-- -----------------------------------------------------
-- Table usercases
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS usercases (
  userId BIGINT(20) UNSIGNED NOT NULL ,
  caseId BIGINT(20) UNSIGNED NULL ,
  PRIMARY KEY (userId, caseId) ,
  INDEX fk_usercases_1 (caseId ASC) ,
  INDEX fk_usercases_2 (userId ASC)
);


-- -----------------------------------------------------
-- Table invitation
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS invitation (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  hash VARCHAR(255) NOT NULL ,
  email VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id) ,
  UNIQUE INDEX hash_UNIQUE (hash ASC) ,
  UNIQUE INDEX email_UNIQUE (email ASC) ,
  UNIQUE INDEX id_UNIQUE (id ASC)
);


-- -----------------------------------------------------
-- Table invitationCases
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS invitationCases (
  invitationId BIGINT(20) UNSIGNED NOT NULL ,
  caseId BIGINT(20) UNSIGNED NULL ,
  PRIMARY KEY (invitationId, caseId) ,
  INDEX fk_invitationCases_1 (invitationId ASC) ,
  INDEX fk_invitationCases_2 (caseId ASC)
);

# --- !Downs

DROP TABLE invitationCases;
DROP TABLE invitation;
DROP TABLE usercases;
DROP TABLE user;
