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


-- ver 4.6.5

SELECT u2.execute($$

-- kadev tabele

CREATE TABLE IF NOT EXISTS fmk.kadev_0
(
  id character(13),
  id2 character(11),
  prezime character(30),
  imerod character(20),
  ime character(20),
  pol character(1),
  idnac character(2),
  datrodj date,
  mjrodj character(30),
  idstrspr character(3),
  idzanim character(4),
  idrj character(6),
  idrmj character(4),
  daturmj date,
  datuf date,
  datvrmj date,
  radste numeric(12,2),
  radstb numeric(12,2),
  brlk character(12),
  mjst character(30),
  ulst character(30),
  idmzst character(4),
  brtel1 character(15),
  brtel2 character(15),
  brtel3 character(15),
  status character(1),
  bracst character(1),
  brdjece numeric(2,0),
  krv character(3),
  stan character(1),
  idk1 character(2),
  idk2 character(4),
  kop1 character(30),
  kop2 character(30),
  idrrasp character(4),
  slvr character(1),
  vrslvr numeric(12,2),
  sposvsl character(1),
  idves character(7),
  idcin character(2),
  nazsekr character(100),
  operater character(50),
  k_date date,
  k_time character(8),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_0_id1;
CREATE INDEX kadev_0_id1 ON fmk.kadev_0( id );
GRANT ALL ON TABLE fmk.kadev_0 TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_0
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

DROP INDEX IF EXISTS semaphores_kadev_0_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_0(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_0 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.kadev_1
(
  id character(13),
  datumod date,
  datumdo date,
  idpromj character(2),
  idk character(4),
  dokument character(15),
  opis character(50),
  nadlezan character(50),
  idrj character(6),
  idrmj character(4),
  natr1 numeric(12,2),
  natr2 numeric(12,2),
  natr3 numeric( 2,0),
  natr4 numeric( 2,0),
  natr5 numeric( 2,0),
  natr6 numeric( 2,0),
  natr7 numeric( 2,0),
  natr8 numeric( 2,0),
  natr9 numeric( 2,0),
  catr1 character(10),
  catr2 character(10),
  PRIMARY KEY( id, datumod )
);

DROP INDEX IF EXISTS kadev_1_id1;
CREATE INDEX kadev_1_id1 ON fmk.kadev_1( id, datumod );
GRANT ALL ON TABLE fmk.kadev_1 TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_1
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

DROP INDEX IF EXISTS semaphores_kadev_1_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_1(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_1 TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_promj
(
  id character(2),
  naz character(50),
  naz2 character(50),
  tip character(1),
  status character(1),
  uradst character(1),
  srmj character(1),
  urrasp character(1),
  ustrspr character(1),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_promj_id1;
CREATE INDEX kadev_promj_id1 ON fmk.kadev_promj( id );
GRANT ALL ON TABLE fmk.kadev_promj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_promj
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

DROP INDEX IF EXISTS semaphores_kadev_promj_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_promj(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_promj TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_mz
(
  id character(4),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_mz_id1;
CREATE INDEX kadev_mz_id1 ON fmk.kadev_mz( id );
GRANT ALL ON TABLE fmk.kadev_mz TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_mz
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

DROP INDEX IF EXISTS semaphores_kadev_mz_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_mz(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_mz TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_nerdan
(
  id character(4),
  naz character(20),
  datum date,
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_nerdan_id1;
CREATE INDEX kadev_nerdan_id1 ON fmk.kadev_nerdan( id );
GRANT ALL ON TABLE fmk.kadev_nerdan TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_nerdan
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

DROP INDEX IF EXISTS semaphores_kadev_nerdan_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_nerdan(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_nerdan TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_rmj
(
  id character(4),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_rmj_id1;
CREATE INDEX kadev_rmj_id1 ON fmk.kadev_rmj( id );
GRANT ALL ON TABLE fmk.kadev_rmj TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_rmj
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

DROP INDEX IF EXISTS semaphores_kadev_rmj_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_rmj(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_rmj TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_rj
(
  id character(6),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_rj_id1;
CREATE INDEX kadev_rj_id1 ON fmk.kadev_rj( id );
GRANT ALL ON TABLE fmk.kadev_rj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_rj
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

DROP INDEX IF EXISTS semaphores_kadev_rj_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_rj(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_rj TO xtrole;







CREATE TABLE IF NOT EXISTS fmk.kadev_rjrmj
(
  idrj character(6),
  idrmj character(4),
  brizvrs numeric(2,0),
  idstrsprod character(3),
  idstrsprdo character(3),
  idzanim1 character(4),
  idzanim2 character(4),
  idzanim3 character(4),
  idzanim4 character(4),
  bodova numeric(10,2),
  sbenefrst character(1),
  idk1 character(1),
  idk2 character(1),
  idk3 character(1),
  idk4 character(1),
  opis character(50),
  PRIMARY KEY( idrj, idrmj )
);

DROP INDEX IF EXISTS kadev_rjrmj_id1;
CREATE INDEX kadev_rjrmj_id1 ON fmk.kadev_rjrmj( idrj, idrmj );
GRANT ALL ON TABLE fmk.kadev_rjrmj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_rjrmj
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

DROP INDEX IF EXISTS semaphores_kadev_rjrmj_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_rjrmj(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_rjrmj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.kadev_k1
(
  id character(2),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_k1_id1;
CREATE INDEX kadev_k1_id1 ON fmk.kadev_k1( id );
GRANT ALL ON TABLE fmk.kadev_k1 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_k1
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

DROP INDEX IF EXISTS semaphores_kadev_k1_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_k1(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_k1 TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.kadev_k2
(
  id character(2),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_k2_id1;
CREATE INDEX kadev_k2_id1 ON fmk.kadev_k2( id );
GRANT ALL ON TABLE fmk.kadev_k2 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_k2
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

DROP INDEX IF EXISTS semaphores_kadev_k2_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_k2(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_k2 TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_zanim
(
  id character(4),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_zanim_id1;
CREATE INDEX kadev_zanim_id1 ON fmk.kadev_zanim( id );
GRANT ALL ON TABLE fmk.kadev_zanim TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_zanim
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

DROP INDEX IF EXISTS semaphores_kadev_zanim_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_zanim(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_zanim TO xtrole;






CREATE TABLE IF NOT EXISTS fmk.kadev_rrasp
(
  id character(4),
  naz character(50),
  naz2 character(50),
  catr character(1),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_rrasp_id1;
CREATE INDEX kadev_rrasp_id1 ON fmk.kadev_rrasp( id );
GRANT ALL ON TABLE fmk.kadev_rrasp TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_rrasp
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

DROP INDEX IF EXISTS semaphores_kadev_rrasp_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_rrasp(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_rrasp TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.kadev_ves
(
  id character(7),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_ves_id1;
CREATE INDEX kadev_ves_id1 ON fmk.kadev_ves( id );
GRANT ALL ON TABLE fmk.kadev_ves TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_ves
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

DROP INDEX IF EXISTS semaphores_kadev_ves_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_ves(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_ves TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.kadev_cin
(
  id character(2),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_cin_id1;
CREATE INDEX kadev_cin_id1 ON fmk.kadev_cin( id );
GRANT ALL ON TABLE fmk.kadev_cin TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_cin
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

DROP INDEX IF EXISTS semaphores_kadev_cin_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_cin(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_cin TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.kadev_nac
(
  id character(7),
  naz character(50),
  naz2 character(50),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_nac_id1;
CREATE INDEX kadev_nac_id1 ON fmk.kadev_nac( id );
GRANT ALL ON TABLE fmk.kadev_nac TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_nac
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

DROP INDEX IF EXISTS semaphores_kadev_nac_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_nac(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_nac TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.kadev_obrazdef
(
  tip character(1),
  grupa character(1),
  red_br character(1),
  id_uslova character(8),
  komentar character(50),
  uslov varchar,
  PRIMARY KEY( tip, grupa, red_br )
);

DROP INDEX IF EXISTS kadev_obrazdef_id1;
CREATE INDEX kadev_obrazdef_id1 ON fmk.kadev_obrazdef( tip, grupa, red_br );
GRANT ALL ON TABLE fmk.kadev_obrazdef TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_obrazdef
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

DROP INDEX IF EXISTS semaphores_kadev_obrazdef_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_obrazdef(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_obrazdef TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.kadev_globusl
(
  komentar character(50),
  uslov varchar,
  ime_baze character(20),
  PRIMARY KEY( komentar )
);

DROP INDEX IF EXISTS kadev_globusl_id1;
CREATE INDEX kadev_globusl_id1 ON fmk.kadev_globusl( komentar );
GRANT ALL ON TABLE fmk.kadev_globusl TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_globusl
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

DROP INDEX IF EXISTS semaphores_kadev_globusl_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_globusl(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_globusl TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.kadev_uslovi
(
  id character(8),
  naz character(50),
  uslov varchar,
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_uslovi_id1;
CREATE INDEX kadev_uslovi_id1 ON fmk.kadev_uslovi( id );
GRANT ALL ON TABLE fmk.kadev_uslovi TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_uslovi
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

DROP INDEX IF EXISTS semaphores_kadev_uslovi_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_uslovi(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_uslovi TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.kadev_rjes
(
  id character(2),
  naz character(50),
  fajl character(20),
  zadbrdok character(20),
  idpromj character(2),
  PRIMARY KEY( id )
);

DROP INDEX IF EXISTS kadev_rjes_id1;
CREATE INDEX kadev_rjes_id1 ON fmk.kadev_rjes( id );
GRANT ALL ON TABLE fmk.kadev_rjes TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_rjes
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

DROP INDEX IF EXISTS semaphores_kadev_rjes_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_rjes(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_rjes TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.kadev_defrjes
(
  id character(2),
  idrjes character(2),
  izraz varchar,
  obrada character(1),
  upit character(20),
  uvalid character(100),
  upict character(20),
  iizraz character(200),
  tipslova character(5),
  ppromj character(10),
  ipromj character(1),
  priun character(1),
  PRIMARY KEY( idrjes, id )
);

DROP INDEX IF EXISTS kadev_defrjes_id1;
CREATE INDEX kadev_defrjes_id1 ON fmk.kadev_defrjes( idrjes, id );
GRANT ALL ON TABLE fmk.kadev_defrjes TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kadev_defrjes
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

DROP INDEX IF EXISTS semaphores_kadev_defrjes_user_code_idx;
CREATE INDEX on fmk.semaphores_kadev_defrjes(user_code);
GRANT ALL ON TABLE fmk.semaphores_kadev_defrjes TO xtrole;



$$)
WHERE (u2.knowhow_package_version('fmk') < 40605);



