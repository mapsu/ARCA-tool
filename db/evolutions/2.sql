# Add created and updated timestamps for rcacase and cause

# --- !Ups

ALTER TABLE rcacase ADD COLUMN created DATETIME NOT NULL;
ALTER TABLE rcacase ADD COLUMN updated DATETIME NOT NULL;

ALTER TABLE cause ADD COLUMN updated DATETIME NOT NULL;

# --- !Downs

ALTER TABLE rcacase DROP COLUMN created;
ALTER TABLE rcacase DROP COLUMN updated;

ALTER TABLE cause DROP COLUMN updated;