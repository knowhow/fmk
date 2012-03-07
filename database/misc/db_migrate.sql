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

DROP INDEX IF EXISTS fin_suban_datdok;
DROP INDEX IF EXISTS fin_suban_id1;
CREATE INDEX fin_suban_datdok ON fmk.fin_suban(datdok);
CREATE INDEX fin_suban_id1 ON fmk.fin_suban(idfirma, idvn, brnal, rbr);
GRANT ALL ON TABLE fmk.fin_suban TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fin_anal
(
  idfirma character(2),
  idkonto character(7),
  idvn character(2),
  brnal character(8),
  rbr varchar(4),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  PRIMARY KEY(idfirma, idvn, brnal, rbr)
);

DROP INDEX IF EXISTS fin_anal_id1;
CREATE INDEX fin_anal_id1 ON fmk.fin_anal(idfirma, idvn, brnal, rbr);
GRANT ALL ON TABLE fmk.fin_anal TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.fin_sint
(
  idfirma character(2),
  idkonto character(3),
  idvn character(2),
  brnal character(8),
  rbr varchar(4),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  PRIMARY KEY(idfirma, idvn, brnal, rbr)
);

DROP INDEX IF EXISTS fin_sint_id1;
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

DROP INDEX IF EXISTS fin_nalog_id1;
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

DROP INDEX IF EXISTS kalk_kalk_datdok;
DROP INDEX IF EXISTS kalk_kalk_id1;
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

DROP INDEX IF EXISTS kalk_doks_datdok;
DROP INDEX IF EXISTS kalk_doks_id1;
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

DROP INDEX IF EXISTS fakt_doks_datdok;
DROP INDEX IF EXISTS fakt_doks_id1;
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

DROP INDEX IF EXISTS fakt_doks2_id1;
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

DROP INDEX IF EXISTS fakt_fakt_datdok;
DROP INDEX IF EXISTS fakt_fakt_id1;
CREATE INDEX fakt_fakt_datdok ON fmk.fakt_fakt(datdok);
CREATE INDEX fakt_fakt_id1 ON fmk.fakt_fakt(idfirma, idtipdok, brdok, rbr, idpartner );
GRANT ALL ON TABLE fmk.fakt_fakt TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.fakt_upl
(
  datupl date,
  idpartner character(6),
  opis character(100),
  iznos numeric(12,2)
);

DROP INDEX IF EXISTS fakt_upl_date;
CREATE INDEX fakt_upl_date ON fmk.fakt_upl(idpartner, datupl);
GRANT ALL ON TABLE fmk.fakt_upl TO xtrole;


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

DROP INDEX IF EXISTS fakt_gen_ug_id1;
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

DROP INDEX IF EXISTS fakt_gen_ug_p_id1;
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

DROP INDEX IF EXISTS fakt_rugov_id1;
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

DROP INDEX IF EXISTS fakt_ugov_id1;
CREATE INDEX fakt_ugov_id1 ON fmk.fakt_ugov(id, idpartner);
GRANT ALL ON TABLE fmk.fakt_ugov TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.fakt_ftxt
(
  id character(2),
  match_code character(10),
  naz varchar(250)
);

DROP INDEX IF EXISTS fakt_ftxt_id1;
CREATE INDEX fakt_ftxt_id1 ON fmk.fakt_ftxt(id);
GRANT ALL ON TABLE fmk.fakt_ftxt TO xtrole;

-- ld tabele

CREATE TABLE IF NOT EXISTS fmk.ld_pk_data
(
  idradn character(6),
  ident character(1),
  rbr numeric(2,0),
  ime_pr character(50),
  jmb character(13),
  sr_naz character(30),
  sr_kod numeric(2,0),
  prihod numeric(10,2),
  udio numeric(3,0),
  koef numeric(10,3)
);

DROP INDEX IF EXISTS ld_pk_data_id1;
CREATE INDEX ld_pk_data_id1 ON fmk.ld_pk_data(idradn);
GRANT ALL ON TABLE fmk.ld_pk_data TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_pk_radn
(
  idradn character(6),
  zahtjev numeric(4,0),
  datum date,
  r_prez character(20),
  r_ime character(20),
  r_imeoca character(20),
  r_jmb character(13),
  r_adr character(30),
  r_opc character(30),
  r_opckod character(10),
  r_drodj date,
  r_tel numeric(12,0),
  p_naziv character(100),
  p_jib character(13),
  p_zap character(1),
  lo_osn numeric(10,3),
  lo_brdr numeric(10,3),
  lo_izdj numeric(10,3),
  lo_clp numeric(10,3),
  lo_clpi numeric(10,3),
  lo_ufakt numeric(10,3)
);

DROP INDEX IF EXISTS ld_pk_radn_id1;
CREATE INDEX ld_pk_radn_id1 ON fmk.ld_pk_radn(idradn);
GRANT ALL ON TABLE fmk.ld_pk_radn TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_radkr
(
  idradn character(6),
  mjesec numeric(2,0),
  godina numeric(4,0),
  idkred character(6),
  naosnovu character(20),
  iznos numeric(12,2),
  placeno numeric(12,2)
);

DROP INDEX IF EXISTS ld_radkr_id1;
CREATE INDEX ld_radkr_id1 ON fmk.ld_radkr(idradn, idkred, mjesec, godina);
GRANT ALL ON TABLE fmk.ld_radkr TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.ld_radsat
(
  idradn character(6),
  sati numeric(10,0),
  status character(2)
);

DROP INDEX IF EXISTS ld_radsat_id1;
CREATE INDEX ld_radsat_id1 ON fmk.ld_radsat(idradn);
GRANT ALL ON TABLE fmk.ld_radsat TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_norsiht
(
  id character(4),
  naz character(30),
  jmj character(3),
  iznos numeric(8,2),
  n1 numeric(6,2),
  k1 character(1),
  k2 character(2)
);

DROP INDEX IF EXISTS ld_norsiht_id1;
CREATE INDEX ld_norsiht_id1 ON fmk.ld_norsiht(id);
GRANT ALL ON TABLE fmk.ld_norsiht TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_obracuni
(
  rj character(2),
  godina numeric(4,0),
  mjesec numeric(2,0),
  status character(1),
  dat_ispl date,
  obr character(1),
  mj_ispl numeric(2,0),
  ispl_za character(50),
  vr_ispl character(50)
);

DROP INDEX IF EXISTS ld_obracuni_id1;
CREATE INDEX ld_obracuni_id1 ON fmk.ld_obracuni(rj, godina, mjesec, obr, dat_ispl);
GRANT ALL ON TABLE fmk.ld_obracuni TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_ld
(
  godina numeric(4,0) NOT NULL,
  idrj character(2),
  idradn character(6) NOT NULL,
  mjesec numeric(2,0) NOT NULL,
  brbod numeric(11,2),
  idstrspr character(3),
  idvposla character(2),
  kminrad numeric(5,2),
  s01 numeric(5,1),
  i01 numeric(12,2),
  s02 numeric(5,1),
  i02 numeric(12,2),
  s03 numeric(5,1),
  i03 numeric(12,2),
  s04 numeric(5,1),
  i04 numeric(12,2),
  s05 numeric(5,1),
  i05 numeric(12,2),
  s06 numeric(5,1),
  i06 numeric(12,2),
  s07 numeric(5,1),
  i07 numeric(12,2),
  s08 numeric(5,1),
  i08 numeric(12,2),
  s09 numeric(5,1),
  i09 numeric(12,2),
  s10 numeric(5,1),
  i10 numeric(12,2),
  s11 numeric(5,1),
  i11 numeric(12,2),
  s12 numeric(5,1),
  i12 numeric(12,2),
  s13 numeric(5,1),
  i13 numeric(12,2),
  s14 numeric(5,1),
  i14 numeric(12,2),
  s15 numeric(5,1),
  i15 numeric(12,2),
  s16 numeric(5,1),
  i16 numeric(12,2),
  s17 numeric(5,1),
  i17 numeric(12,2),
  s18 numeric(5,1),
  i18 numeric(12,2),
  s19 numeric(5,1),
  i19 numeric(12,2),
  s20 numeric(5,1),
  i20 numeric(12,2),
  s21 numeric(5,1),
  i21 numeric(12,2),
  s22 numeric(5,1),
  i22 numeric(12,2),
  s23 numeric(5,1),
  i23 numeric(12,2),
  s24 numeric(5,1),
  i24 numeric(12,2),
  s25 numeric(5,1),
  i25 numeric(12,2),
  s26 numeric(5,1),
  i26 numeric(12,2),
  s27 numeric(5,1),
  i27 numeric(12,2),
  s28 numeric(5,1),
  i28 numeric(12,2),
  s29 numeric(5,1),
  i29 numeric(12,2),
  s30 numeric(5,1),
  i30 numeric(12,2),
  usati numeric(8,1),
  uneto numeric(13,2),
  uodbici numeric(13,2),
  uiznos numeric(13,2),
  varobr character(1),
  ubruto numeric(13,2),
  uneto2 numeric(13,2),
  ulicodb numeric(13,2),
  trosk character(1),
  opor character(1),
  tiprada character(1),
  nakn_opor numeric(13,2),
  nakn_neop numeric(13,2),
  udopr numeric(13,2),
  udop_st numeric(10,2),
  uporez numeric(13,3),
  upor_st numeric(10,3),
  obr character(1) NOT NULL DEFAULT ' ',
  v_ispl character(2),
  CONSTRAINT ld_ld_pkey PRIMARY KEY (idrj , godina , mjesec , obr, idradn )
);

DROP INDEX IF EXISTS ld_ld_id1;
CREATE INDEX ld_ld_id1 ON fmk.ld_ld(idrj, godina, mjesec, obr, idradn );
GRANT ALL ON TABLE fmk.ld_ld TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_radn
(
  id character(6) PRIMARY KEY,
  match_code character(10),
  naz character(20),
  imerod character(15),
  ime character(15),
  brbod numeric(11,2),
  kminrad numeric(7,2),
  idstrspr character(3),
  idvposla character(2),
  idopsst character(4),
  idopsrad character(4),
  pol character(1),
  matbr character(13),
  datod date,
  k1 character(1),
  k2 character(1),
  k3 character(2),
  k4 character(2),
  rmjesto character(30),
  brknjiz character(12),
  brtekr character(20),
  isplata character(2),
  idbanka character(6),
  porol numeric(5,2),
  n1 numeric(12,2),
  n2 numeric(12,2),
  n3 numeric(12,2),
  osnbol numeric(11,4),
  idrj character(2),
  streetname character(40),
  streetnum character(6),
  hiredfrom date,
  hiredto date,
  klo numeric(5,2),
  tiprada character(1),
  sp_koef numeric(5,2),
  opor character(1),
  trosk character(1),
  aktivan character(1),
  ben_srmj character(20),
  s1 character(10),
  s2 character(10),
  s3 character(10),
  s4 character(10),
  s5 character(10),
  s6 character(10),
  s7 character(10),
  s8 character(10),
  s9 character(10)
);

DROP INDEX IF EXISTS ld_radn_id1;
CREATE INDEX ld_radn_id1 ON fmk.ld_radn(id);
GRANT ALL ON TABLE fmk.ld_radn TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.dopr
(
  id character(2),
  match_code character(10),
  naz character(20),
  iznos numeric(5,2),
  idkbenef character(1),
  dlimit numeric(12,2),
  poopst character(1),
  dop_tip character(1),
  tiprada character(1)
);

DROP INDEX IF EXISTS dopr_id1;
CREATE INDEX dopr_id1 ON fmk.dopr(id, tiprada);
GRANT ALL ON TABLE fmk.dopr TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.por
(
  id character(2),
  match_code character(10),
  naz character(20),
  iznos numeric(5,2),
  dlimit numeric(12,2),
  poopst character(1),
  algoritam character(1),
  por_tip character(1),
  s_sto_1 numeric(5,2),
  s_izn_1 numeric(12,2),
  s_sto_2 numeric(5,2),
  s_izn_2 numeric(12,2),
  s_sto_3 numeric(5,2),
  s_izn_3 numeric(12,2),
  s_sto_4 numeric(5,2),
  s_izn_4 numeric(12,2),
  s_sto_5 numeric(5,2),
  s_izn_5 numeric(12,2)
);

DROP INDEX IF EXISTS por_id1;
CREATE INDEX por_id1 ON fmk.por(id);
GRANT ALL ON TABLE fmk.por TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.kbenef
(
  id character(1),
  match_code character(10),
  naz character(8),
  iznos numeric(5,2)
);

DROP INDEX IF EXISTS kbenef_id1;
CREATE INDEX kbenef_id1 ON fmk.kbenef(id);
GRANT ALL ON TABLE fmk.kbenef TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.kred
(
  id character(6) PRIMARY KEY,
  match_code character(10),
  naz character(30),
  ziro character(20),
  zirod character(20),
  telefon character(20),
  adresa character(30),
  ptt character(5),
  fil character(30),
  mjesto character(20)
);

DROP INDEX IF EXISTS kred_id1;
CREATE INDEX kred_id1 ON fmk.kred(id);
GRANT ALL ON TABLE fmk.kred TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.tippr
(
  id character(2) PRIMARY KEY,
  match_code character(10),
  naz character(20),
  aktivan character(1),
  fiksan character(1),
  ufs character(1),
  koef1 numeric(5,2),
  formula character(200),
  uneto character(1),
  opis character(8),
  tpr_tip character(1)
);

DROP INDEX IF EXISTS tippr_id1;
CREATE INDEX tippr_id1 ON fmk.tippr(id);
GRANT ALL ON TABLE fmk.tippr TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.tippr2
(
  id character(2) PRIMARY KEY,
  match_code character(10),
  naz character(20),
  aktivan character(1),
  fiksan character(1),
  ufs character(1),
  koef1 numeric(5,2),
  formula character(200),
  uneto character(1),
  opis character(8),
  tpr_tip character(1)
);

DROP INDEX IF EXISTS tippr2_id1;
CREATE INDEX tippr2_id1 ON fmk.tippr2(id);
GRANT ALL ON TABLE fmk.tippr2 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.vposla
(
  id character(2) PRIMARY KEY,
  match_code character(10),
  naz character(20),
  idkbenef character(1)
);

DROP INDEX IF EXISTS vposla_id1;
CREATE INDEX vposla_id1 ON fmk.vposla(id);
GRANT ALL ON TABLE fmk.vposla TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.vprih
(
  id character(3),
  match_code character(10),
  naz character(20)
);

DROP INDEX IF EXISTS vprih_id1;
CREATE INDEX vprih_id1 ON fmk.vprih(id);
GRANT ALL ON TABLE fmk.vprih TO xtrole;


-- os modul

CREATE TABLE IF NOT EXISTS fmk.os_os
(
  id character(10),
  match_code character(10),
  naz character(30),
  idrj character(4),
  datum date,
  datotp date,
  opisotp character(30),
  idkonto character(7),
  kolicina numeric(6,1),
  jmj character(3),
  idam character(8),
  idrev character(4),
  nabvr numeric(18,2),
  otpvr numeric(18,2),
  amd numeric(18,2),
  amp numeric(18,2),
  revd numeric(18,2),
  revp numeric(18,2),
  k1 character(4),
  k2 character(1),
  k3 character(2),
  opis character(25),
  brsoba character(6),
  idpartner character(6)
);

DROP INDEX IF EXISTS os_os_id1;
CREATE INDEX os_os_id1 ON fmk.os_os(id);
GRANT ALL ON TABLE fmk.os_os TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.os_k1
(
  id character(4),
  match_code character(10),
  naz character(25)
);

DROP INDEX IF EXISTS os_k1_id1;
CREATE INDEX os_k1_id1 ON fmk.os_k1(id);
GRANT ALL ON TABLE fmk.os_k1 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.os_promj
(
  id character(10),
  match_code character(10),
  opis character(30),
  datum date,
  tip character(2),
  nabvr numeric(18,2),
  otpvr numeric(18,2),
  amd numeric(18,2),
  amp numeric(18,2),
  revd numeric(18,2),
  revp numeric(18,2)
);

DROP INDEX IF EXISTS os_promj_id1;
CREATE INDEX os_promj_id1 ON fmk.os_promj(id, datum);
GRANT ALL ON TABLE fmk.os_promj TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.os_amort
(
  id character(8),
  match_code character(10),
  naz character(25),
  iznos numeric(7,3)
);

DROP INDEX IF EXISTS os_amort_id1;
CREATE INDEX os_amort_id1 ON fmk.os_amort(id);
GRANT ALL ON TABLE fmk.os_amort TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.os_reval
(
  id character(4),
  match_code character(10),
  naz character(10),
  i1 numeric(7,3),
  i2 numeric(7,3),
  i3 numeric(7,3),
  i4 numeric(7,3),
  i5 numeric(7,3),
  i6 numeric(7,3),
  i7 numeric(7,3),
  i8 numeric(7,3),
  i9 numeric(7,3),
  i10 numeric(7,3),
  i11 numeric(7,3),
  i12 numeric(7,3)
);

DROP INDEX IF EXISTS os_reval_id1;
CREATE INDEX os_reval_id1 ON fmk.os_reval(id);
GRANT ALL ON TABLE fmk.os_reval TO xtrole;


-- epdv

CREATE TABLE IF NOT EXISTS fmk.epdv_kif
(
  datum date,
  datum_2 date,
  src character(1),
  td_src character(2),
  src_2 character(1),
  id_tar character(6),
  id_part character(6),
  part_idbr character(13),
  part_kat character(1),
  part_kat_2 character(13),
  src_pm character(6),
  src_td character(12),
  src_br character(12),
  src_veza_b character(12),
  src_br_2 character(12),
  r_br numeric(6,0),
  br_dok numeric(6,0),
  g_r_br numeric(8,0),
  lock character(1),
  kat character(1),
  kat_2 character(1),
  opis character(160),
  i_b_pdv numeric(16,2),
  i_pdv numeric(16,2),
  i_v_b_pdv numeric(16,2),
  i_v_pdv numeric(16,2),
  status character(1),
  kat_p character(1),
  kat_p_2 character(1)
);

DROP INDEX IF EXISTS epdv_kif_id1;
CREATE INDEX epdv_kif_id1 ON fmk.epdv_kif(datum, datum_2);
GRANT ALL ON TABLE fmk.epdv_kif TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.epdv_kuf
(
  datum date,
  datum_2 date,
  src character(1),
  td_src character(2),
  src_2 character(1),
  id_tar character(6),
  id_part character(6),
  part_idbr character(13),
  part_kat character(1),
  src_td character(12),
  src_br character(12),
  src_veza_b character(12),
  src_br_2 character(12),
  r_br numeric(6,0),
  br_dok numeric(6,0),
  g_r_br numeric(8,0),
  lock character(1),
  kat character(1),
  kat_2 character(1),
  opis character(160),
  i_b_pdv numeric(16,2),
  i_pdv numeric(16,2),
  i_v_b_pdv numeric(16,2),
  i_v_pdv numeric(16,2),
  status character(1),
  kat_p character(1),
  kat_p_2 character(1)
);

DROP INDEX IF EXISTS epdv_kuf_id1;
CREATE INDEX epdv_kuf_id1 ON fmk.epdv_kuf(datum, datum_2);
GRANT ALL ON TABLE fmk.epdv_kuf TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.epdv_pdv
(
  datum_1 date,
  datum_2 date,
  datum_3 date,
  id_br character(12),
  per_od date,
  per_do date,
  po_naziv character(60),
  po_adresa character(60),
  po_ptt character(10),
  po_mjesto character(40),
  isp_opor numeric(18,2),
  isp_izv numeric(18,2),
  isp_neopor numeric(18,2),
  isp_nep_sv numeric(18,2),
  nab_opor numeric(18,2),
  nab_uvoz numeric(18,2),
  nab_ne_opo numeric(18,2),
  nab_st_sr numeric(18,2),
  i_pdv_r numeric(18,2),
  i_pdv_nr_1 numeric(18,2),
  i_pdv_nr_2 numeric(18,2),
  i_pdv_nr_3 numeric(18,2),
  i_pdv_nr_4 numeric(18,2),
  u_pdv_r numeric(18,2),
  u_pdv_uv numeric(18,2),
  u_pdv_pp numeric(18,2),
  i_pdv_uk numeric(18,2),
  u_pdv_uk numeric(18,2),
  pdv_uplati numeric(18,2),
  pdv_prepla numeric(18,2),
  pdv_povrat character(1),
  pot_mjesto character(40),
  pot_datum date,
  pot_ob character(80),
  lock character(1)
);

DROP INDEX IF EXISTS epdv_pdv_id1;
CREATE INDEX epdv_pdv_id1 ON fmk.epdv_pdv(datum_1, datum_2);
GRANT ALL ON TABLE fmk.epdv_pdv TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.epdv_sg_kif
(
  id character(4),
  match_code character(10),
  naz character(60),
  src character(1),
  s_path character(60),
  s_path_s character(60),
  form_b_pdv character(160),
  form_pdv character(160),
  id_tar character(160),
  id_kto character(160),
  razb_tar character(1),
  razb_kto character(1),
  razb_dan character(1),
  kat_part character(1),
  td_src character(2),
  kat_p character(1),
  kat_p_2 character(1),
  s_id_tar character(6),
  zaok numeric(1,0),
  zaok2 numeric(1,0),
  s_id_part character(6),
  aktivan character(1),
  id_kto_naz character(10),
  s_br_dok character(12)
);

DROP INDEX IF EXISTS epdv_sg_kif_id1;
CREATE INDEX epdv_sg_kif_id1 ON fmk.epdv_sg_kif(id);
GRANT ALL ON TABLE fmk.epdv_sg_kif TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.epdv_sg_kuf
(
  id character(4),
  match_code character(10),
  naz character(60),
  src character(1),
  s_path character(60),
  s_path_s character(60),
  form_b_pdv character(160),
  form_pdv character(160),
  id_tar character(160),
  id_kto character(160),
  razb_tar character(1),
  razb_kto character(1),
  razb_dan character(1),
  kat_part character(1),
  td_src character(2),
  kat_p character(1),
  kat_p_2 character(1),
  s_id_tar character(6),
  zaok numeric(1,0),
  zaok2 numeric(1,0),
  s_id_part character(6),
  aktivan character(1),
  id_kto_naz character(10),
  s_br_dok character(12)
);

DROP INDEX IF EXISTS epdv_sg_kuf_id1;
CREATE INDEX epdv_sg_kuf_id1 ON fmk.epdv_sg_kuf(id);
GRANT ALL ON TABLE fmk.epdv_sg_kuf TO xtrole;


-- sifrarnici

CREATE TABLE IF NOT EXISTS fmk.roba
(
  id character(10) PRIMARY KEY,
  match_code character(10),
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

DROP INDEX IF EXISTS roba_id;
DROP INDEX IF EXISTS roba_naz;
CREATE INDEX roba_id ON fmk.roba(id);
CREATE INDEX roba_naz ON fmk.roba(naz);
GRANT ALL ON TABLE fmk.roba TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.tarifa
(
  id character(6) PRIMARY KEY,
  match_code character(10),
  naz character(50),
  opp numeric(6, 2),
  ppp numeric(6, 2),
  zpp numeric(6, 2),
  vpp numeric(6, 2),
  mpp numeric(6, 2),
  dlruc numeric(6, 2)
);

DROP INDEX IF EXISTS tarifa_id;
DROP INDEX IF EXISTS tarifa_naz;
CREATE INDEX tarifa_id ON fmk.tarifa(id);
CREATE INDEX tarifa_naz ON fmk.tarifa(naz);
GRANT ALL ON TABLE fmk.tarifa TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.partn
(
  id character(6) PRIMARY KEY,
  match_code character(10),
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

DROP INDEX IF EXISTS partn_id;
DROP INDEX IF EXISTS partn_naz;
CREATE INDEX partn_id ON fmk.partn(id);
CREATE INDEX partn_naz ON fmk.partn(naz);
GRANT ALL ON TABLE fmk.partn TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.konto
(
  id character(7) PRIMARY KEY,
  match_code character(10),
  naz character(57),
  pozbilu character(3),
  pozbils character(3)
);

DROP INDEX IF EXISTS konto_id;
DROP INDEX IF EXISTS konto_naz;
CREATE INDEX konto_id ON fmk.konto(id);
CREATE INDEX konto_naz ON fmk.konto(naz);
GRANT ALL ON TABLE fmk.konto TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.rj
(
  id character(7) PRIMARY KEY,
  match_code character(10),
  naz character(100)
);

DROP INDEX IF EXISTS rj_id;
DROP INDEX IF EXISTS rj_naz;
CREATE INDEX rj_id ON fmk.rj(id);
CREATE INDEX rj_naz ON fmk.rj(naz);
GRANT ALL ON TABLE fmk.rj TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.ld_rj
(
  id character(2) PRIMARY KEY,
  match_code character(10),
  naz character(100),
  tiprada character(1),
  opor character(1)
);

DROP INDEX IF EXISTS ld_rj_id;
DROP INDEX IF EXISTS ld_rj_naz;
CREATE INDEX ld_rj_id ON fmk.ld_rj(id);
CREATE INDEX ld_rj_naz ON fmk.ld_rj(naz);
GRANT ALL ON TABLE fmk.ld_rj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.valute
(
  id character(4) PRIMARY KEY,
  match_code character(10),
  naz character(30),
  naz2 character(4),
  datum date,
  kurs1 numeric(18,8),
  kurs2 numeric(18,8),
  kurs3 numeric(18,8),
  tip character(1)
);

DROP INDEX IF EXISTS valute_id;
DROP INDEX IF EXISTS valute_naz;
DROP INDEX IF EXISTS valute_id2;
DROP INDEX IF EXISTS valute_id3;
CREATE INDEX valute_id ON fmk.valute(id);
CREATE INDEX valute_naz ON fmk.valute(naz);
CREATE INDEX valute_id2 ON fmk.valute(tip, id, datum);
CREATE INDEX valute_id3 ON fmk.valute(id, datum);
GRANT ALL ON TABLE fmk.valute TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.sifk
(
  id character(8),
  match_code character(10),
  sort character(2),
  naz character(25),
  oznaka character(4),
  veza character(1),
  f_unique character(1),
  izvor character(15),
  uslov character(200),
  duzina numeric(2,0),
  f_decimal numeric(1,0),
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

DROP INDEX IF EXISTS sifk_id;
CREATE INDEX sifk_id ON fmk.sifk(id, sort, naz);
GRANT ALL ON TABLE fmk.sifk TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.sifv
(
  id character(8),
  idsif character(15),
  naz character(200),
  oznaka character(4)
);

DROP INDEX IF EXISTS sifv_id1;
DROP INDEX IF EXISTS sifv_id2;
DROP INDEX IF EXISTS sifv_id3;
CREATE INDEX sifv_id1 ON fmk.sifv(id, oznaka, idsif, naz);
CREATE INDEX sifv_id2 ON fmk.sifv(id, idsif);
CREATE INDEX sifv_id3 ON fmk.sifv(id, oznaka, naz);
GRANT ALL ON TABLE fmk.sifv TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.tnal
(
  id character(2),
  match_code character(10),
  naz character(30)
);

DROP INDEX IF EXISTS tnal_id1;
DROP INDEX IF EXISTS tnal_id2;
CREATE INDEX tnal_id1 ON fmk.tnal(id);
CREATE INDEX tnal_id2 ON fmk.tnal(naz);
GRANT ALL ON TABLE fmk.tnal TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.tdok
(
  id character(2),
  match_code character(10),
  naz character(30)
);

DROP INDEX IF EXISTS tdok_id1;
DROP INDEX IF EXISTS tdok_id2;
CREATE INDEX tdok_id1 ON fmk.tdok(id);
CREATE INDEX tdok_id2 ON fmk.tdok(naz);
GRANT ALL ON TABLE fmk.tdok TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ops
(
  id character(4),
  match_code character(10),
  idj character(3),
  idn0 character(1),
  idkan character(2),
  naz character(20),
  zipcode character(5),
  puccanton character(2),
  puccity character(5),
  region character(1)
);

DROP INDEX IF EXISTS ops_id1;
DROP INDEX IF EXISTS ops_id2;
CREATE INDEX ops_id1 ON fmk.ops(id);
CREATE INDEX ops_id2 ON fmk.ops(naz);
GRANT ALL ON TABLE fmk.ops TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.banke
(
  id character(3),
  match_code character(10),
  naz character(45),
  mjesto character(30),
  adresa character(30)
);

DROP INDEX IF EXISTS banke_id1;
CREATE INDEX banke_id1 ON fmk.banke(id);
GRANT ALL ON TABLE fmk.banke TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.koncij
(
  id character(7),
  match_code character(10),
  shema character(1),
  naz character(2),
  idprodmjes character(2),
  region character(2)
);

DROP INDEX IF EXISTS koncij_id1;
CREATE INDEX koncij_id1 ON fmk.koncij(id);
GRANT ALL ON TABLE fmk.koncij TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp
(
  id character(60),
  match_code character(10),
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

DROP INDEX IF EXISTS trfp_id1;
CREATE INDEX trfp_id1 ON fmk.trfp(id);
GRANT ALL ON TABLE fmk.trfp TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp2
(
  id character(60),
  match_code character(10),
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

DROP INDEX IF EXISTS trfp2_id1;
CREATE INDEX trfp2_id1 ON fmk.trfp2(idvd, shema, idkonto);
GRANT ALL ON TABLE fmk.trfp2 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.trfp3
(
  id character(60),
  match_code character(10),
  shema character(1),
  naz character(20),
  idkonto character(7),
  d_p character(1),
  znak character(1),
  idvn character(2)
);

DROP INDEX IF EXISTS trfp3_id1;
CREATE INDEX trfp3_id1 ON fmk.trfp3(shema, idkonto);
GRANT ALL ON TABLE fmk.trfp3 TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.sast
(
  id character(10),
  match_code character(10),
  r_br numeric(4,0),
  id2 character(10),
  kolicina numeric(20,5),
  k1 character(1),
  k2 character(1),
  n1 numeric(20,5),
  n2 numeric(20,5)
);

DROP INDEX IF EXISTS sast_id1;
CREATE INDEX sast_id1 ON fmk.sast(id, id2);
GRANT ALL ON TABLE fmk.sast TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.lokal
(
  id character(2),
  match_code character(10),
  id_str numeric(6,0),
  naz character(200)
);

DROP INDEX IF EXISTS lokal_id1;
DROP INDEX IF EXISTS lokal_id2;
CREATE INDEX lokal_id1 ON fmk.lokal(id);
CREATE INDEX lokal_id2 ON fmk.lokal(id_str);
GRANT ALL ON TABLE fmk.lokal TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.refer
(
  id character(10),
  match_code character(10),
  idops character(4),
  naz character(40)
);

DROP INDEX IF EXISTS refer_id1;
CREATE INDEX refer_id1 ON fmk.refer(id);
GRANT ALL ON TABLE fmk.refer TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 600);


------------------------------------------------------
-- semafori 2.0.0
-- create table semaphores
---------------------------------------------------------

SELECT u2.execute($$

-- fin tabele

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_suban
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_fin_suban_user_code_idx;
CREATE INDEX on fmk.semaphores_fin_suban(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_suban TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_anal
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint, 
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_fin_anal_user_code_idx;
CREATE INDEX on fmk.semaphores_fin_anal(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_anal TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_sint
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_fin_sint_user_code_idx;
CREATE INDEX on fmk.semaphores_fin_sint(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_sint TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fin_nalog
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint, 
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_fin_nalog_user_code_idx;
CREATE INDEX on fmk.semaphores_fin_nalog(user_code);
GRANT ALL ON TABLE fmk.semaphores_fin_nalog TO xtrole;

-- sifrarnici

CREATE TABLE IF NOT EXISTS fmk.semaphores_partn
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm character(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint, 
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_partn_user_code_idx;
CREATE INDEX on fmk.semaphores_partn(user_code);
GRANT ALL ON TABLE fmk.semaphores_partn TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_konto
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

DROP INDEX IF EXISTS semaphores_konto_user_code_idx;
CREATE INDEX on fmk.semaphores_konto(user_code);
GRANT ALL ON TABLE fmk.semaphores_konto TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 20000);

-- end 2.0.0 version


-- verzija 3.0.1

-- sem.kalk_kalk

SELECT u2.execute($$



CREATE TABLE IF NOT EXISTS fmk.semaphores_kalk_kalk
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

DROP INDEX IF EXISTS semaphores_kalk_kalk_user_code_idx;
CREATE INDEX on fmk.semaphores_kalk_kalk(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalk_kalk TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);

-- kalk_doks

SELECT u2.execute($$
    

CREATE TABLE IF NOT EXISTS fmk.semaphores_kalk_doks
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

DROP INDEX IF EXISTS semaphores_kalk_doks_user_code_idx;
CREATE INDEX on fmk.semaphores_kalk_doks(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalk_doks TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30001);

-- end 3.0.1 verzija

-------------------------------------------------------------
-- verzija 3.0.2


SELECT u2.execute($$

-- roba

CREATE TABLE IF NOT EXISTS fmk.semaphores_roba
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

DROP INDEX IF EXISTS semaphores_roba_user_code_idx;
CREATE INDEX on fmk.semaphores_roba(user_code);
GRANT ALL ON TABLE fmk.semaphores_roba TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_tarifa
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

DROP INDEX IF EXISTS semaphores_tarifa_user_code_idx;
CREATE INDEX on fmk.semaphores_tarifa(user_code);
GRANT ALL ON TABLE fmk.semaphores_tarifa TO xtrole;

-- sem.fakt_fakt

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_fakt
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

DROP INDEX IF EXISTS semaphores_fakt_fakt_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_fakt(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_fakt TO xtrole;

-- fakt_doks
    
CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_doks
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

DROP INDEX IF EXISTS semaphores_fakt_doks_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_doks(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_doks TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_doks2
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

DROP INDEX IF EXISTS semaphores_fakt_doks2_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_doks2(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_doks2 TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_upl
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

DROP INDEX IF EXISTS semaphores_fakt_upl_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_upl(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_upl TO xtrole;



-- fakt_ugov / rugov / gen_ug / gen_ug_p

CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_ugov
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

DROP INDEX IF EXISTS semaphores_fakt_ugov_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_ugov(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_ugov TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_rugov
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

DROP INDEX IF EXISTS semaphores_fakt_rugov_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_rugov(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_rugov TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_gen_ug
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

DROP INDEX IF EXISTS semaphores_fakt_gen_ug_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_gen_ug(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_gen_ug TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_gen_ug_p
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

DROP INDEX IF EXISTS semaphores_fakt_gen_ug_p_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_gen_ug_p(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_gen_ug_p TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_fakt_ftxt
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

DROP INDEX IF EXISTS semaphores_fakt_ftxt_user_code_idx;
CREATE INDEX on fmk.semaphores_fakt_ftxt(user_code);
GRANT ALL ON TABLE fmk.semaphores_fakt_ftxt TO xtrole;

-- ld

CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_ld
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

DROP INDEX IF EXISTS semaphores_ld_ld_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_ld(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_ld TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_pk_data
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

DROP INDEX IF EXISTS semaphores_ld_pk_data_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_pk_data(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_pk_data TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_pk_radn
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

DROP INDEX IF EXISTS semaphores_ld_pk_radn_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_pk_radn(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_pk_radn TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_radkr
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

DROP INDEX IF EXISTS semaphores_ld_radkr_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_radkr(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_radkr TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_radsat
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

DROP INDEX IF EXISTS semaphores_ld_radsat_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_radsat(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_radsat TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_norsiht
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

DROP INDEX IF EXISTS semaphores_ld_norsiht_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_norsiht(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_norsiht TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_obracuni
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

DROP INDEX IF EXISTS semaphores_ld_obracuni_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_obracuni(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_obracuni TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_radn
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

DROP INDEX IF EXISTS semaphores_ld_radn_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_radn(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_radn TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_dopr
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

DROP INDEX IF EXISTS semaphores_dopr_user_code_idx;
CREATE INDEX on fmk.semaphores_dopr(user_code);
GRANT ALL ON TABLE fmk.semaphores_dopr TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_por
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

DROP INDEX IF EXISTS semaphores_por_user_code_idx;
CREATE INDEX on fmk.semaphores_por(user_code);
GRANT ALL ON TABLE fmk.semaphores_por TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_tippr
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

DROP INDEX IF EXISTS semaphores_tippr_user_code_idx;
CREATE INDEX on fmk.semaphores_tippr(user_code);
GRANT ALL ON TABLE fmk.semaphores_tippr TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_tippr2
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

DROP INDEX IF EXISTS semaphores_tippr2_user_code_idx;
CREATE INDEX on fmk.semaphores_tippr2(user_code);
GRANT ALL ON TABLE fmk.semaphores_tippr2 TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_vposla
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

DROP INDEX IF EXISTS semaphores_vposla_user_code_idx;
CREATE INDEX on fmk.semaphores_vposla(user_code);
GRANT ALL ON TABLE fmk.semaphores_vposla TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_vprih
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

DROP INDEX IF EXISTS semaphores_vprih_user_code_idx;
CREATE INDEX on fmk.semaphores_vprih(user_code);
GRANT ALL ON TABLE fmk.semaphores_vprih TO xtrole;


-- os



CREATE TABLE IF NOT EXISTS fmk.semaphores_os_os
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

DROP INDEX IF EXISTS semaphores_os_os_user_code_idx;
CREATE INDEX on fmk.semaphores_os_os(user_code);
GRANT ALL ON TABLE fmk.semaphores_os_os TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_os_k1
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

DROP INDEX IF EXISTS semaphores_os_k1_user_code_idx;
CREATE INDEX on fmk.semaphores_os_k1(user_code);
GRANT ALL ON TABLE fmk.semaphores_os_k1 TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_os_promj
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

DROP INDEX IF EXISTS semaphores_os_promj_user_code_idx;
CREATE INDEX on fmk.semaphores_os_promj(user_code);
GRANT ALL ON TABLE fmk.semaphores_os_promj TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_os_reval
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

DROP INDEX IF EXISTS semaphores_os_reval_user_code_idx;
CREATE INDEX on fmk.semaphores_os_reval(user_code);
GRANT ALL ON TABLE fmk.semaphores_os_reval TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.semaphores_os_amort
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

DROP INDEX IF EXISTS semaphores_os_amort_user_code_idx;
CREATE INDEX on fmk.semaphores_os_amort(user_code);
GRANT ALL ON TABLE fmk.semaphores_os_amort TO xtrole;


-- epdv



CREATE TABLE IF NOT EXISTS fmk.semaphores_epdv_kuf
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

DROP INDEX IF EXISTS semaphores_epdv_kuf_user_code_idx;
CREATE INDEX on fmk.semaphores_epdv_kuf(user_code);
GRANT ALL ON TABLE fmk.semaphores_epdv_kuf TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_epdv_kif
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

DROP INDEX IF EXISTS semaphores_epdv_kif_user_code_idx;
CREATE INDEX on fmk.semaphores_epdv_kif(user_code);
GRANT ALL ON TABLE fmk.semaphores_epdv_kif TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_epdv_pdv
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

DROP INDEX IF EXISTS semaphores_epdv_pdv_user_code_idx;
CREATE INDEX on fmk.semaphores_epdv_pdv(user_code);
GRANT ALL ON TABLE fmk.semaphores_epdv_pdv TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.semaphores_epdv_sg_kuf
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

DROP INDEX IF EXISTS semaphores_epdv_sg_kuf_user_code_idx;
CREATE INDEX on fmk.semaphores_epdv_sg_kuf(user_code);
GRANT ALL ON TABLE fmk.semaphores_epdv_sg_kuf TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_epdv_sg_kif
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

DROP INDEX IF EXISTS semaphores_epdv_sg_kif_user_code_idx;
CREATE INDEX on fmk.semaphores_epdv_sg_kif(user_code);
GRANT ALL ON TABLE fmk.semaphores_epdv_sg_kif TO xtrole;


-- sifrarnici



CREATE TABLE IF NOT EXISTS fmk.semaphores_rj
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

DROP INDEX IF EXISTS semaphores_rj_user_code_idx;
CREATE INDEX on fmk.semaphores_rj(user_code);
GRANT ALL ON TABLE fmk.semaphores_rj TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_rj
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

DROP INDEX IF EXISTS semaphores_ld_rj_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_rj(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_rj TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_valute
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

DROP INDEX IF EXISTS semaphores_valute_user_code_idx;
CREATE INDEX on fmk.semaphores_valute(user_code);
GRANT ALL ON TABLE fmk.semaphores_valute TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ops
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

DROP INDEX IF EXISTS semaphores_ops_user_code_idx;
CREATE INDEX on fmk.semaphores_ops(user_code);
GRANT ALL ON TABLE fmk.semaphores_ops TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_banke
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

DROP INDEX IF EXISTS semaphores_banke_user_code_idx;
CREATE INDEX on fmk.semaphores_banke(user_code);
GRANT ALL ON TABLE fmk.semaphores_banke TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_tnal
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

DROP INDEX IF EXISTS semaphores_tnal_user_code_idx;
CREATE INDEX on fmk.semaphores_tnal(user_code);
GRANT ALL ON TABLE fmk.semaphores_tnal TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_tdok
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

DROP INDEX IF EXISTS semaphores_tdok_user_code_idx;
CREATE INDEX on fmk.semaphores_tdok(user_code);
GRANT ALL ON TABLE fmk.semaphores_tdok TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_sifk
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

DROP INDEX IF EXISTS semaphores_sifk_user_code_idx;
CREATE INDEX on fmk.semaphores_sifk(user_code);
GRANT ALL ON TABLE fmk.semaphores_sifk TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_sifv
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

DROP INDEX IF EXISTS semaphores_sifv_user_code_idx;
CREATE INDEX on fmk.semaphores_sifv(user_code);
GRANT ALL ON TABLE fmk.semaphores_sifv TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_koncij
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

DROP INDEX IF EXISTS semaphores_koncij_user_code_idx;
CREATE INDEX on fmk.semaphores_koncij(user_code);
GRANT ALL ON TABLE fmk.semaphores_koncij TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_sast
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

DROP INDEX IF EXISTS semaphores_sast_user_code_idx;
CREATE INDEX on fmk.semaphores_sast(user_code);
GRANT ALL ON TABLE fmk.semaphores_sast TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp
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

DROP INDEX IF EXISTS semaphores_trfp_user_code_idx;
CREATE INDEX on fmk.semaphores_trfp(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp2
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

DROP INDEX IF EXISTS semaphores_trfp2_user_code_idx;
CREATE INDEX on fmk.semaphores_trfp2(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp2 TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_trfp3
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

DROP INDEX IF EXISTS semaphores_trfp3_user_code_idx;
CREATE INDEX on fmk.semaphores_trfp3(user_code);
GRANT ALL ON TABLE fmk.semaphores_trfp3 TO xtrole;





CREATE TABLE IF NOT EXISTS fmk.semaphores_lokal
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

DROP INDEX IF EXISTS semaphores_lokal_user_code_idx;
CREATE INDEX on fmk.semaphores_lokal(user_code);
GRANT ALL ON TABLE fmk.semaphores_lokal TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_refer
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

DROP INDEX IF EXISTS semaphores_refer_user_code_idx;
CREATE INDEX on fmk.semaphores_refer(user_code);
GRANT ALL ON TABLE fmk.semaphores_refer TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 30002);

-- end 3.0.2 verzija


-- 3.0.3 verzija


SELECT u2.execute($$

-- ugovori, dest tabela

CREATE TABLE IF NOT EXISTS fmk.dest
(
  id character(6),
  idpartner character(6),
  naziv character(60),
  naziv2 character(60),
  mjesto character(20),
  adresa character(40),
  ptt character(10),
  telefon character(20),
  mobitel character(20),
  fax character(20)
);

DROP INDEX IF EXISTS dest_id1;
CREATE INDEX dest_id1 ON fmk.dest(id);
GRANT ALL ON TABLE fmk.dest TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_dest
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

DROP INDEX IF EXISTS semaphores_dest_user_code_idx;
CREATE INDEX on fmk.semaphores_dest(user_code);
GRANT ALL ON TABLE fmk.semaphores_dest TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30003);

--- alter stavljam u poseban blok

SELECT u2.execute($$

-- alter roba...

ALTER TABLE fmk.roba DROP COLUMN IF EXISTS k7;
ALTER TABLE fmk.roba DROP COLUMN IF EXISTS k8;
ALTER TABLE fmk.roba DROP COLUMN IF EXISTS k9;
ALTER TABLE fmk.roba DROP COLUMN IF EXISTS strings;

ALTER TABLE fmk.roba ADD COLUMN k7 character(4);
ALTER TABLE fmk.roba ADD COLUMN k8 character(4);
ALTER TABLE fmk.roba ADD COLUMN k9 character(4);
ALTER TABLE fmk.roba ADD COLUMN strings numeric(10,0);

-- alter rugov
alter table fmk.fakt_rugov drop column if exists k1;
alter table fmk.fakt_rugov drop column if exists k2;
alter table fmk.fakt_rugov drop column if exists dest;
alter table fmk.fakt_rugov drop column if exists cijena;

alter table fmk.fakt_rugov add column k1 character(1);
alter table fmk.fakt_rugov add column k2 character(2);
alter table fmk.fakt_rugov add column dest character(6);
alter table fmk.fakt_rugov add column cijena numeric(15,3);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30003);

--- end 3.0.3 verzija


--- start 3.0.4 verzija

SELECT u2.execute($$

-- fmkrules

CREATE TABLE IF NOT EXISTS fmk.f18_rules
(
  rule_id numeric(10,0),
  modul_name character(10),
  rule_obj character(30),
  rule_no numeric(5,0),
  rule_name character(100),
  rule_ermsg character(200),
  rule_level numeric(2,0),
  rule_c1 character(1),
  rule_c2 character(5),
  rule_c3 character(10),
  rule_c4 character(10),
  rule_c5 character(50),
  rule_c6 character(50),
  rule_c7 character(100),
  rule_n1 numeric(15,5),
  rule_n2 numeric(15,5),
  rule_n3 numeric(15,5),
  rule_d1 date,
  rule_d2 date
);

DROP INDEX IF EXISTS f18_rules_id1;
CREATE INDEX f18_rules_id1 ON fmk.f18_rules( rule_id );
GRANT ALL ON TABLE fmk.f18_rules TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_f18_rules
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

DROP INDEX IF EXISTS semaphores_f18_rules_user_code_idx;
CREATE INDEX on fmk.semaphores_f18_rules(user_code);
GRANT ALL ON TABLE fmk.semaphores_f18_rules TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 30004);

--- end 3.0.4 verzija


--- start 3.0.5 verzija

SELECT u2.execute($$

ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i31;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i32;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i33;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i34;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i35;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i36;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i37;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i38;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i39;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i40;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i41;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i42;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i43;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i44;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i45;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i46;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i47;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i48;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i49;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i50;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i51;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i52;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i53;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i54;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i55;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i56;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i57;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i58;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i59;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS i60;


ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s31;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s32;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s33;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s34;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s35;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s36;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s37;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s38;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s39;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s40;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s41;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s42;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s43;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s44;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s45;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s46;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s47;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s48;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s49;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s50;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s51;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s52;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s53;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s54;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s55;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s56;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s57;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s58;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s59;
ALTER TABLE fmk.ld_ld DROP COLUMN IF EXISTS s60;



ALTER TABLE fmk.ld_ld 
    ADD COLUMN i31 numeric(12,2),
	ADD COLUMN s31 numeric(5,2),
	ADD COLUMN i32 numeric(12,2),
	ADD COLUMN s32 numeric(5,2),
	ADD COLUMN i33 numeric(12,2),
	ADD COLUMN s33 numeric(5,2),
	ADD COLUMN i34 numeric(12,2),
	ADD COLUMN s34 numeric(5,2),
	ADD COLUMN i35 numeric(12,2),
	ADD COLUMN s35 numeric(5,2),
	ADD COLUMN i36 numeric(12,2),
	ADD COLUMN s36 numeric(5,2),
	ADD COLUMN i37 numeric(12,2),
	ADD COLUMN s37 numeric(5,2),
	ADD COLUMN i38 numeric(12,2),
	ADD COLUMN s38 numeric(5,2),
	ADD COLUMN i39 numeric(12,2),
	ADD COLUMN s39 numeric(5,2),
	ADD COLUMN i40 numeric(12,2),
	ADD COLUMN s40 numeric(5,2),
	ADD COLUMN i41 numeric(12,2),
	ADD COLUMN s41 numeric(5,2),
	ADD COLUMN i42 numeric(12,2),
	ADD COLUMN s42 numeric(5,2),
	ADD COLUMN i43 numeric(12,2),
	ADD COLUMN s43 numeric(5,2),
	ADD COLUMN i44 numeric(12,2),
	ADD COLUMN s44 numeric(5,2),
	ADD COLUMN i45 numeric(12,2),
	ADD COLUMN s45 numeric(5,2),
	ADD COLUMN i46 numeric(12,2),
	ADD COLUMN s46 numeric(5,2),
	ADD COLUMN i47 numeric(12,2),
	ADD COLUMN s47 numeric(5,2),
	ADD COLUMN i48 numeric(12,2),
	ADD COLUMN s48 numeric(5,2),
	ADD COLUMN i49 numeric(12,2),
	ADD COLUMN s49 numeric(5,2),
	ADD COLUMN i50 numeric(12,2),
	ADD COLUMN s50 numeric(5,2),
	ADD COLUMN i51 numeric(12,2),
	ADD COLUMN s51 numeric(5,2),
	ADD COLUMN i52 numeric(12,2),
	ADD COLUMN s52 numeric(5,2),
	ADD COLUMN i53 numeric(12,2),
	ADD COLUMN s53 numeric(5,2),
	ADD COLUMN i54 numeric(12,2),
	ADD COLUMN s54 numeric(5,2),
	ADD COLUMN i55 numeric(12,2),
	ADD COLUMN s55 numeric(5,2),
	ADD COLUMN i56 numeric(12,2),
	ADD COLUMN s56 numeric(5,2),
	ADD COLUMN i57 numeric(12,2),
	ADD COLUMN s57 numeric(5,2),
	ADD COLUMN i58 numeric(12,2),
	ADD COLUMN s58 numeric(5,2),
	ADD COLUMN i59 numeric(12,2),
	ADD COLUMN s59 numeric(5,2),
	ADD COLUMN i60 numeric(12,2),
	ADD COLUMN s60 numeric(5,2);

GRANT ALL ON TABLE fmk.ld_ld TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30005);


SELECT u2.execute($$

-- ld, tabele

CREATE TABLE IF NOT EXISTS fmk.strspr
(
  id character(3),
  naz character(20),
  naz2 character(6)
);

DROP INDEX IF EXISTS strspr_id1;
CREATE INDEX strspr_id1 ON fmk.strspr( id );
GRANT ALL ON TABLE fmk.strspr TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_strspr
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

DROP INDEX IF EXISTS semaphores_strspr_user_code_idx;
CREATE INDEX on fmk.semaphores_strspr(user_code);
GRANT ALL ON TABLE fmk.semaphores_strspr TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_parobr
(
  id character(2),
  naz character(10),
  vrbod numeric(15,5),
  k1 numeric(11,6),
  k2 numeric(11,6),
  k3 numeric(9,5),
  k4 numeric(6,3),
  k5 numeric(12,6),
  k6 numeric(12,6),
  k7 numeric(12,6),
  k8 numeric(12,6),
  m_br_sat numeric(12,6),
  m_net_sat numeric(12,6),
  prosld numeric(12,2),
  idrj character(2),
  godina character(4)
);

DROP INDEX IF EXISTS ld_parobr_id1;
CREATE INDEX ld_parobr_id1 ON fmk.ld_parobr( id );
GRANT ALL ON TABLE fmk.ld_parobr TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_parobr
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

DROP INDEX IF EXISTS semaphores_ld_parobr_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_parobr(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_parobr TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kred
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

DROP INDEX IF EXISTS semaphores_kred_user_code_idx;
CREATE INDEX on fmk.semaphores_kred(user_code);
GRANT ALL ON TABLE fmk.semaphores_kred TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_kbenef
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

DROP INDEX IF EXISTS semaphores_kbenef_user_code_idx;
CREATE INDEX on fmk.semaphores_kbenef(user_code);
GRANT ALL ON TABLE fmk.semaphores_kbenef TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ld_radsiht
(
  godina numeric(4,0),
  mjesec numeric(2,0),
  dan numeric(2,0),
  dandio character(1),
  idrj character(2),
  idradn character(6),
  idkonto character(7),
  opis character(50),
  idtippr character(2),
  brbod numeric(11,2),
  idnorsiht character(4),
  izvrseno numeric(14,3),
  bodova numeric(14,2)
);

DROP INDEX IF EXISTS ld_radsiht_id1;
CREATE INDEX ld_radsiht_id1 ON fmk.ld_radsiht(godina, mjesec, idradn);
GRANT ALL ON TABLE fmk.ld_radsiht TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_radsiht
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

DROP INDEX IF EXISTS semaphores_ld_radsiht_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_radsiht(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_radsiht TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.ld_tprsiht
(
  id character(2),
  naz character(30),
  k1 character(1),
  k2 character(2),
  k3 character(3),
  ff character(30)
);

DROP INDEX IF EXISTS ld_tprsiht_id1;
CREATE INDEX ld_tprsiht_id1 ON fmk.ld_tprsiht(id);
GRANT ALL ON TABLE fmk.ld_tprsiht TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_ld_tprsiht
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

DROP INDEX IF EXISTS semaphores_ld_tprsiht_user_code_idx;
CREATE INDEX on fmk.semaphores_ld_tprsiht(user_code);
GRANT ALL ON TABLE fmk.semaphores_ld_tprsiht TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 30005);

--- end 3.0.5 verzija


--- start 3.0.6 verzija

SELECT u2.execute($$

ALTER TABLE fmk.ops DROP COLUMN IF EXISTS reg;
ALTER TABLE fmk.ops DROP COLUMN IF EXISTS region;

ALTER TABLE fmk.ops ADD COLUMN reg character(1); 

$$)
WHERE (u2.knowhow_package_version('fmk') < 30006);

--- end 3.0.6 verzija


--- start 3.0.7 verzija

SELECT u2.execute($$

-- ld tabela obracnui

ALTER TABLE fmk.ld_obracuni DROP COLUMN IF EXISTS k1;
ALTER TABLE fmk.ld_obracuni DROP COLUMN IF EXISTS k2;

ALTER TABLE fmk.ld_obracuni ADD COLUMN k1 character(4), 
	ADD COLUMN k2 character(10);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30007);

--- end 3.0.7 verzija


--- start 3.1.0 verzija

SELECT u2.execute($$

alter table fmk.semaphores_banke  alter column last_trans_version drop default;   
alter table fmk.semaphores_dest  alter column last_trans_version drop default;   
alter table fmk.semaphores_dopr  alter column last_trans_version drop default;   
alter table fmk.semaphores_epdv_kif  alter column last_trans_version drop default;   
alter table fmk.semaphores_epdv_kuf  alter column last_trans_version drop default;   
alter table fmk.semaphores_epdv_pdv  alter column last_trans_version drop default;   
alter table fmk.semaphores_epdv_sg_kif  alter column last_trans_version drop default;   
alter table fmk.semaphores_epdv_sg_kuf  alter column last_trans_version drop default;   
alter table fmk.semaphores_f18_rules  alter column last_trans_version drop default;   

$$)
WHERE (u2.knowhow_package_version('fmk') < 30100);

-- fakt

SELECT u2.execute($$

alter table fmk.semaphores_fakt_doks  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_doks2  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_fakt  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_ftxt  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_gen_ug  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_gen_ug_p  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_rugov  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_ugov  alter column last_trans_version drop default;   
alter table fmk.semaphores_fakt_upl  alter column last_trans_version drop default;   


$$)
WHERE (u2.knowhow_package_version('fmk') < 30100);

--- end 3.1.0 verzija


--- start 3.1.1 verzija

-- sifk ima ID2 koji se puno koristi

SELECT u2.execute($$

CREATE INDEX sifk_id2 ON fmk.sifk(id, oznaka);
CREATE INDEX sifk_naz ON fmk.sifk(naz);
GRANT ALL ON TABLE fmk.sifk TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30101);

--- end 3.1.1 verzija


--- start 3.1.2 verzija


SELECT u2.execute($$

-- tabele modula MAT

CREATE TABLE IF NOT EXISTS fmk.mat_suban
(
  idfirma character(2),
  idroba character(10),
  idkonto character(7),
  idvn character(2),
  brnal character(4),
  rbr character(4),
  idtipdok character(2),
  brdok character(8),
  datdok date,
  u_i character(1),
  kolicina numeric(10,3),
  d_p character(1),
  iznos numeric(15,2),
  idpartner character(6),
  idzaduz character(6),
  iznos2 numeric(15,2),
  datkurs date,
  k1 character(1),
  k2 character(1),
  k3 character(1),
  k4 character(1),
  PRIMARY KEY( idfirma, idvn, brnal, rbr )
);

DROP INDEX IF EXISTS mat_suban_id1;
DROP INDEX IF EXISTS mat_suban_id2;
DROP INDEX IF EXISTS mat_suban_id3;
DROP INDEX IF EXISTS mat_suban_id4;
DROP INDEX IF EXISTS mat_suban_id5;
CREATE INDEX mat_suban_id1 ON fmk.mat_suban(idfirma, idroba, datdok);
CREATE INDEX mat_suban_id2 ON fmk.mat_suban(idfirma, idpartner, idroba);
CREATE INDEX mat_suban_id3 ON fmk.mat_suban(idfirma, idkonto, idroba, datdok);
CREATE INDEX mat_suban_id4 ON fmk.mat_suban(idfirma, idvn, brnal, rbr);
CREATE INDEX mat_suban_id5 ON fmk.mat_suban(idfirma, idkonto, idpartner, idroba, datdok);
GRANT ALL ON TABLE fmk.mat_suban TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_mat_suban
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

DROP INDEX IF EXISTS semaphores_mat_suban_user_code_idx;
CREATE INDEX on fmk.semaphores_mat_suban(user_code);
GRANT ALL ON TABLE fmk.semaphores_mat_suban TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.mat_nalog
(
  idfirma character(2),
  idvn character(2),
  brnal character(4),
  datnal date,
  dug numeric(15,2),
  pot numeric(15,2),
  dug2 numeric(15,2),
  pot2 numeric(15,2),
  PRIMARY KEY( idfirma, idvn, brnal )
);

DROP INDEX IF EXISTS mat_nalog_id1;
CREATE INDEX mat_nalog_id1 ON fmk.mat_nalog(idfirma, idvn, brnal);
GRANT ALL ON TABLE fmk.mat_nalog TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_mat_nalog
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

DROP INDEX IF EXISTS semaphores_mat_nalog_user_code_idx;
CREATE INDEX on fmk.semaphores_mat_nalog(user_code);
GRANT ALL ON TABLE fmk.semaphores_mat_nalog TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.mat_anal
(
  idfirma character(2),
  idkonto character(7),
  idvn character(2),
  brnal character(4),
  datnal date,
  rbr character(3),
  dug numeric(15,2),
  pot numeric(15,2),
  dug2 numeric(15,2),
  pot2 numeric(15,2),
  PRIMARY KEY( idfirma, idvn, brnal, rbr )
);

DROP INDEX IF EXISTS mat_anal_id1;
DROP INDEX IF EXISTS mat_anal_id2;
CREATE INDEX mat_anal_id1 ON fmk.mat_anal(idfirma, idkonto, datnal);
CREATE INDEX mat_anal_id2 ON fmk.mat_anal(idfirma, idvn, brnal, idkonto);
GRANT ALL ON TABLE fmk.mat_anal TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_mat_anal
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

DROP INDEX IF EXISTS semaphores_mat_anal_user_code_idx;
CREATE INDEX on fmk.semaphores_mat_anal(user_code);
GRANT ALL ON TABLE fmk.semaphores_mat_anal TO xtrole;




CREATE TABLE IF NOT EXISTS fmk.mat_sint
(
  idfirma character(2),
  idkonto character(3),
  idvn character(2),
  brnal character(4),
  datnal date,
  rbr character(3),
  dug numeric(15,2),
  pot numeric(15,2),
  dug2 numeric(15,2),
  pot2 numeric(15,2),
  PRIMARY KEY( idfirma, idvn, brnal, rbr )
);

DROP INDEX IF EXISTS mat_sint_id1;
DROP INDEX IF EXISTS mat_sint_id2;
CREATE INDEX mat_sint_id1 ON fmk.mat_sint(idfirma, idkonto, datnal);
CREATE INDEX mat_sint_id2 ON fmk.mat_sint(idfirma, idvn, brnal, idkonto);
GRANT ALL ON TABLE fmk.mat_sint TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_mat_sint
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

DROP INDEX IF EXISTS semaphores_mat_sint_user_code_idx;
CREATE INDEX on fmk.semaphores_mat_sint(user_code);
GRANT ALL ON TABLE fmk.semaphores_mat_sint TO xtrole;



CREATE TABLE IF NOT EXISTS fmk.mat_karkon
(
  id character(2),
  tip_nc character(1),
  tip_pc character(1)
);

DROP INDEX IF EXISTS mat_karkon_id1;
CREATE INDEX mat_karkon_id1 ON fmk.mat_karkon(id);
GRANT ALL ON TABLE fmk.mat_karkon TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_mat_karkon
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

DROP INDEX IF EXISTS semaphores_mat_karkon_user_code_idx;
CREATE INDEX on fmk.semaphores_mat_karkon(user_code);
GRANT ALL ON TABLE fmk.semaphores_mat_karkon TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 30102);

--- end 3.1.2 verzija



--- start 3.2.0 verzija


SELECT u2.execute($$

-- tabela ROBA, polje idkonto, modul MAT

ALTER TABLE fmk.roba DROP COLUMN IF EXISTS idkonto;
ALTER TABLE fmk.roba ADD COLUMN idkonto character(7);

$$)
WHERE (u2.knowhow_package_version('fmk') < 30200);

--- end 3.2.0 verzija

--- start 4.1.2 verzija

SELECT u2.execute($$

alter table fmk.semaphores_ld_radn  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_ld  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_radkr  alter column last_trans_version drop default;   
alter table fmk.semaphores_dopr  alter column last_trans_version drop default;   
alter table fmk.semaphores_por  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_rj  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_radsiht  alter column last_trans_version drop default;   
alter table fmk.semaphores_tippr  alter column last_trans_version drop default;   
alter table fmk.semaphores_tippr2  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_norsiht  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_obracuni  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_parobr  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_pk_data  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_pk_radn  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_radsat  alter column last_trans_version drop default;   
alter table fmk.semaphores_ld_tprsiht  alter column last_trans_version drop default;   
alter table fmk.semaphores_strspr  alter column last_trans_version drop default;   
alter table fmk.semaphores_vposla  alter column last_trans_version drop default;   
alter table fmk.semaphores_vprih  alter column last_trans_version drop default;   

$$)
WHERE (u2.knowhow_package_version('fmk') < 40102);

--- end 4.1.2 verzija


--- start 4.1.4 verzija

SELECT u2.execute($$

ALTER TABLE fmk.fakt_fakt ADD COLUMN fisc_rn numeric(10,0);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40104);

--- end 4.1.4 verzija


--- start 4.1.5 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.pkonto
(
  id character(7),
  tip character(1)
);

DROP INDEX IF EXISTS pkonto_id1;
DROP INDEX IF EXISTS pkonto_id2;
CREATE INDEX pkonto_id1 ON fmk.pkonto(id);
CREATE INDEX pkonto_id2 ON fmk.pkonto(tip);
GRANT ALL ON TABLE fmk.pkonto TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_pkonto
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

DROP INDEX IF EXISTS semaphores_pkonto_user_code_idx;
CREATE INDEX on fmk.semaphores_pkonto(user_code);
GRANT ALL ON TABLE fmk.semaphores_pkonto TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40105);

--- end 4.1.5 verzija


--- start 4.1.7 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.vrstep
(
  id character(2),
  naz character(20)
);

DROP INDEX IF EXISTS vrstep_id1;
DROP INDEX IF EXISTS vrstep_id2;
CREATE INDEX vrstep_id1 ON fmk.vrstep(id);
CREATE INDEX vrstep_id2 ON fmk.vrstep(naz);
GRANT ALL ON TABLE fmk.vrstep TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_vrstep
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

DROP INDEX IF EXISTS semaphores_vrstep_user_code_idx;
CREATE INDEX on fmk.semaphores_vrstep(user_code);
GRANT ALL ON TABLE fmk.semaphores_vrstep TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40107);

--- end 4.1.7 verzija


--- start 4.1.8 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.vrprim
(
  id character(4),
  naz varchar(55),
  pom_txt varchar(100),
  idkonto character(7),
  idpartner character(6),
  nacin_pl character(1),
  racun character(16),
  dobav character(1)
);

DROP INDEX IF EXISTS vrprim_id;
DROP INDEX IF EXISTS vrprim_naz;
DROP INDEX IF EXISTS vrprim_idkonto;
CREATE INDEX vrprim_id ON fmk.vrprim(id);
CREATE INDEX vrprim_naz ON fmk.vrprim(naz);
CREATE INDEX vrprim_idkonto ON fmk.vrprim(idkonto, idpartner);
GRANT ALL ON TABLE fmk.vrprim TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_vrprim
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

DROP INDEX IF EXISTS semaphores_vrprim_user_code_idx;
CREATE INDEX on fmk.semaphores_vrprim(user_code);
GRANT ALL ON TABLE fmk.semaphores_vrprim TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.ldvirm
(
  id character(4),
  naz varchar(50),
  formula varchar(200)
);

DROP INDEX IF EXISTS ldvirm_id;
CREATE INDEX ldvirm_id ON fmk.ldvirm(id);
GRANT ALL ON TABLE fmk.ldvirm TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_ldvirm
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

DROP INDEX IF EXISTS semaphores_ldvirm_user_code_idx;
CREATE INDEX on fmk.semaphores_ldvirm(user_code);
GRANT ALL ON TABLE fmk.semaphores_ldvirm TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.kalvir
(
  id character(4),
  naz varchar(20),
  formula varchar(200),
  pnabr character(10)
);

DROP INDEX IF EXISTS kalvir_id;
CREATE INDEX kalvir_id ON fmk.kalvir(id);
GRANT ALL ON TABLE fmk.kalvir TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kalvir
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

DROP INDEX IF EXISTS semaphores_kalvir_user_code_idx;
CREATE INDEX on fmk.semaphores_kalvir(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalvir TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.jprih
(
  id character(6),
  idn0 character(1),
  idkan character(2),
  idops character(3),
  naz varchar(40),
  racun character(16),
  budzorg character(7)
);

DROP INDEX IF EXISTS jprih_id;
DROP INDEX IF EXISTS jprih_naz;
CREATE INDEX jprih_id ON fmk.jprih(id, idops, idkan, idn0, racun);
CREATE INDEX jprih_naz ON fmk.jprih(naz);
GRANT ALL ON TABLE fmk.jprih TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_jprih
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

DROP INDEX IF EXISTS semaphores_jprih_user_code_idx;
CREATE INDEX on fmk.semaphores_jprih(user_code);
GRANT ALL ON TABLE fmk.semaphores_jprih TO xtrole;



$$)
WHERE (u2.knowhow_package_version('fmk') < 40108);

--- end 4.1.8 verzija

--- start 4.1.9 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.sii_sii
(
  id character(10),
  match_code character(10),
  naz character(30),
  idrj character(4),
  datum date,
  datotp date,
  opisotp character(30),
  idkonto character(7),
  kolicina numeric(6,1),
  jmj character(3),
  idam character(8),
  idrev character(4),
  nabvr numeric(18,2),
  otpvr numeric(18,2),
  amd numeric(18,2),
  amp numeric(18,2),
  revd numeric(18,2),
  revp numeric(18,2),
  k1 character(4),
  k2 character(1),
  k3 character(2),
  opis character(25),
  brsoba character(6),
  idpartner character(6)
);

DROP INDEX IF EXISTS sii_sii_id1;
CREATE INDEX sii_sii_id1 ON fmk.sii_sii(id);
GRANT ALL ON TABLE fmk.sii_sii TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.sii_promj
(
  id character(10),
  match_code character(10),
  opis character(30),
  datum date,
  tip character(2),
  nabvr numeric(18,2),
  otpvr numeric(18,2),
  amd numeric(18,2),
  amp numeric(18,2),
  revd numeric(18,2),
  revp numeric(18,2)
);

DROP INDEX IF EXISTS sii_promj_id1;
CREATE INDEX sii_promj_id1 ON fmk.sii_promj(id, datum);
GRANT ALL ON TABLE fmk.sii_promj TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_sii_sii
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

DROP INDEX IF EXISTS semaphores_sii_sii_user_code_idx;
CREATE INDEX on fmk.semaphores_sii_sii(user_code);
GRANT ALL ON TABLE fmk.semaphores_sii_sii TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_sii_promj
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

DROP INDEX IF EXISTS semaphores_sii_promj_user_code_idx;
CREATE INDEX on fmk.semaphores_sii_promj(user_code);
GRANT ALL ON TABLE fmk.semaphores_sii_promj TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 40109);

--- end 4.1.9 verzija


--- start 4.2.0 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.kalk_doks2
(
  idfirma character(2),
  idvd character(2),
  brdok character(8),
  datval date,
  opis varchar(20),
  k1 character(1),
  k2 character(2),
  k3 character(3)
);

DROP INDEX IF EXISTS kalk_doks2_id1;
CREATE INDEX kalk_doks2_id1 ON fmk.kalk_doks2(idfirma, idvd, brdok);
GRANT ALL ON TABLE fmk.kalk_doks2 TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_kalk_doks2
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

DROP INDEX IF EXISTS semaphores_kalk_doks2_user_code_idx;
CREATE INDEX on fmk.semaphores_kalk_doks2(user_code);
GRANT ALL ON TABLE fmk.semaphores_kalk_doks2 TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40200);

--- end 4.2.0 verzija


--- start 4.2.1 verzija

SELECT u2.execute($$

ALTER TABLE fmk.fakt_fakt ADD COLUMN fisc_st numeric(10,0);
ALTER TABLE fmk.fakt_doks ADD COLUMN fisc_st numeric(10,0);

$$)
WHERE (u2.knowhow_package_version('fmk') < 40201);

--- end 4.2.1 verzija

--- start 4.2.2 verzija

SELECT u2.execute($$

ALTER TABLE fmk.fakt_fakt DROP COLUMN fisc_st;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40202);

--- end 4.2.2 verzija


--- start 4.2.3 verzija

SELECT u2.execute($$

ALTER TABLE fmk.ld_ld ADD COLUMN radsat numeric(10, 0);
ALTER TABLE fmk.ld_ld ALTER COLUMN obr SET DEFAULT '1';

ALTER TABLE fmk.ld_parobr ADD COLUMN obr character(1);
ALTER TABLE fmk.ld_parobr ALTER COLUMN obr SET DEFAULT '1';

$$)
WHERE (u2.knowhow_package_version('fmk') < 40203);

--- end 4.2.3 verzija

