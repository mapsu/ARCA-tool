# First version

# --- !Ups

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
CREATE TABLE rcauser (
  id SERIAL NOT NULL,
  email VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uni_rcauser_0 UNIQUE (email)
);

-- -----------------------------------------------------
-- Table rcacase
-- -----------------------------------------------------
CREATE TABLE rcacase (
  id SERIAL NOT NULL,
  problemId BIGINT NULL,
  ownerId BIGINT NULL,
  name VARCHAR NOT NULL,
  companyName VARCHAR NOT NULL,
  caseTypeValue SMALLINT NOT NULL,
  companySizeValue SMALLINT NOT NULL,
  isMultinational boolean NULL DEFAULT '0',
  isCasePublic boolean NULL DEFAULT '0',
  caseGoals TEXT NOT NULL,
  companyProducts TEXT NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table cause
-- -----------------------------------------------------
CREATE TABLE cause (
  id SERIAL NOT NULL,
  name VARCHAR NULL DEFAULT NULL,
  creatorId BIGINT NULL,
  rcaCaseId BIGINT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table relation
-- -----------------------------------------------------
CREATE TABLE relation (
  id SERIAL NOT NULL,
  causeFrom BIGINT NOT NULL,
  causeTo BIGINT NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table correction
-- -----------------------------------------------------
CREATE TABLE correction (
  id SERIAL NOT NULL,
  causeId BIGINT NOT NULL,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table usercases
-- -----------------------------------------------------
CREATE TABLE usercases (
  userId BIGINT NOT NULL,
  caseId BIGINT NULL,
  PRIMARY KEY (userId, caseId)
);

-- -----------------------------------------------------
-- Table invitation
-- -----------------------------------------------------
CREATE TABLE invitation (
  id SERIAL NOT NULL,
  hash VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uni_invitation_0 UNIQUE (hash),
  CONSTRAINT uni_invitation_1 UNIQUE (email),
  CONSTRAINT uni_invitation_2 UNIQUE (id)
);

-- -----------------------------------------------------
-- Table invitationCases
-- -----------------------------------------------------
CREATE TABLE invitationCases (
  invitationId BIGINT NOT NULL,
  caseId BIGINT NOT NULL,
  PRIMARY KEY (invitationId, caseId)
);

# --- !Downs

DROP TABLE invitationCases;
DROP TABLE invitation;
DROP TABLE usercases;
DROP TABLE correction;
DROP TABLE relation;
DROP TABLE cause;
DROP TABLE rcacase;
DROP TABLE rcauser;
