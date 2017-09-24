/*CREATE SEQUENCE COUNT_ID_BAND;*/

CREATE TABLE band(
  ID BIGSERIAL PRIMARY KEY NOT NULL,
  USER_ID BIGINT,
  CREATE_DATE DATE NOT NULL,
  DATE_BAND DATE NOT NULL,
  DAY INT,
  MONTH VARCHAR(3),
  YEAR INT,
  NAME_BAND VARCHAR(255),
  START_TIME VARCHAR(10) NOT NULL,
  END_TIME VARCHAR(10) NOT NULL,
  COUNT_HOURS INT,
  PRICE INT,
  COMMENT VARCHAR(255)
);

