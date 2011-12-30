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
---- TODO: trenutno disable-ovano

---- start verzija 4.1.2

SELECT u2.execute($$


DROP TABLE IF EXISTS fmk.semaphores_rnal_docs CASCADE;
CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_docs
(

      b_year integer CHECK (b_year > 1990 AND b_year < 2990),
      b_season integer,
      client_id integer,
      user_code varchar(20) NOT NULL,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL DEFAULT -1, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[],
      CONSTRAINT semaphores_ops_pkey PRIMARY KEY (user_code, b_year, b_season, client_id )

);

DROP INDEX IF EXISTS semaphores_rnal_docs_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_docs(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_docs TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') <  0);
-- WHERE (u2.knowhow_package_version('fmk') <  040101);

---- verzija 4.1.2

