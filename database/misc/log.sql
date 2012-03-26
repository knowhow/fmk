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


--- start 4.3.1 verzija

SELECT u2.execute($$

CREATE TABLE IF NOT EXISTS fmk.log
(
      id BIGSERIAL PRIMARY KEY,
      user_code varchar(20) NOT NULL,
      l_time timestamp DEFAULT CURRENT_TIMESTAMP,
      msg  text NOT NULL
);

DROP   INDEX IF EXISTS fmk.log_l_time_idx;
CREATE INDEX on fmk.log(l_time);

DROP   INDEX IF EXISTS fmk.log_user_code_idx;
CREATE INDEX ON fmk.log(user_code);


GRANT ALL ON TABLE fmk.log TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') < 40301);

--- end 4.3.1 verzija


