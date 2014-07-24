# Likes, comments and coordinates for causes and corrections

# --- !Ups

-- -----------------------------------------------------
-- Table causelikes
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS causelikes (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  causeId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_causelikes_causeId (causeId ASC),
  INDEX fk_causelikes_userId (userId ASC)
);

-- -----------------------------------------------------
-- Table correctionlikes
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS correctionlikes (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  correctionId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_correctionlikes_correctionId (correctionId ASC),
  INDEX fk_correctionlikes_userId (userId ASC)
);

-- -----------------------------------------------------
-- Table correctioncomments
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS correctioncomments (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  correctionId BIGINT(20) UNSIGNED NOT NULL,
  userId BIGINT(20) UNSIGNED NOT NULL,
  comment TEXT NOT NULL,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tag SMALLINT(3) DEFAULT '0',
  PRIMARY KEY (id),
  INDEX fk_correctioncomments_1 (correctionId ASC),
  INDEX fk_correctioncomments_2 (userId ASC)
);


ALTER TABLE cause ADD COLUMN xCoordinate INT DEFAULT '100' NOT NULL;
ALTER TABLE cause ADD COLUMN yCoordinate INT DEFAULT '100' NOT NULL;

# --- !Downs

ALTER TABLE cause DROP COLUMN xCoordinate;
ALTER TABLE cause DROP COLUMN yCoordinate;

DROP TABLE IF EXISTS correctioncomments;
DROP TABLE IF EXISTS correctionlikes;
DROP TABLE IF EXISTS causelikes;
