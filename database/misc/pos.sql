--
-- This file is part of the knowhow ERP, a free and open source
-- Enterprise Resource Planning software suite,
-- Copyright (c) 1994-2011 by bring.out doo Sarajevo.
-- It is licensed to you under the Common Public Attribution License
-- version 1.0, the full text of which (including knowhow-specific Exhibits)
-- is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
-- root directory of this source code archive.
-- By using this software, you agree to be bound by its terms.
--

--- start 4.2.5 verzija

SELECT u2.execute($$


CREATE TABLE IF NOT EXISTS fmk.pos_doks
(
  idpos varchar(2),
  idvd varchar(2),
  brdok varchar(6),
  datum date,
  idgost varchar(8),
  idradnik varchar(4),
  idvrstep character(2),
  m1 varchar(1),
  placen character(1),
  prebacen character(1),
  smjena varchar(1),
  sto varchar(3),
  vrijeme varchar(5),
  c_1 varchar(6),
  c_2 varchar(10),
  c_3 varchar(50),
  fisc_rn numeric(10, 0),
  zak_br numeric(6, 0),
  sto_br numeric(3, 0),
  funk numeric(3, 0),
  PRIMARY KEY(idpos, idvd, brdok)
);

DROP INDEX IF EXISTS pos_doks_id1;
DROP INDEX IF EXISTS pos_doks_id2;
DROP INDEX IF EXISTS pos_doks_id3;
DROP INDEX IF EXISTS pos_doks_id4;
DROP INDEX IF EXISTS pos_doks_id5;
DROP INDEX IF EXISTS pos_doks_id6;
CREATE INDEX pos_doks_id1 ON fmk.pos_doks(idpos, idvd, datum, brdok);
CREATE INDEX pos_doks_id2 ON fmk.pos_doks(idvd, datum, smjena);
CREATE INDEX pos_doks_id3 ON fmk.pos_doks(idgost, placen, datum);
CREATE INDEX pos_doks_id4 ON fmk.pos_doks(idvd, m1);
CREATE INDEX pos_doks_id5 ON fmk.pos_doks(prebacen);
CREATE INDEX pos_doks_id6 ON fmk.pos_doks(datum);
GRANT ALL ON TABLE fmk.pos_doks TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_doks
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

DROP INDEX IF EXISTS semaphores_pos_doks_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_doks(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_doks TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.pos_pos
(
  idpos varchar(2),
  idvd varchar(2),
  brdok varchar(6),
  datum date,
  idcijena varchar(1),
  iddio varchar(2),
  idodj character(2),
  idradnik varchar(4),
  idroba character(10),
  idtarifa character(6),
  m1 varchar(1),
  mu_i varchar(1),
  prebacen varchar(1),
  smjena varchar(1),
  c_1 varchar(6),
  c_2 varchar(10),
  c_3 varchar(50),
  kolicina numeric(18, 3),
  kol2 numeric(18, 3),
  cijena numeric(10, 3),
  ncijena numeric(10, 3)
);

DROP INDEX IF EXISTS pos_pos_id1;
DROP INDEX IF EXISTS pos_pos_id2;
DROP INDEX IF EXISTS pos_pos_id3;
DROP INDEX IF EXISTS pos_pos_id4;
DROP INDEX IF EXISTS pos_pos_id5;
DROP INDEX IF EXISTS pos_pos_id6;
CREATE INDEX pos_pos_id1 ON fmk.pos_pos(idpos, idvd, datum, brdok, idroba, idcijena);
CREATE INDEX pos_pos_id2 ON fmk.pos_pos(idodj, idroba, datum);
CREATE INDEX pos_pos_id3 ON fmk.pos_pos(prebacen);
CREATE INDEX pos_pos_id4 ON fmk.pos_pos(datum);
CREATE INDEX pos_pos_id5 ON fmk.pos_pos(idpos, idroba, datum);
CREATE INDEX pos_pos_id6 ON fmk.pos_pos(idroba);
GRANT ALL ON TABLE fmk.pos_pos TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_pos
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

DROP INDEX IF EXISTS semaphores_pos_pos_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_pos(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_pos TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.pos_promvp
(
  datum date,
  polog01 numeric(10, 2),
  polog02 numeric(10, 2),
  polog03 numeric(10, 2),
  polog04 numeric(10, 2),
  polog05 numeric(10, 2),
  polog06 numeric(10, 2),
  polog07 numeric(10, 2),
  polog08 numeric(10, 2),
  polog09 numeric(10, 2),
  polog10 numeric(10, 2),
  polog11 numeric(10, 2),
  polog12 numeric(10, 2),
  ukupno numeric(10, 3)
);

DROP INDEX IF EXISTS pos_promvp_id1;
CREATE INDEX pos_promvp_id1 ON fmk.pos_promvp( datum );
GRANT ALL ON TABLE fmk.pos_promvp TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_promvp
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

DROP INDEX IF EXISTS semaphores_pos_promvp_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_promvp(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_promvp TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.pos_strad
(
  id varchar(2),
  naz varchar(15),
  prioritet character(1)
);

DROP INDEX IF EXISTS pos_strad_id1;
DROP INDEX IF EXISTS pos_strad_id2;
CREATE INDEX pos_strad_id1 ON fmk.pos_strad( id );
CREATE INDEX pos_strad_id2 ON fmk.pos_strad( naz );
GRANT ALL ON TABLE fmk.pos_strad TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_strad
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

DROP INDEX IF EXISTS semaphores_pos_strad_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_strad(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_strad TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.pos_osob
(
  id varchar(4),
  korsif varchar(6),
  naz varchar(40),
  status character(2)
);

DROP INDEX IF EXISTS pos_osob_id1;
DROP INDEX IF EXISTS pos_osob_id2;
CREATE INDEX pos_osob_id1 ON fmk.pos_osob( korsif );
CREATE INDEX pos_osob_id2 ON fmk.pos_osob( id );
GRANT ALL ON TABLE fmk.pos_osob TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_osob
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

DROP INDEX IF EXISTS semaphores_pos_osob_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_osob(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_osob TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.pos_kase
(
  id varchar(2),
  naz varchar(15),
  ppath varchar(50)
);

DROP INDEX IF EXISTS pos_kase_id1;
CREATE INDEX pos_kase_id1 ON fmk.pos_kase( id );
GRANT ALL ON TABLE fmk.pos_kase TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_kase
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

DROP INDEX IF EXISTS semaphores_pos_kase_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_kase(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_kase TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.pos_odj
(
  id varchar(2),
  naz varchar(25),
  zaduzuje character(1),
  idkonto varchar(7)
);

DROP INDEX IF EXISTS pos_odj_id1;
CREATE INDEX pos_odj_id1 ON fmk.pos_odj( id );
GRANT ALL ON TABLE fmk.pos_odj TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_odj
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

DROP INDEX IF EXISTS semaphores_pos_odj_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_odj(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_odj TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 40205);

--- end 4.2.5 verzija

--- start 4.2.6 verzija

SELECT u2.execute($$

ALTER TABLE fmk.pos_pos ADD COLUMN rbr varchar(5);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40206);

--- end 4.2.6 verzija

--- start 4.4.1 verzija

SELECT u2.execute($$


CREATE TABLE IF NOT EXISTS fmk.pos_dokspf
(
  idpos character(2),
  idvd character(2),
  datum date,
  brdok character(6),
  knaz varchar(35),
  kadr varchar(35),
  kidbr character(13),
  datisp date
);

DROP INDEX IF EXISTS pos_dokspf_id1;
CREATE INDEX pos_dokspf_id1 ON fmk.pos_dokspf( idpos, idvd, datum, brdok );
GRANT ALL ON TABLE fmk.pos_dokspf TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pos_dokspf
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

DROP INDEX IF EXISTS semaphores_pos_dokspf_user_code_idx;
CREATE INDEX on fmk.semaphores_pos_dokspf(user_code);
GRANT ALL ON TABLE fmk.semaphores_pos_dokspf TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40401);

--- end 4.4.1 verzija


