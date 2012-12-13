--- start 4.7.0 verzija
SELECT u2.execute($$

ALTER TABLE fmk.fakt_fakt  ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.fakt_doks  ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.fakt_doks2 ALTER COLUMN brdok TYPE varchar(12);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40700);

--- end 4.7.0 verzija
