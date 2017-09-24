CREATE TABLE contacts (
  ID BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  USER_ID BIGINT,
  NAME_AUTHOR VARCHAR(255) collate utf8_unicode_ci default NULL,
  EMAIL VARCHAR(255) collate utf8_unicode_ci default NULL,
  MESSAGE VARCHAR(2000) collate utf8_unicode_ci default NULL
)
  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC
  ENGINE InnoDB;