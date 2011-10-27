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
  idfirma character(2),
  idkonto character(7),
  idpartner character(6),
  idvn character(2),
  brnal character(8),
  rbr character(4),
  idtipdok character(2),
  brdok character(10),
  datdok date,
  datval date,
  otvst character(1),
  d_p character(1),
  iznosbhd numeric(17,2),
  iznosdem numeric(15,2),
  opis character(40),
  k1 character(1),
  k2 character(1),
  k3 character(2),
  k4 character(2),
  m1 character(1),
  m2 character(1),
  brisano character(1),
  idrj character(6),
  funk character(5),
  fond character(4)
);

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
