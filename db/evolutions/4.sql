# Add likes and comments tables

# --- !Ups

-- -----------------------------------------------------
-- Table causelikes
-- -----------------------------------------------------
CREATE TABLE causelikes (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_causelikes_causeId (causeId ASC),
  INDEX fk_causelikes_userId (userId ASC));

-- -----------------------------------------------------
-- Table correctionlikes
-- -----------------------------------------------------
CREATE TABLE correctionlikes (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  correctionId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_correctionlikes_correctionId (correctionId ASC),
  INDEX fk_correctionlikes_userId (userId ASC));

-- -----------------------------------------------------
-- Table correctioncomments
-- -----------------------------------------------------
CREATE TABLE correctioncomments (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  correctionId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  comment TEXT NOT NULL,
  updated DATETIME NOT NULL,
  created DATETIME NOT NULL,
  tag SMALLINT(3) DEFAULT '0',
  PRIMARY KEY (id),
  INDEX fk_correctioncomments_1 (correctionId ASC),
  INDEX fk_correctioncomments_2 (userId ASC));

ALTER TABLE cause ADD COLUMN xCoordinate INT DEFAULT '100' NOT NULL;
ALTER TABLE cause ADD COLUMN yCoordinate INT DEFAULT '100' NOT NULL;

# --- !Downs

DROP TABLE correctioncomments;
DROP TABLE correctionlikes;
DROP TABLE causelikes;

ALTER TABLE cause DROP COLUMN xCoordinate;
ALTER TABLE cause DROP COLUMN yCoordinate;