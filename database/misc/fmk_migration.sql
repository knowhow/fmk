--- start 4.4.58 verzija

SELECT u2.execute($$
ALTER TABLE fmk.fakt_doks ALTER COLUMN oper_id TYPE integer;

ALTER TABLE fmk.fakt_fakt ADD COLUMN idrnal TYPE varchar(10);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40458);

--- end 4.4.58 verzija




