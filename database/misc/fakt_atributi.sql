--- start 4.5.2 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.fakt_fakt_atributi
(
  idfirma character(2),
  idtipdok character(2),
  brdok character(8),
  rbr character(3),
  atribut character(50),
  value varchar,
  PRIMARY KEY( idfirma, idtipdok, brdok, rbr, atribut )
);

DROP INDEX IF EXISTS fakt_fakt_atributi_id1;
CREATE INDEX fakt_fakt_atributi_id1 ON fmk.fakt_fakt_atributi(idfirma, idtipdok, brdok, rbr, atribut );
GRANT ALL ON TABLE fmk.fakt_fakt_atributi TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40502);

--- end 4.5.2 verzija

--- start 4.5.3 verzija

SELECT u2.execute($$

ALTER TABLE fmk.fakt_atributi ALTER COLUMN idfirma  TYPE varchar(2);
ALTER TABLE fmk.fakt_atributi ALTER COLUMN idtipdok TYPE varchar(2);
ALTER TABLE fmk.fakt_atributi ALTER COLUMN brdok    TYPE varchar(8);
ALTER TABLE fmk.fakt_atributi ALTER COLUMN rbr      TYPE varchar(3);
ALTER TABLE fmk.fakt_atributi ALTER COLUMN value    TYPE text;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40503);

--- end 4.5.3 verzija

