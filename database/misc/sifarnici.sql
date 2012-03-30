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


--- start 4.3.3 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.adres
(
  id varchar(50),
  rj varchar(30),
  kontakt varchar(30),
  naz varchar(15),
  tel2 varchar(15),
  tel3 varchar(15),
  mjesto varchar(15),
  ptt character(6),
  adresa varchar(50),
  drzava varchar(22),
  ziror varchar(30),
  zirod varchar(30),
  k7 character(1),
  k8 character(2),
  k9 character(3)
);

DROP INDEX IF EXISTS adres_id1;
CREATE INDEX adres_id1 ON fmk.adres( id, naz );
GRANT ALL ON TABLE fmk.adres TO xtrole;


CREATE TABLE IF NOT EXISTS fmk.semaphores_adres
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

DROP INDEX IF EXISTS semaphores_adres_user_code_idx;
CREATE INDEX on fmk.semaphores_adres(user_code);
GRANT ALL ON TABLE fmk.semaphores_adres TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') < 40303);

--- end 4.3.3 verzija
