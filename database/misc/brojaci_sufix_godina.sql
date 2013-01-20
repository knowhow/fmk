SELECT u2.execute($$

ALTER TABLE fmk.fakt_fakt  ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.fakt_doks  ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.fakt_doks2 ALTER COLUMN brdok TYPE varchar(12);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40700);

--- end 4.7.0 verzija

--- start 4.7.1 verzija
SELECT u2.execute($$

DROP VIEW v_fin_suban_list_all;
DROP VIEW v_fin_sint_list_all;
DROP VIEW v_fin_anal_list_all;
DROP VIEW v_fin_nalog_list_all;

ALTER TABLE fmk.fin_suban  ALTER COLUMN brnal TYPE varchar(12);
ALTER TABLE fmk.fin_anal   ALTER COLUMN brnal TYPE varchar(12);
ALTER TABLE fmk.fin_sint   ALTER COLUMN brnal TYPE varchar(12);
ALTER TABLE fmk.fin_nalog  ALTER COLUMN brnal TYPE varchar(12);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40701);

--- end 4.7.1 verzija

--- start 4.7.2 verzija
SELECT u2.execute($$

ALTER TABLE fmk.kalk_kalk    ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.kalk_doks    ALTER COLUMN brdok TYPE varchar(12);
ALTER TABLE fmk.kalk_doks2   ALTER COLUMN brdok TYPE varchar(12);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40702);

--- end 4.7.2 verzija
