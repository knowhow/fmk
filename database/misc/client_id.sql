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

---- start verzija 4.1.0

SELECT u2.execute($$

CREATE SEQUENCE client_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  CACHE 1;

GRANT ALL ON TABLE client_id_seq TO admin;
GRANT ALL ON TABLE client_id_seq TO xtrole;

CREATE TABLE client_id
(
  client_id integer NOT NULL DEFAULT nextval('client_id_seq'),
  host_name varchar(100),
  host_ip inet,
  os_name varchar(100),
  os_user varchar(100),
  last_login timestamp
);

GRANT ALL ON TABLE metric TO admin;
GRANT ALL ON TABLE metric TO xtrole;
COMMENT ON TABLE client_id  IS 'database client ids';

$$)
WHERE (u2.knowhow_package_version('fmk') <  040100);

---- verzija 4.1.0

