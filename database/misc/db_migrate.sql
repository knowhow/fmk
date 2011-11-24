--
-- This file is part of the knowhow ERP, a free and open source
-- Enterprise Resource Planning software suite,
-- Copyright (c) 2010-2011 by bring.out doo Sarajevo.
-- It is licensed to you under the Common Public Attribution License
-- version 1.0, the full text of which (including knowhow-specific Exhibits)
-- is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
-- root directory of this source code archive.
-- By using this software, you agree to be bound by its terms.
--

------------------------------------------------------
-- init
-- create table fin_suban, fin_anal, fin_sint, fin_nalog
---------------------------------------------------------

SELECT u2.execute($$

-- FIN tabele

CREATE TABLE IF NOT EXISTS fmk.fin_suban
(
  idfirma varchar(2),
  idvn varchar(2),
  brnal varchar(10),
  idkonto varchar(10),
  idpartner varchar(6),
  rbr varchar(4),
  idtipdok character(2),
  brdok varchar(20),
  datdok date,
  datval date,
  otvst character(1),
  d_p character(1),
  iznosbhd numeric(17,2),
  iznosdem numeric(15,2),
  opis varchar(500),
  k1 character(1),
  k2 character(1),
  k3 character(2),
  k4 character(2),
  m1 character(1),
  m2 character(1),
  idrj character(6),
  funk character(5),
  fond character(4),
  PRIMARY KEY(idfirma, idvn, brnal, rbr)
);

CREATE INDEX fin_suban_datdok ON fmk.fin_suban(datdok);
CREATE INDEX fin_suban_id1 ON fmk.fin_suban(idfirma, idvn, brnal, rbr);
GRANT ALL ON TABLE fmk.fin_suban TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fin_anal
(
  idfirma character(2),
  idkonto character(7),
  idvn character(2),
  brnal character(8),
  rbr character(3),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  PRIMARY KEY(idfirma, idvn, brnal, rbr)
);

CREATE INDEX fin_anal_id1 ON fmk.fin_anal(idfirma, idvn, brnal, rbr);
GRANT ALL ON TABLE fmk.fin_anal TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fin_sint
(
  idfirma character(2),
  idkonto character(3),
  idvn character(2),
  brnal character(8),
  rbr character(3),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  PRIMARY KEY(idfirma, idvn, brnal, rbr)
);

CREATE INDEX fin_sint_id1 ON fmk.fin_sint(idfirma, idvn, brnal, rbr);
GRANT ALL ON TABLE fmk.fin_sint TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fin_nalog
(
  idfirma character(2),
  idvn character(2),
  brnal character(8),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  sifra character(6),
  PRIMARY KEY(idfirma, idvn, brnal)
);

CREATE INDEX fin_nalog_id1 ON fmk.fin_nalog(idfirma, idvn, brnal);
GRANT ALL ON TABLE fmk.fin_nalog TO xtrole;


-- KALK tabele

CREATE TABLE IF NOT EXISTS fmk.kalk_kalk
(
  idfirma character(2) NOT NULL,
  idroba character(10),
  idkonto character(7),
  idkonto2 character(7),
  idzaduz character(6),
  idzaduz2 character(6),
  idvd character(2) NOT NULL,
  brdok character(8) NOT NULL,
  datdok date,
  brfaktp character(10),
  datfaktp date,
  idpartner character(6),
  datkurs date,
  rbr character(3) NOT NULL,
  kolicina numeric(12,3),
  gkolicina numeric(12,3),
  gkolicin2 numeric(12,3),
  fcj numeric(18,8),
  fcj2 numeric(18,8),
  fcj3 numeric(18,8),
  trabat character(1),
  rabat numeric(18,8),
  tprevoz character(1),
  prevoz numeric(18,8),
  tprevoz2 character(1),
  prevoz2 numeric(18,8),
  tbanktr character(1),
  banktr numeric(18,8),
  tspedtr character(1),
  spedtr numeric(18,8),
  tcardaz character(1),
  cardaz numeric(18,8),
  tzavtr character(1),
  zavtr numeric(18,8),
  nc numeric(18,8),
  tmarza character(1),
  marza numeric(18,8),
  vpc numeric(18,8),
  rabatv numeric(18,8),
  vpcsap numeric(18,8),
  tmarza2 character(1),
  marza2 numeric(18,8),
  mpc numeric(18,8),
  idtarifa character(6),
  mpcsapp numeric(18,8),
  mkonto character(7),
  pkonto character(7),
  roktr date,
  mu_i character(1),
  pu_i character(1),
  error character(1),
  podbr character(2),
  CONSTRAINT kalk_kalk_pkey PRIMARY KEY (idfirma , idvd , brdok , rbr )
);

CREATE INDEX kalk_kalk_id1 ON fmk.kalk_kalk(idfirma, idvd, brdok, rbr, mkonto, pkonto);
GRANT ALL ON TABLE fmk.kalk_kalk TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.kalk_doks
(
  idfirma character(2) NOT NULL,
  idvd character(2) NOT NULL,
  brdok character(8) NOT NULL,
  datdok date,
  brfaktp character(10),
  idpartner character(6),
  idzaduz character(6),
  idzaduz2 character(6),
  pkonto character(7),
  mkonto character(7),
  nv numeric(12,2),
  vpv numeric(12,2),
  rabat numeric(12,2),
  mpv numeric(12,2),
  podbr character(2),
  sifra character(6),
  CONSTRAINT kalk_doks_pkey PRIMARY KEY (idfirma , idvd , brdok )
);

CREATE INDEX kalk_doks_id1 ON fmk.kalk_doks(idfirma, idvd, brdok, mkonto, pkonto );
GRANT ALL ON TABLE fmk.kalk_doks TO xtrole;

-- FAKT tabele

CREATE TABLE IF NOT EXISTS fmk.fakt_doks
(
  idfirma character(2),
  idtipdok character(2),
  brdok character(8),
  partner character(30),
  datdok date,
  dindem character(3),
  iznos numeric(12,3),
  rabat numeric(12,3),
  rezerv character(1),
  m1 character(1),
  idpartner character(6),
  sifra character(6),
  brisano character(1),
  idvrstep character(2),
  datpl date,
  idpm character(15),
  dok_veza character(150),
  oper_id numeric(3,0),
  fisc_rn numeric(10,0),
  dat_isp date,
  dat_otpr date,
  dat_val date,
  CONSTRAINT fakt_doks_pkey PRIMARY KEY (idfirma , idtipdok , brdok )
);

CREATE INDEX fakt_doks_id1 ON fmk.fakt_doks(idfirma, idtipdok, brdok, datdok, idpartner );
GRANT ALL ON TABLE fmk.fakt_doks TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.fakt_doks2
(
  idfirma character(2),
  idtipdok character(2),
  brdok character(8),
  k1 character(15),
  k2 character(15),
  k3 character(15),
  k4 character(20),
  k5 character(20),
  n1 numeric(15,2),
  n2 numeric(15,2)
);

CREATE INDEX fakt_doks2_id1 ON fmk.fakt_doks2(idfirma, idtipdok, brdok);
GRANT ALL ON TABLE fmk.fakt_doks2 TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fakt_fakt
(
  idfirma character(2),
  idtipdok character(2),
  brdok character(8),
  datdok date,
  idpartner character(6),
  dindem character(3),
  zaokr numeric(1,0),
  rbr character(3),
  podbr character(2),
  idroba character(10),
  serbr character(15),
  kolicina numeric(14,5),
  cijena numeric(14,5),
  rabat numeric(8,5),
  porez numeric(9,5),
  txt text,
  k1 character(4),
  k2 character(4),
  m1 character(1),
  brisano character(1),
  idroba_j character(10),
  idvrstep character(2),
  idpm character(15),
  c1 character(20),
  c2 character(20),
  c3 character(20),
  n1 numeric(10,3),
  n2 numeric(10,3),
  opis character(120),
  dok_veza character(150),
  CONSTRAINT fakt_fakt_pkey PRIMARY KEY (idfirma , idtipdok , brdok, rbr )
);

CREATE INDEX fakt_fakt_id1 ON fmk.fakt_fakt(idfirma, idtipdok, brdok, rbr, idpartner );
GRANT ALL ON TABLE fmk.fakt_fakt TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fakt_gen_ug
(
  dat_obr date,
  dat_gen date,
  dat_u_fin date,
  kto_kup character(7),
  kto_dob character(7),
  opis character(100),
  brdok_od character(8),
  brdok_do character(8),
  fakt_br numeric(5,0),
  saldo numeric(15,5),
  saldo_pdv numeric(15,5),
  brisano character(1),
  dat_val date
);

CREATE INDEX fakt_gen_ug_id1 ON fmk.fakt_gen_ug(dat_obr, dat_gen);
GRANT ALL ON TABLE fmk.fakt_gen_ug TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fakt_gen_ug_p
(
  dat_obr date,
  idpartner character(6),
  id_ugov character(10),
  saldo_kup numeric(15,5),
  saldo_dob numeric(15,5),
  d_p_upl_ku date,
  d_p_prom_k date,
  d_p_prom_d date,
  f_iznos numeric(15,5),
  f_iznos_pd numeric(15,5)
);

CREATE INDEX fakt_gen_ug_p_id1 ON fmk.fakt_gen_ug_p(dat_obr, idpartner, id_ugov);
GRANT ALL ON TABLE fmk.fakt_gen_ug_p TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.fakt_rugov
(
  id character(10),
  idroba character(10),
  kolicina numeric(15,4),
  rabat numeric(6,3),
  porez numeric(5,2)
);

CREATE INDEX fakt_rugov_id1 ON fmk.fakt_rugov(id, idroba);
GRANT ALL ON TABLE fmk.fakt_rugov TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fakt_ugov
(
  id character(10),
  datod date,
  idpartner character(6),
  datdo date,
  vrsta character(1),
  idtipdok character(2),
  naz character(20),
  aktivan character(1),
  dindem character(3),
  idtxt character(2),
  zaokr numeric(1,0),
  lab_prn character(1),
  iddodtxt character(2),
  a1 numeric(12,2),
  a2 numeric(12,2),
  b1 numeric(12,2),
  b2 numeric(12,2),
  txt2 character(2),
  txt3 character(2),
  txt4 character(2),
  f_nivo character(1),
  f_p_d_nivo numeric(5,0),
  dat_l_fakt date,
  def_dest character(6),
  CONSTRAINT fakt_ugov_pkey PRIMARY KEY (id)
);

CREATE INDEX fakt_ugov_id1 ON fmk.fakt_ugov(id, idpartner);
GRANT ALL ON TABLE fmk.fakt_ugov TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 600);


------------------------------------------------------
-- semafori 2.0.0
-- create table semaphores
---------------------------------------------------------

SELECT u2.execute($$

-- DROP SEQUENCE IF EXISTS fmk.sem_ver_fin_suban CASCADE;
CREATE SEQUENCE  fmk.sem_ver_fin_suban START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_suban
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fin_suban'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20)
);

CREATE INDEX on fmk.semaphores_fin_suban(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_suban TO xtrole;

-- DROP SEQUENCE IF EXISTS fmk.sem_ver_partn CASCADE;
CREATE SEQUENCE  fmk.sem_ver_partn START 1;
-- SELECT setval('fmk.sem_ver_partn', 1);

CREATE TABLE IF NOT EXISTS fmk.semaphores_partn
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_partn'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20)
);

CREATE INDEX on fmk.semaphores_partn(user_code);
GRANT ALL ON TABLE fmk.semaphores_partn TO xtrole;


-- DROP SEQUENCE IF EXISTS fmk.sem_ver_konto CASCADE;
CREATE SEQUENCE  fmk.sem_ver_konto START 1;
-- SELECT setval('fmk.sem_ver_konto', 1);

CREATE TABLE IF NOT EXISTS fmk.semaphores_konto
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_konto'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20)
);

CREATE INDEX on fmk.semaphores_konto(user_code);
GRANT ALL ON TABLE fmk.semaphores_konto TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 20000);

SELECT u2.execute($$

SELECT setval('fmk.sem_ver_fin_suban', 1);
SELECT setval('fmk.sem_ver_partn', 1);
SELECT setval('fmk.sem_ver_konto', 1);

$$)
WHERE (u2.knowhow_package_version('fmk') < 20000);

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.partn
(
  id varchar(10)  PRIMARY KEY,
  naz  varchar(250)
);

GRANT ALL ON TABLE fmk.partn TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 20100);

-- 3.0.0
-- ids text[], dat date

SELECT u2.execute($$

ALTER TABLE fmk.semaphores_partn ADD COLUMN ids text[];
ALTER TABLE fmk.semaphores_partn ADD COLUMN dat date;

ALTER TABLE fmk.semaphores_konto ADD COLUMN ids text[];
ALTER TABLE fmk.semaphores_konto ADD COLUMN dat date;

ALTER TABLE fmk.semaphores_fin_suban ADD COLUMN ids text[];
ALTER TABLE fmk.semaphores_fin_suban ADD COLUMN dat date;



$$)
WHERE (u2.knowhow_package_version('fmk') < 30000);

-- fin_anal

SELECT u2.execute($$

CREATE SEQUENCE  fmk.sem_ver_fin_anal START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_anal
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fin_anal'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fin_anal(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_anal TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30000);

-- fin_sint

SELECT u2.execute($$

CREATE SEQUENCE  fmk.sem_ver_fin_sint START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_sint
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fin_sint'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fin_sint(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_sint TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30000);

-- fin_nalog

SELECT u2.execute($$

    
CREATE SEQUENCE  fmk.sem_ver_fin_nalog START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_nalog
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fin_nalog'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fin_nalog(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_nalog TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30000);


-- setuje inicijalne vrijednosti

SELECT u2.execute($$

SELECT setval('fmk.sem_ver_fin_anal', 1);
SELECT setval('fmk.sem_ver_fin_sint', 1);
SELECT setval('fmk.sem_ver_fin_nalog', 1);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30000);

-- end 3.0.0 verzija

-- verzija 3.0.1

-- indeksi i grantovi
SELECT u2.execute($$

GRANT ALL ON TABLE fmk.kalk_kalk TO xtrole;
CREATE INDEX on fmk.kalk_kalk(datdok);

GRANT ALL ON TABLE fmk.kalk_doks TO xtrole;
CREATE INDEX on fmk.kalk_doks(datdok);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);


-- sem.kalk_kalk

SELECT u2.execute($$

CREATE SEQUENCE  fmk.sem_ver_kalk_kalk START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_kalk_kalk
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_kalk_kalk'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_kalk_kalk(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalk_kalk TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);

-- kalk_doks

SELECT u2.execute($$
    
CREATE SEQUENCE  fmk.sem_ver_kalk_doks START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_kalk_doks
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_kalk_doks'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_kalk_doks(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalk_doks TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);


-- setuje inicijalne vrijednosti

SELECT u2.execute($$

SELECT setval('fmk.sem_ver_kalk_kalk', 1);
SELECT setval('fmk.sem_ver_kalk_doks', 1);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);

-- end 3.0.1 verzija


