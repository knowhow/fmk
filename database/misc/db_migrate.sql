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

CREATE INDEX kalk_kalk_datdok ON fmk.kalk_kalk(datdok);
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

CREATE INDEX kalk_doks_datdok ON fmk.kalk_doks(datdok);
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

CREATE INDEX fakt_doks_datdok ON fmk.fakt_doks(datdok);
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

CREATE INDEX fakt_fakt_datdok ON fmk.fakt_fakt(datdok);
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



CREATE TABLE IF NOT EXISTS fmk.fakt_ftxt
(
  id character(2),
  naz varchar(100)
);
CREATE INDEX fakt_ftxt_id1 ON fmk.fakt_ftxt(id);
GRANT ALL ON TABLE fmk.fakt_ftxt TO xtrole;


-- sifrarnici

CREATE TABLE IF NOT EXISTS fmk.roba
(
  id character(10) PRIMARY KEY,
  sifradob character(20),
  naz character(40),
  jmj character(3),
  idtarifa character(6),
  nc numeric(18,8),
  vpc numeric(18,8),
  mpc numeric(18,8),
  tip character(1),
  carina numeric(5,2),
  opis text,
  vpc2 numeric(18,8),
  mpc2 numeric(18,8),
  mpc3 numeric(18,8),
  k1 character(4),
  k2 character(4),
  n1 numeric(12,2),
  n2 numeric(12,2),
  plc numeric(18,8),
  mink numeric(12,2),
  _m1_ character(1),
  barkod character(13),
  zanivel numeric(18,8),
  zaniv2 numeric(18,8),
  trosk1 numeric(15,5),
  trosk2 numeric(15,5),
  trosk3 numeric(15,5),
  trosk4 numeric(15,5),
  trosk5 numeric(15,5),
  fisc_plu numeric(10,0)
);

CREATE INDEX roba_id ON fmk.roba(id);
CREATE INDEX roba_naz ON fmk.roba(naz);
GRANT ALL ON TABLE fmk.roba TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.partn
(
  id character(6) PRIMARY KEY,
  naz character(250),
  naz2 character(250),
  ptt character(5),
  mjesto character(16),
  adresa character(24),
  ziror character(22),
  rejon character(4),
  telefon character(12),
  dziror character(22),
  fax character(12),
  mobtel character(20),
  idops character(4),
  _kup character(1),
  _dob character(1),
  _banka character(1),
  _radnik character(1),
  idrefer character(10)
);
CREATE INDEX partn_id ON fmk.partn(id);
CREATE INDEX partn_naz ON fmk.partn(naz);
GRANT ALL ON TABLE fmk.partn TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.konto
(
  id character(7) PRIMARY KEY,
  naz character(57),
  pozbilu character(3),
  pozbils character(3)
);
CREATE INDEX konto_id ON fmk.konto(id);
CREATE INDEX konto_naz ON fmk.konto(naz);
GRANT ALL ON TABLE fmk.konto TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.rj
(
  id character(7) PRIMARY KEY,
  naz character(100)
);

CREATE INDEX rj_id ON fmk.rj(id);
CREATE INDEX rj_naz ON fmk.rj(naz);
GRANT ALL ON TABLE fmk.rj TO xtrole;




CREATE TABLE IF NOT EXISTS fmki.ld_rj
(
  id character(2) PRIMARY KEY,
  naz character(100),
  tiprada character(1),
  opor character(1)
);

CREATE INDEX ld_rj_id ON fmk.ld_rj(id);
CREATE INDEX ld_rj_naz ON fmk.ld_rj(naz);
GRANT ALL ON TABLE fmk.ld_rj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.valute
(
  id character(4) PRIMARY KEY,
  naz character(30),
  naz2 character(4),
  datum date,
  kurs1 numeric(18,8),
  kurs2 numeric(18,8),
  kurs3 numeric(18,8),
  tip character(1)
);

CREATE INDEX valute_id ON fmk.valute(id);
CREATE INDEX valute_naz ON fmk.valute(naz);
CREATE INDEX valute_id2 ON fmk.valute(tip, id, datum);
CREATE INDEX valute_id3 ON fmk.valute(id, datum);
GRANT ALL ON TABLE fmk.valute TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.sifk
(
  id character(8),
  sort character(2),
  naz character(25),
  oznaka character(4),
  veza character(1),
  unique character(1),
  izvor character(15),
  uslov character(200),
  duzina numeric(2,0),
  decimal numeric(1,0),
  tip character(1),
  kvalid character(100),
  kwhen character(100),
  ubrowsu character(1),
  edkolona numeric(2,0),
  k1 character(1),
  k2 character(2),
  k3 character(3),
  k4 character(4)
);

CREATE INDEX sifk_id ON fmk.sifk(id, sort, naz);
GRANT ALL ON TABLE fmk.sifk TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.sifv
(
  id character(8),
  idsif character(15),
  naz character(200),
  oznaka character(4)
);

CREATE INDEX sifv_id1 ON fmk.sifv(id, oznaka, idsif, naz);
CREATE INDEX sifv_id2 ON fmk.sifv(id, idsif);
CREATE INDEX sifv_id3 ON fmk.sifv(id, oznaka, naz);
GRANT ALL ON TABLE fmk.sifv TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.tnal
(
  id character(2),
  naz character(30)
);

CREATE INDEX tnal_id1 ON fmk.tnal(id);
CREATE INDEX tnal_id2 ON fmk.tnal(naz);
GRANT ALL ON TABLE fmk.tnal TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.tdok
(
  id character(2),
  naz character(30)
);

CREATE INDEX tdok_id1 ON fmk.tdok(id);
CREATE INDEX tdok_id2 ON fmk.tdok(naz);
GRANT ALL ON TABLE fmk.tdok TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ops
(
  id character(4),
  idj character(3),
  idn0 character(1),
  idkan character(2),
  naz character(20),
  zipcode character(5),
  puccanton character(2),
  puccity character(5),
  region character(1)
);

CREATE INDEX ops_id1 ON fmk.ops(id);
CREATE INDEX ops_id2 ON fmk.ops(naz);
GRANT ALL ON TABLE fmk.ops TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.banke
(
  id character(3),
  naz character(45),
  mjesto character(30),
  adresa character(30)
);

CREATE INDEX banke_id1 ON fmk.banke(id);
GRANT ALL ON TABLE fmk.banke TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.koncij
(
  id character(7),
  shema character(1),
  naz character(2),
  idprodmjes character(2),
  region character(2)
);

CREATE INDEX koncij_id1 ON fmk.koncij(id);
GRANT ALL ON TABLE fmk.koncij TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp
(
  id character(60),
  shema character(1),
  naz character(20),
  idkonto character(7),
  dokument character(1),
  partner character(1),
  d_p character(1),
  znak character(1),
  idvd character(2),
  idvn character(2),
  idtarifa character(6)
);

CREATE INDEX trfp_id1 ON fmk.trfp(id);
GRANT ALL ON TABLE fmk.trfp TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp2
(
  id character(60),
  shema character(1),
  naz character(20),
  idkonto character(7),
  dokument character(1),
  partner character(1),
  d_p character(1),
  znak character(1),
  idvd character(2),
  idvn character(2),
  idtarifa character(6)
);

CREATE INDEX trfp2_id1 ON fmk.trfp2(idvd, shema, idkonto);
GRANT ALL ON TABLE fmk.trfp2 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp3
(
  id character(60),
  shema character(1),
  naz character(20),
  idkonto character(7),
  d_p character(1),
  znak character(1),
  idvn character(2)
);

CREATE INDEX trfp3_id1 ON fmk.trfp3(shema, idkonto);
GRANT ALL ON TABLE fmk.trfp3 TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.sast
(
  id character(10),
  r_br numeric(4,0),
  id2 character(10),
  kolicina numeric(20,5),
  k1 character(1),
  k2 character(1),
  n1 numeric(20,5),
  n2 numeric(20,5)
);

CREATE INDEX sast_id1 ON fmk.sast(id, id2);
GRANT ALL ON TABLE fmk.sast TO xtrole;




$$)
WHERE (u2.knowhow_package_version('fmk') < 600);


------------------------------------------------------
-- semafori 2.0.0
-- create table semaphores
---------------------------------------------------------

SELECT u2.execute($$

-- fin tabele

CREATE SEQUENCE  fmk.sem_ver_fin_suban START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_suban
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fin_suban'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fin_suban(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_suban TO xtrole;


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

-- sifrarnici

CREATE SEQUENCE  fmk.sem_ver_partn START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_partn
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_partn'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_partn(user_code);
GRANT ALL ON TABLE fmk.semaphores_partn TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_konto START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_konto
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_konto'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
	  dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_konto(user_code);
GRANT ALL ON TABLE fmk.semaphores_konto TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 20000);

-- end 2.0.0 version


-- verzija 3.0.1

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

-- end 3.0.1 verzija

-------------------------------------------------------------
-- verzija 3.0.2


SELECT u2.execute($$

-- roba

CREATE SEQUENCE  fmk.sem_ver_roba START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_roba
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_roba'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
	  dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_roba(user_code);
GRANT ALL ON TABLE fmk.semaphores_roba TO xtrole;

-- sem.fakt_fakt

CREATE SEQUENCE  fmk.sem_ver_fakt_fakt START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_fakt
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_fakt'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_fakt(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_fakt TO xtrole;

-- fakt_doks
    
CREATE SEQUENCE  fmk.sem_ver_fakt_doks START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_doks
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_doks'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_doks(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_doks TO xtrole;

CREATE SEQUENCE  fmk.sem_ver_fakt_doks2 START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_doks2
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_doks2'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_doks2(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_doks2 TO xtrole;


-- fakt_ugov / rugov / gen_ug / gen_ug_p

CREATE SEQUENCE  fmk.sem_ver_fakt_ugov START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_ugov
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_ugov'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_ugov(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_ugov TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_fakt_rugov START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_rugov
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_rugov'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_rugov(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_rugov TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_fakt_gen_ug START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_gen_ug
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_gen_ug'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_gen_ug(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_gen_ug TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_fakt_gen_ug_p START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_gen_ug_p
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_gen_ug_p'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_gen_ug_p(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_gen_ug_p TO xtrole;



CREATE SEQUENCE  fmk.sem_ver_fakt_ftxt START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_ftxt
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_fakt_ftxt'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_fakt_ftxt(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_ftxt TO xtrole;

-- sifrarnici

CREATE SEQUENCE  fmk.sem_ver_rj START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rj
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_rj'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_rj(user_code);
GRANT ALL ON TABLE fmk.semaphores_rj TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_ld_rj START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_rj
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_ld_rj'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_ld_rj(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_rj TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_valute START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_valute
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_valute'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_valute(user_code);
GRANT ALL ON TABLE fmk.semaphores_valute TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_ops START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_ops
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_ops'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_ops(user_code);
GRANT ALL ON TABLE fmk.semaphores_ops TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_banke START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_banke
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_bakne'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_banke(user_code);
GRANT ALL ON TABLE fmk.semaphores_banke TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_tnal START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_tnal
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_tnal'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_tnal(user_code);
GRANT ALL ON TABLE fmk.semaphores_tnal TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_tdok START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_dok
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_tdok'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_tdok(user_code);
GRANT ALL ON TABLE fmk.semaphores_tdok TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_sifk START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_sifk
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_sifk'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_sifk(user_code);
GRANT ALL ON TABLE fmk.semaphores_sifk TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_sifv START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_sifv
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_sifv'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_sifv(user_code);
GRANT ALL ON TABLE fmk.semaphores_sifv TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_koncij START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_koncij
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_koncij'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_koncij(user_code);
GRANT ALL ON TABLE fmk.semaphores_koncij TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_sast START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_sast
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_sast'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_sast(user_code);
GRANT ALL ON TABLE fmk.semaphores_sast TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_trfp START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_trfp'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_trfp(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_trfp2 START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp2
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_trfp2'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_trfp2(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp2 TO xtrole;


CREATE SEQUENCE  fmk.sem_ver_trfp3 START 1;

CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp3
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint DEFAULT currval('fmk.sem_ver_trfp3'),
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

CREATE INDEX on fmk.semaphores_trfp3(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp3 TO xtrole;



$$)
WHERE (u2.knowhow_package_version('fmk') < 30002);

-- end 3.0.2 verzija



