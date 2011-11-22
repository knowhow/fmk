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
  brisano character(1)
);

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
  brisano character(1)
);

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
  brisano character(1),
  sifra character(6)
);

GRANT ALL ON TABLE fmk.fin_nalog TO xtrole;


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

CREATE INDEX on fmk.kalk_kalk(datdok);
GRANT ALL ON TABLE fmk.kalk_kalk TO xtrole;

CREATE INDEX on fmk.kalk_doks(datdok);
GRANT ALL ON TABLE fmk.kalk_doks TO xtrole;

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


