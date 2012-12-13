-- verzija 4.4.9

SELECT u2.execute($$

--- relations
CREATE TABLE IF NOT EXISTS fmk.ks
(
  id character(3),
  naz character(10),
  datod date,
  datdo date,
  strev numeric(8,4),
  stkam numeric(8,4),
  den numeric(15,6),
  tip character(1),
  duz numeric(4,0)
);

DROP INDEX IF EXISTS ks_id1;
CREATE INDEX ks_id1 ON fmk.ks(id);
GRANT ALL ON TABLE fmk.ks TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_ks
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_ks_user_code_idx;
CREATE INDEX on fmk.semaphores_ks(user_code);
GRANT ALL ON TABLE fmk.semaphores_ks TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40409);



--- start 4.4.58 verzija

SELECT u2.execute($$
ALTER TABLE fmk.fakt_doks ALTER COLUMN oper_id TYPE integer;

ALTER TABLE fmk.fakt_fakt ADD COLUMN idrnal varchar(10);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40458);

--- end 4.4.58 verzija
