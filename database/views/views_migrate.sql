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
	SELECT * FROM fmk.fin_suban 

CREATE OR REPLACE VIEW v_fin_sint_list_all AS
	SELECT * FROM fmk.fin_sint 

CREATE OR REPLACE VIEW v_fin_nalog_list_all AS
	SELECT * FROM fmk.fin_nalog

CREATE OR REPLACE VIEW v_fin_anal_list_all AS
	SELECT * FROM fmk.fin_anal 


CREATE OR REPLACE VIEW fmk.v_rnal_list_effect AS
  SELECT 
  operater_descrip,
  SUM( CASE 
    WHEN doc_status = 'Otvoren' THEN 1
  END) AS otvoreni,
  SUM( CASE 
    WHEN doc_status LIKE 'Realizovan%' THEN 1
  END) AS realizovani,
  SUM( CASE 
    WHEN doc_status = 'Odbacen' THEN 1
  END) AS odbaceni
FROM fmk.v_rnal_list_docs
WHERE operater_descrip <> ''
GROUP BY operater_descrip

CREATE OR REPLACE VIEW fmk.v_rnal_list_due_date AS
SELECT 
  doc_number, 
  doc_date, 
  doc_delivery_date, 
  doc_time, 
  customer_descrip, 
  contact_descrip,
  operater_descrip
FROM fmk.v_rnal_list_docs
WHERE doc_status = 'Otvoren' AND doc_delivery_date <= current_date;

CREATE OR REPLACE VIEW v_rnal_list_docs AS
SELECT 
  rd.doc_no AS doc_number, 
  rd.doc_date AS doc_date, 
  rd.doc_time AS doc_time,
  rd.doc_dvr_da AS doc_delivery_date, 
  rd.doc_ship_p AS doc_ship_info, 
  cu.cust_desc AS customer_descrip,
  co.cont_desc AS contact_descrip,
  rd.cont_add_d AS contact_addit_descrip,
  CASE rd.doc_pay_id 
     WHEN '1' 
         THEN 'Ziralno' 
         ELSE 'Gotovina' 
  END AS doc_pay_id,
  rd.doc_paid AS doc_paid,
  rd.doc_pay_de AS doc_pay_descrip,
  rd.doc_priori AS doc_priority,
  rd.doc_sh_des AS doc_short_descrip,
  rd.doc_desc AS doc_descrip,
  CASE rd.doc_status 
     WHEN 0 THEN 'Otvoren'
     WHEN 1 THEN 'Realizovan'
     WHEN 2 THEN 'Odbacen'
     WHEN 3 THEN 'Zauzet'
     WHEN 4 THEN 'Realizovan dio'
     WHEN 5 THEN 'Realizovan nije isporucen'
  END AS doc_status,
  ob.obj_desc AS object_descrip,
  us.fullname AS operater_descrip
FROM fmk.rnal_docs rd
LEFT JOIN fmk.sif_customs cu ON rd.cust_id = cu.cust_id
LEFT JOIN fmk.sif_contacts co ON rd.cont_id = co.cont_id
LEFT JOIN fmk.sif_objects ob ON rd.obj_id = ob.obj_id
LEFT JOIN fmk.sif_users us ON rd.operater_i = us.id
ORDER BY rd.doc_no, rd.doc_date


$$)

