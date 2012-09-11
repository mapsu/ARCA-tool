# Add likes and comments tables

# --- !Ups

-- -----------------------------------------------------
-- Table causelikes
-- -----------------------------------------------------
CREATE TABLE causelikes (
  id SERIAL NOT NULL,
  causeId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table correctionlikes
-- -----------------------------------------------------
CREATE TABLE correctionlikes (
  id SERIAL NOT NULL,
  correctionId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table correctioncomments
-- -----------------------------------------------------
CREATE TABLE correctioncomments (
  id SERIAL NOT NULL ,
  correctionId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  comment TEXT NOT NULL,
  updated TIMESTAMP NOT NULL,
  created TIMESTAMP NOT NULL,
  tag INT DEFAULT '0',
  PRIMARY KEY (id)
);

ALTER TABLE cause ADD COLUMN xCoordinate INT DEFAULT '100' NOT NULL;
ALTER TABLE cause ADD COLUMN yCoordinate INT DEFAULT '100' NOT NULL;

# --- !Downs

DROP TABLE correctioncomments;
DROP TABLE correctionlikes;
DROP TABLE causelikes;

ALTER TABLE cause DROP COLUMN xCoordinate;
ALTER TABLE cause DROP COLUMN yCoordinate;