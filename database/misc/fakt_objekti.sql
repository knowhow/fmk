--- start 4.6.1 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.fakt_objekti
(
  id character(10),
  naz varchar(100)
);

DROP INDEX IF EXISTS fakt_objekti_id1;
CREATE INDEX fakt_objekti_id1 ON fmk.fakt_objekti(id);
GRANT ALL ON TABLE fmk.fakt_objekti TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_objekti
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

DROP INDEX IF EXISTS semaphores_fakt_objekti_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_objekti(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_objekti TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 40601);

--- end 4.6.1 verzija
