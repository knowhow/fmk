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

--- start 4.6.0 verzija

SELECT u2.execute($$

    ALTER TABLE fmk.fakt_fakt_atributi
    ADD CONSTRAINT brdok FOREIGN KEY (idfirma, idtipdok, brdok, rbr) 
    REFERENCES fmk.fakt_fakt (idfirma, idtipdok, brdok, rbr);

    -- mora se koristiti xml entiteti lt, gt
    INSERT into fmk.fakt_fakt_atributi(idfirma, idtipdok, brdok, rbr, atribut, value) select idfirma, idtipdok, brdok, rbr, 'opis', opis as value from fmk.fakt_fakt where opis is not null and length(trim(opis))>0;
$$)
WHERE ( fmk.primary_keys_on_off() = '1' and u2.knowhow_package_version('fmk') < 40600 );


--- end 4.6.0 verzija
