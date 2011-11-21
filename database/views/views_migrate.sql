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

CREATE OR REPLACE VIEW v_fin_suban_list_all AS
	SELECT * FROM fmk.fin_suban; 

CREATE OR REPLACE VIEW v_fin_sint_list_all AS
	SELECT * FROM fmk.fin_sint;

CREATE OR REPLACE VIEW v_fin_nalog_list_all AS
	SELECT * FROM fmk.fin_nalog;

CREATE OR REPLACE VIEW v_fin_anal_list_all AS
	SELECT * FROM fmk.fin_anal; 



$$)
WHERE (u2.knowhow_package_version('fmk') <= 20100);
