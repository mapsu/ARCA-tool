# Add status values for cause and correction

# --- !Ups

ALTER TABLE cause ADD COLUMN statusValue INT NOT NULL DEFAULT '1';
ALTER TABLE correction ADD COLUMN statusValue INT NOT NULL DEFAULT '1';

# --- !Downs

ALTER TABLE cause DROP COLUMN statusValue;
ALTER TABLE correction DROP COLUMN statusValue;