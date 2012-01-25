---- start verzija 4.0.9

SELECT u2.execute($$

-- kreiranje RNAL tabela
-- http://redmine.bring.out.ba/issues/25915

-- rnal/docs

CREATE TABLE IF NOT EXISTS fmk.rnal_docs
(
  doc_no numeric(10,0),
  doc_date date,
  doc_dvr_da date,
  doc_dvr_ti varchar(8),
  doc_ship_p text,
  cust_id numeric(10,0),
  cont_id numeric(10,0),
  cont_add_d text,
  doc_pay_id numeric(4,0),
  doc_paid varchar(1),
  doc_pay_de text,
  doc_priori numeric(4,0),
  doc_desc text,
  doc_status numeric(2,0),
  operater_i numeric(3,0),
  doc_sh_des text,
  doc_time varchar(8),
  doc_in_fmk numeric(1,0),
  obj_id numeric(10,0),
  fmk_doc text,
  doc_llog numeric(10,0),
  PRIMARY KEY ( doc_no )
);

DROP INDEX IF EXISTS fmk.rnal_docs_id1;
DROP INDEX IF EXISTS fmk.rnal_docs_id2;
DROP INDEX IF EXISTS fmk.rnal_docs_id3;
DROP INDEX IF EXISTS fmk.rnal_docs_idA;
DROP INDEX IF EXISTS fmk.rnal_docs_idD1;
DROP INDEX IF EXISTS fmk.rnal_docs_idD2;
CREATE INDEX rnal_docs_id1 ON fmk.rnal_docs(doc_no);
CREATE INDEX rnal_docs_id2 ON fmk.rnal_docs(doc_priori, doc_date, doc_no);
CREATE INDEX rnal_docs_id3 ON fmk.rnal_docs(doc_priori, doc_dvr_da, doc_no);
CREATE INDEX rnal_docs_idA ON fmk.rnal_docs(doc_status, doc_no);
CREATE INDEX rnal_docs_idD1 ON fmk.rnal_docs(doc_date, doc_no);
CREATE INDEX rnal_docs_idD2 ON fmk.rnal_docs(doc_dvr_da, doc_no);
GRANT ALL ON TABLE fmk.rnal_docs TO xtrole;

-- rnal/doc_it

CREATE TABLE IF NOT EXISTS fmk.rnal_doc_it
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  art_id numeric(10,0),
  doc_it_wid numeric(15,5),
  doc_it_hei numeric(15,5),
  doc_it_qtt numeric(15,5),
  doc_it_alt numeric(15,5),
  doc_acity varchar(50),
  doc_it_sch varchar(1),
  doc_it_des text,
  doc_it_typ varchar(1),
  doc_it_w2 numeric(15,5),
  doc_it_h2 numeric(15,5),
  doc_it_pos varchar(20),
  PRIMARY KEY ( doc_no, doc_it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_it_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_it_id2;
DROP INDEX IF EXISTS fmk.rnal_doc_it_id3;
CREATE INDEX rnal_doc_it_id1 ON fmk.rnal_doc_it(doc_no, doc_it_no, art_id);
CREATE INDEX rnal_doc_it_id2 ON fmk.rnal_doc_it(art_id, doc_no, doc_it_no);
CREATE INDEX rnal_doc_it_id3 ON fmk.rnal_doc_it(doc_no, art_id);
GRANT ALL ON TABLE fmk.rnal_doc_it TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_it
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_doc_it_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_it(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_it TO xtrole;


-- rnal/doc_it2

CREATE TABLE IF NOT EXISTS fmk.rnal_doc_it2
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  it_no numeric(4,0),
  art_id varchar(10),
  doc_it_qtt numeric(15,5),
  doc_it_q2 numeric(15,5),
  doc_it_pri numeric(15,5),
  sh_desc text,
  descr text,
  PRIMARY KEY ( doc_no, doc_it_no, it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_it2_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_it2_id2;
DROP INDEX IF EXISTS fmk.rnal_doc_it2_id3;
CREATE INDEX rnal_doc_it2_id1 ON fmk.rnal_doc_it2(doc_no, doc_it_no, it_no);
CREATE INDEX rnal_doc_it2_id2 ON fmk.rnal_doc_it2(art_id, doc_no, doc_it_no);
CREATE INDEX rnal_doc_it2_id3 ON fmk.rnal_doc_it2(doc_no, art_id);
GRANT ALL ON TABLE fmk.rnal_doc_it2 TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_it2
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_doc_it2_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_it2(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_it2 TO xtrole;

-- rnal/doc_ops

CREATE TABLE IF NOT EXISTS fmk.rnal_doc_ops
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  doc_it_el_ numeric(10,0),
  doc_op_no numeric(4,0),
  aop_id numeric(10,0),
  aop_att_id numeric(10,0),
  doc_op_des text,
  aop_value text,
  PRIMARY KEY ( doc_no, doc_it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_ops_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_ops_id2;
CREATE INDEX rnal_doc_ops_id1 ON fmk.rnal_doc_ops(doc_no, doc_it_no, doc_op_no);
CREATE INDEX rnal_doc_ops_id2 ON fmk.rnal_doc_ops(doc_no, doc_it_no, doc_it_el_);
GRANT ALL ON TABLE fmk.rnal_doc_ops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_ops
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_doc_ops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_ops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_ops TO xtrole;

-- rnal/doc_log

CREATE TABLE IF NOT EXISTS fmk.rnal_doc_log
(
  doc_no numeric(10,0),
  doc_log_no numeric(10,0),
  doc_log_da date,
  doc_log_ti varchar(8),
  operater_i numeric(3,0),
  doc_log_ty varchar(3),
  doc_log_de text,
  PRIMARY KEY ( doc_no, doc_log_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_log_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_log_id2;
CREATE INDEX rnal_doc_log_id1 ON fmk.rnal_doc_log(doc_no, doc_log_no, doc_log_da, doc_log_ti);
CREATE INDEX rnal_doc_log_id2 ON fmk.rnal_doc_log(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_doc_log TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_log
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_doc_log_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_log(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_log TO xtrole;

-- rnal/doc_lit

CREATE TABLE IF NOT EXISTS fmk.rnal_doc_lit
(
  doc_no numeric(10,0),
  doc_log_no numeric(10,0),
  doc_lit_no numeric(4,0),
  doc_lit_ac varchar(1),
  art_id numeric(10,0),
  char_1 text,
  char_2 text,
  char_3 text,
  num_1 numeric(15,5),
  num_2 numeric(15,5),
  num_3 numeric(15,5),
  int_1 numeric(10,0),
  int_2 numeric(10,0),
  int_3 numeric(10,0),
  int_4 numeric(10,0),
  int_5 numeric(10,0),
  date_1 date,
  date_2 date,
  date_3 date,
  PRIMARY KEY ( doc_no, doc_log_no, doc_lit_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_lit_id1;
CREATE INDEX rnal_doc_lit_id1 ON fmk.rnal_doc_lit(doc_no, doc_log_no, doc_lit_no);
GRANT ALL ON TABLE fmk.rnal_doc_lit TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_lit
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_doc_lit_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_lit(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_lit TO xtrole;

-- rnal/articles

CREATE TABLE IF NOT EXISTS fmk.rnal_articles
(
  art_id numeric(10,0),
  art_desc text,
  art_full_d text,
  art_lab_de text,
  match_code varchar(10),
  PRIMARY KEY ( art_id )
);

DROP INDEX IF EXISTS fmk.rnal_articles_id1;
DROP INDEX IF EXISTS fmk.rnal_articles_id2;
CREATE INDEX rnal_articles_id1 ON fmk.rnal_articles(art_id);
CREATE INDEX rnal_articles_id2 ON fmk.rnal_articles(art_desc);
GRANT ALL ON TABLE fmk.rnal_articles TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_articles
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_articles_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_articles(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_articles TO xtrole;

-- rnal/elements

CREATE TABLE IF NOT EXISTS fmk.rnal_elements
(
  el_id numeric(10,0),
  el_no numeric(4,0),
  art_id numeric(10,0),
  e_gr_id numeric(10,0),
  PRIMARY KEY ( el_id, el_no, art_id )
);

DROP INDEX IF EXISTS fmk.rnal_elements_id1;
DROP INDEX IF EXISTS fmk.rnal_elements_id2;
CREATE INDEX rnal_elements_id1 ON fmk.rnal_elements(art_id, el_no, el_id);
CREATE INDEX rnal_elements_id2 ON fmk.rnal_elements(el_id);
GRANT ALL ON TABLE fmk.rnal_elements TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_elements
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_elements_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_elements(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_elements TO xtrole;

-- rnal/e_att

CREATE TABLE IF NOT EXISTS fmk.rnal_e_att
(
  el_att_id numeric(10,0),
  el_id numeric(10,0),
  e_gr_at_id numeric(10,0),
  e_gr_vl_id numeric(10,0),
  PRIMARY KEY ( el_att_id, el_id, e_gr_at_id, e_gr_vl_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_att_id1;
DROP INDEX IF EXISTS fmk.rnal_e_att_id2;
CREATE INDEX rnal_e_att_id1 ON fmk.rnal_e_att(el_id, el_att_id);
CREATE INDEX rnal_e_att_id2 ON fmk.rnal_e_att(el_att_id);
GRANT ALL ON TABLE fmk.rnal_e_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_att
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_e_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_att TO xtrole;

-- rnal/e_aops

CREATE TABLE IF NOT EXISTS fmk.rnal_e_aops
(
  el_op_id numeric(10,0),
  el_id numeric(10,0),
  aop_id numeric(10,0),
  aop_att_id numeric(10,0),
  PRIMARY KEY ( el_op_id, el_id, aop_id, aop_att_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_aops_id1;
DROP INDEX IF EXISTS fmk.rnal_e_aops_id2;
CREATE INDEX rnal_e_aops_id1 ON fmk.rnal_e_aops(el_id, el_op_id);
CREATE INDEX rnal_e_aops_id2 ON fmk.rnal_e_aops(el_op_id);
GRANT ALL ON TABLE fmk.rnal_e_aops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_aops
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_e_aops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_aops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_aops TO xtrole;

-- rnal/e_groups

CREATE TABLE IF NOT EXISTS fmk.rnal_e_groups
(
  e_gr_id numeric(10,0),
  e_gr_desc text,
  e_gr_full_ text,
  match_code varchar(10),
  PRIMARY KEY ( e_gr_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_groups_id1;
DROP INDEX IF EXISTS fmk.rnal_e_groups_id2;
CREATE INDEX rnal_e_groups_id1 ON fmk.rnal_e_groups(e_gr_id);
CREATE INDEX rnal_e_groups_id2 ON fmk.rnal_e_groups(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_e_groups TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_groups
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_e_groups_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_groups(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_groups TO xtrole;

-- rnal/e_gr_att

CREATE TABLE IF NOT EXISTS fmk.rnal_e_gr_att
(
  e_gr_at_id numeric(10,0),
  e_gr_id numeric(10,0),
  e_gr_at_de text,
  e_gr_at_re varchar(1),
  in_art_des varchar(1),
  e_gr_at_jo varchar(20),
  match_code varchar(10),
  PRIMARY KEY ( e_gr_at_id, e_gr_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_gr_att_id1;
DROP INDEX IF EXISTS fmk.rnal_e_gr_att_id2;
CREATE INDEX rnal_e_gr_att_id1 ON fmk.rnal_e_gr_att(e_gr_at_id);
CREATE INDEX rnal_e_gr_att_id2 ON fmk.rnal_e_gr_att(e_gr_id, e_gr_at_re, e_gr_at_id);
GRANT ALL ON TABLE fmk.rnal_e_gr_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_gr_att
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_e_gr_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_gr_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_gr_att TO xtrole;


-- rnal/e_gr_val

CREATE TABLE IF NOT EXISTS fmk.rnal_e_gr_val
(
  e_gr_vl_id numeric(10,0),
  e_gr_at_id numeric(10,0),
  e_gr_vl_de text,
  e_gr_vl_fu text,
  match_code varchar(10),
  PRIMARY KEY ( e_gr_vl_id, e_gr_at_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_gr_val_id1;
DROP INDEX IF EXISTS fmk.rnal_e_gr_val_id2;
CREATE INDEX rnal_e_gr_val_id1 ON fmk.rnal_e_gr_val(e_gr_vl_id);
CREATE INDEX rnal_e_gr_val_id2 ON fmk.rnal_e_gr_val(e_gr_at_id, e_gr_vl_id);
GRANT ALL ON TABLE fmk.rnal_e_gr_val TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_gr_val
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_e_gr_val_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_gr_val(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_gr_val TO xtrole;

-- rnal/aops

CREATE TABLE IF NOT EXISTS fmk.rnal_aops
(
  aop_id numeric(10,0),
  aop_desc text,
  aop_full_d text,
  in_art_des varchar(1),
  aop_joker varchar(20),
  aop_unit varchar(10),
  match_code varchar(10),
  PRIMARY KEY ( aop_id )
);

DROP INDEX IF EXISTS fmk.rnal_aops_id1;
CREATE INDEX rnal_aops_id1 ON fmk.rnal_aops(aop_id);
GRANT ALL ON TABLE fmk.rnal_aops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_aops
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_aops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_aops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_aops TO xtrole;

-- rnal/aops_att

CREATE TABLE IF NOT EXISTS fmk.rnal_aops_att
(
  aop_att_id numeric(10,0),
  aop_id numeric(10,0),
  aop_att_de text,
  aop_att_fu text,
  in_art_des varchar(1),
  aop_att_jo varchar(20),
  match_code varchar(10),
  PRIMARY KEY ( aop_att_id, aop_id )
);

DROP INDEX IF EXISTS fmk.rnal_aops_att_id1;
DROP INDEX IF EXISTS fmk.rnal_aops_att_id2;
CREATE INDEX rnal_aops_att_id1 ON fmk.rnal_aops_att(aop_att_id);
CREATE INDEX rnal_aops_att_id2 ON fmk.rnal_aops_att(aop_id, aop_att_id);
GRANT ALL ON TABLE fmk.rnal_aops_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_aops_att
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_aops_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_aops_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_aops_att TO xtrole;


-- rnal/customs

CREATE TABLE IF NOT EXISTS fmk.rnal_customs
(
  cust_id numeric(10,0),
  cust_desc text,
  cust_addr varchar(50),
  cust_tel text,
  cust_ident varchar(13),
  match_code varchar(10),
  PRIMARY KEY ( cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_customs_id1;
CREATE INDEX rnal_customs_id1 ON fmk.rnal_customs(cust_id);
GRANT ALL ON TABLE fmk.rnal_customs TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_customs
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_customs_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_customs(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_customs TO xtrole;

-- rnal/contacts

CREATE TABLE IF NOT EXISTS fmk.rnal_contacts
(
  cont_id numeric(10,0),
  cust_id numeric(10,0),
  cont_desc text,
  cont_tel text,
  cont_add_d text,
  match_code varchar(10),
  PRIMARY KEY ( cont_id, cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_contacts_id1;
DROP INDEX IF EXISTS fmk.rnal_contacts_id2;
DROP INDEX IF EXISTS fmk.rnal_contacts_id3;
DROP INDEX IF EXISTS fmk.rnal_contacts_id4;
CREATE INDEX rnal_contacts_id1 ON fmk.rnal_contacts(cont_id);
CREATE INDEX rnal_contacts_id2 ON fmk.rnal_contacts(cust_id, cont_id);
CREATE INDEX rnal_contacts_id3 ON fmk.rnal_contacts(cust_id, cont_desc);
CREATE INDEX rnal_contacts_id4 ON fmk.rnal_contacts(cont_desc);
GRANT ALL ON TABLE fmk.rnal_contacts TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_contacts
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_contacts_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_contacts(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_contacts TO xtrole;


-- rnal/objects

CREATE TABLE IF NOT EXISTS fmk.rnal_objects
(
  obj_id numeric(10,0),
  cust_id numeric(10,0),
  obj_desc text,
  match_code varchar(10),
  PRIMARY KEY ( obj_id, cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_objects_id1;
DROP INDEX IF EXISTS fmk.rnal_objects_id2;
DROP INDEX IF EXISTS fmk.rnal_objects_id3;
DROP INDEX IF EXISTS fmk.rnal_objects_id4;
CREATE INDEX rnal_objects_id1 ON fmk.rnal_objects(obj_id);
CREATE INDEX rnal_objects_id2 ON fmk.rnal_objects(cust_id, obj_id);
CREATE INDEX rnal_objects_id3 ON fmk.rnal_objects(cust_id, obj_desc);
CREATE INDEX rnal_objects_id4 ON fmk.rnal_objects(obj_desc);
GRANT ALL ON TABLE fmk.rnal_objects TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_objects
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_objects_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_objects(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_objects TO xtrole;

-- rnal/ral

CREATE TABLE IF NOT EXISTS fmk.rnal_ral
(
  id numeric(5,0),
  gl_tick numeric(2,0),
  descr varchar(50),
  en_desc varchar(50),
  col_1 numeric(8,0),
  col_2 numeric(8,0),
  col_3 numeric(8,0),
  col_4 numeric(8,0),
  colp_1 numeric(12,5),
  colp_2 numeric(12,5),
  colp_3 numeric(12,5),
  colp_4 numeric(12,5),
  PRIMARY KEY ( id, gl_tick )
);

DROP INDEX IF EXISTS fmk.rnal_ral_id1;
DROP INDEX IF EXISTS fmk.rnal_ral_id2;
CREATE INDEX rnal_ral_id1 ON fmk.rnal_ral(id, gl_tick);
CREATE INDEX rnal_ral_id2 ON fmk.rnal_ral(descr);
GRANT ALL ON TABLE fmk.rnal_ral TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_ral
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_ral_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_ral(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_ral TO xtrole;


$$)
WHERE (u2.knowhow_package_version('fmk') <  40009);

---- verzija 4.0.9


---- start verzija 4.1.3

SELECT u2.execute($$

ALTER TABLE fmk.rnal_doc_it ADD COLUMN it_lab_pos character(1);

$$)
WHERE (u2.knowhow_package_version('fmk') <  40103);

---- verzija 4.1.3

---- start verzija 4.1.6

SELECT u2.execute($$

DROP TABLE IF EXISTS fmk.semaphores_rnal_docs CASCADE;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_docs
(
      user_code varchar(20) NOT NULL PRIMARY KEY,
      algorithm varchar(15) NOT NULL DEFAULT 'full',
      version bigint NOT NULL, 
      last_trans_version bigint ,
      last_trans_time timestamp DEFAULT CURRENT_TIMESTAMP,
      last_trans_user_code varchar(20),
      dat date,
      ids text[]
);

DROP INDEX IF EXISTS semaphores_rnal_docs_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_docs(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_docs TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') <  40106);

---- verzija 4.1.6

