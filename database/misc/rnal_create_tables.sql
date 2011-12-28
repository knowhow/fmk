---- start verzija 4.0.7

SELECT u2.execute($$

-- kreiranje RNAL tabela
-- http://redmine.bring.out.ba/issues/25915

-- rnal/docs

CREATE TABLE fmk.rnal_docs
(
  doc_no numeric(10,0),
  doc_date date,
  doc_dvr_da date,
  doc_dvr_ti character(8),
  doc_ship_p character(200),
  cust_id numeric(10,0),
  cont_id numeric(10,0),
  cont_add_d character(200),
  doc_pay_id numeric(4,0),
  doc_paid character(1),
  doc_pay_de character(100),
  doc_priori numeric(4,0),
  doc_desc character(200),
  doc_status numeric(2,0),
  operater_i numeric(3,0),
  doc_sh_des character(100),
  doc_time character(8),
  doc_in_fmk numeric(1,0),
  obj_id numeric(10,0),
  fmk_doc character(150),
  doc_llog numeric(10,0),
  PRIMARY KEY ( doc_no )
);

DROP INDEX IF EXISTS fmk.rnal_docs_id1;
DROP INDEX IF EXISTS fmk.rnal_docs_id2;
DROP INDEX IF EXISTS fmk.rnal_docs_id3;
DROP INDEX IF EXISTS fmk.rnal_docs_idA;
DROP INDEX IF EXISTS fmk.rnal_docs_idD1;
DROP INDEX IF EXISTS fmk.rnal_docs_idD2;
CREATE INDEX fmk.rnal_docs_id1 ON fmk.rnal_docs(doc_no);
CREATE INDEX fmk.rnal_docs_id2 ON fmk.rnal_docs(doc_priori, doc_date, doc_no);
CREATE INDEX fmk.rnal_docs_id3 ON fmk.rnal_docs(doc_priori, doc_dvd_da, doc_no);
CREATE INDEX fmk.rnal_docs_idA ON fmk.rnal_docs(doc_status, doc_no);
CREATE INDEX fmk.rnal_docs_idD1 ON fmk.rnal_docs(doc_date, doc_no);
CREATE INDEX fmk.rnal_docs_idD2 ON fmk.rnal_docs(doc_dvd_date, doc_no);
GRANT ALL ON TABLE fmk.rnal_docs TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_docs
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

DROP INDEX IF EXISTS semaphores_rnal_docs_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_docs(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_docs TO xtrole;

-- rnal/doc_it

CREATE TABLE fmk.rnal_doc_it
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  art_id numeric(10,0),
  doc_it_wid numeric(15,5),
  doc_it_hei numeric(15,5),
  doc_it_qtt numeric(15,5),
  doc_it_alt numeric(15,5),
  doc_acity character(50),
  doc_it_sch character(1),
  doc_it_des character(150),
  doc_it_typ character(1),
  doc_it_w2 numeric(15,5),
  doc_it_h2 numeric(15,5),
  doc_it_pos character(20),
  PRIMARY KEY ( doc_no, doc_it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_it_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_it_id2;
DROP INDEX IF EXISTS fmk.rnal_doc_it_id3;
CREATE INDEX fmk.rnal_doc_it_id1 ON fmk.rnal_doc_it(doc_no, doc_it_no, art_id);
CREATE INDEX fmk.rnal_doc_it_id2 ON fmk.rnal_doc_it(art_id, doc_no, doc_it_no);
CREATE INDEX fmk.rnal_doc_it_id3 ON fmk.rnal_doc_it(doc_no, art_id);
GRANT ALL ON TABLE fmk.rnal_doc_it TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_it
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

DROP INDEX IF EXISTS semaphores_rnal_doc_it_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_it(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_it TO xtrole;


-- rnal/doc_it2

CREATE TABLE fmk.rnal_doc_it2
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  it_no numeric(4,0),
  art_id character(10),
  doc_it_qtt numeric(15,5),
  doc_it_q2 numeric(15,5),
  doc_it_pri numeric(15,5),
  sh_desc character(100),
  desc character(200),
  PRIMARY KEY ( doc_no, doc_it_no, it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_it2_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_it2_id2;
DROP INDEX IF EXISTS fmk.rnal_doc_it2_id3;
CREATE INDEX fmk.rnal_doc_it2_id1 ON fmk.rnal_doc_it2(doc_no, doc_it_no, it_no);
CREATE INDEX fmk.rnal_doc_it2_id2 ON fmk.rnal_doc_it2(art_id, doc_no, doc_it_no);
CREATE INDEX fmk.rnal_doc_it2_id3 ON fmk.rnal_doc_it2(doc_no, art_id);
GRANT ALL ON TABLE fmk.rnal_doc_it2 TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_it2
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

DROP INDEX IF EXISTS semaphores_rnal_doc_it2_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_it2(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_it2 TO xtrole;

-- rnal/doc_ops

CREATE TABLE fmk.rnal_doc_ops
(
  doc_no numeric(10,0),
  doc_it_no numeric(4,0),
  doc_it_el_ numeric(10,0),
  doc_op_no numeric(4,0),
  aop_id numeric(10,0),
  aop_att_id numeric(10,0),
  doc_op_des character(150),
  aop_value character(150),
  PRIMARY KEY ( doc_no, doc_it_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_ops_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_ops_id2;
CREATE INDEX fmk.rnal_doc_ops_id1 ON fmk.rnal_doc_ops(doc_no, doc_it_no, doc_op_no);
CREATE INDEX fmk.rnal_doc_ops_id2 ON fmk.rnal_doc_ops(doc_no, doc_it_no, doc_it_el_);
GRANT ALL ON TABLE fmk.rnal_doc_ops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_ops
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

DROP INDEX IF EXISTS semaphores_rnal_doc_ops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_ops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_ops TO xtrole;

-- rnal/doc_log

CREATE TABLE fmk.rnal_doc_log
(
  doc_no numeric(10,0),
  doc_log_no numeric(10,0),
  doc_log_da date,
  doc_log_ti character(8),
  operater_i numeric(3,0),
  doc_log_ty character(3),
  doc_log_de character(100),
  PRIMARY KEY ( doc_no, doc_log_no )
);

DROP INDEX IF EXISTS fmk.rnal_doc_log_id1;
DROP INDEX IF EXISTS fmk.rnal_doc_log_id2;
CREATE INDEX fmk.rnal_doc_log_id1 ON fmk.rnal_doc_log(doc_no, doc_log_no, doc_log_da, doc_log_ti);
CREATE INDEX fmk.rnal_doc_log_id2 ON fmk.rnal_doc_log(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_doc_log TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_log
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

DROP INDEX IF EXISTS semaphores_rnal_doc_log_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_log(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_log TO xtrole;

-- rnal/doc_lit

CREATE TABLE fmk.rnal_doc_lit
(
  doc_no numeric(10,0),
  doc_log_no numeric(10,0),
  doc_lit_no numeric(4,0),
  doc_lit_ac character(1),
  art_id numeric(10,0),
  char_1 character(100),
  char_2 character(100),
  char_3 character(100),
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
CREATE INDEX fmk.rnal_doc_lit_id1 ON fmk.rnal_doc_lit(doc_no, doc_log_no, doc_lit_no);
GRANT ALL ON TABLE fmk.rnal_doc_lit TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_doc_lit
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

DROP INDEX IF EXISTS semaphores_rnal_doc_lit_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_doc_lit(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_doc_lit TO xtrole;

-- rnal/articles

CREATE TABLE fmk.rnal_articles
(
  art_id numeric(10,0),
  art_desc character(100),
  art_full_d character(250),
  art_lab_de character(200),
  match_code character(10),
  PRIMARY KEY ( art_id )
);

DROP INDEX IF EXISTS fmk.rnal_articles_id1;
DROP INDEX IF EXISTS fmk.rnal_articles_id2;
CREATE INDEX fmk.rnal_articles_id1 ON fmk.rnal_articles(art_no);
CREATE INDEX fmk.rnal_articles_id2 ON fmk.rnal_articles(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_articles TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_articles
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

DROP INDEX IF EXISTS semaphores_rnal_articles_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_articles(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_articles TO xtrole;

-- rnal/elements

CREATE TABLE fmk.rnal_elements
(
  el_id numeric(10,0),
  el_no numeric(4,0),
  art_id numeric(10,0),
  e_gr_id numeric(10,0),
  PRIMARY KEY ( el_id, el_no, art_id )
);

DROP INDEX IF EXISTS fmk.rnal_elements_id1;
DROP INDEX IF EXISTS fmk.rnal_elements_id2;
CREATE INDEX fmk.rnal_elements_id1 ON fmk.rnal_elements(art_no);
CREATE INDEX fmk.rnal_elements_id2 ON fmk.rnal_elements(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_elements TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_elements
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

DROP INDEX IF EXISTS semaphores_rnal_elements_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_elements(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_elements TO xtrole;

-- rnal/e_att

CREATE TABLE fmk.rnal_e_att
(
  el_att_id numeric(10,0),
  el_id numeric(10,0),
  e_gr_at_id numeric(10,0),
  e_gr_vl_id numeric(10,0),
  PRIMARY KEY ( el_att_id, el_id, e_gr_at_id, e_gr_vl_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_att_id1;
DROP INDEX IF EXISTS fmk.rnal_e_att_id2;
CREATE INDEX fmk.rnal_e_att_id1 ON fmk.rnal_e_att(art_no);
CREATE INDEX fmk.rnal_e_att_id2 ON fmk.rnal_e_att(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_e_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_att
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

DROP INDEX IF EXISTS semaphores_rnal_e_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_att TO xtrole;

-- rnal/e_aops

CREATE TABLE fmk.rnal_e_aops
(
  el_op_id numeric(10,0),
  el_id numeric(10,0),
  aop_id numeric(10,0),
  aop_att_id numeric(10,0),
  PRIMARY KEY ( el_op_id, el_id, aop_id, aop_att_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_aops_id1;
DROP INDEX IF EXISTS fmk.rnal_e_aops_id2;
CREATE INDEX fmk.rnal_e_aops_id1 ON fmk.rnal_e_aops(art_no);
CREATE INDEX fmk.rnal_e_aops_id2 ON fmk.rnal_e_aops(doc_no, doc_log_ty, doc_log_no);
GRANT ALL ON TABLE fmk.rnal_e_aops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_aops
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

DROP INDEX IF EXISTS semaphores_rnal_e_aops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_aops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_aops TO xtrole;

-- rnal/e_groups

CREATE TABLE fmk.rnal_e_groups
(
  e_gr_id numeric(10,0),
  e_gr_desc character(100),
  e_gr_full_ character(100),
  match_code character(10),
  PRIMARY KEY ( e_gr_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_groups_id1;
DROP INDEX IF EXISTS fmk.rnal_e_groups_id2;
CREATE INDEX fmk.rnal_e_groups_id1 ON fmk.rnal_e_groups(e_gr_id);
CREATE INDEX fmk.rnal_e_groups_id2 ON fmk.rnal_e_groups(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_e_groups TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_groups
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

DROP INDEX IF EXISTS semaphores_rnal_e_groups_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_groups(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_groups TO xtrole;

-- rnal/e_gr_att

CREATE TABLE fmk.rnal_e_gr_att
(
  e_gr_at_id numeric(10,0),
  e_gr_id numeric(10,0),
  e_gr_at_de character(100),
  e_gr_at_re character(1),
  in_art_des character(1),
  e_gr_at_jo character(20),
  match_code character(10),
  PRIMARY KEY ( e_gr_at_id, e_gr_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_gr_att_id1;
DROP INDEX IF EXISTS fmk.rnal_e_gr_att_id2;
CREATE INDEX fmk.rnal_e_gr_att_id1 ON fmk.rnal_e_gr_att(e_gr_id);
CREATE INDEX fmk.rnal_e_gr_att_id2 ON fmk.rnal_e_gr_att(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_e_gr_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_gr_att
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

DROP INDEX IF EXISTS semaphores_rnal_e_gr_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_gr_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_gr_att TO xtrole;


-- rnal/e_gr_val

CREATE TABLE fmk.rnal_e_gr_val
(
  e_gr_vl_id numeric(10,0),
  e_gr_at_id numeric(10,0),
  e_gr_vl_de character(100),
  e_gr_vl_fu character(100),
  match_code character(10),
  PRIMARY KEY ( e_gr_vl_id, e_gr_at_id )
);

DROP INDEX IF EXISTS fmk.rnal_e_gr_val_id1;
DROP INDEX IF EXISTS fmk.rnal_e_gr_val_id2;
CREATE INDEX fmk.rnal_e_gr_val_id1 ON fmk.rnal_e_gr_val(e_gr_id);
CREATE INDEX fmk.rnal_e_gr_val_id2 ON fmk.rnal_e_gr_val(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_e_gr_val TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_e_gr_val
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

DROP INDEX IF EXISTS semaphores_rnal_e_gr_val_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_e_gr_val(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_e_gr_val TO xtrole;

-- rnal/aops

CREATE TABLE fmk.rnal_aops
(
  aop_id numeric(10,0),
  aop_desc character(100),
  aop_full_d character(100),
  in_art_des character(1),
  aop_joker character(20),
  aop_unit character(10),
  match_code character(10),
  PRIMARY KEY ( aop_id )
);

DROP INDEX IF EXISTS fmk.rnal_aops_id1;
DROP INDEX IF EXISTS fmk.rnal_aops_id2;
CREATE INDEX fmk.rnal_aops_id1 ON fmk.rnal_aops(e_gr_id);
CREATE INDEX fmk.rnal_aops_id2 ON fmk.rnal_aops(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_aops TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_aops
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

DROP INDEX IF EXISTS semaphores_rnal_aops_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_aops(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_aops TO xtrole;

-- rnal/aops_att

CREATE TABLE fmk.rnal_aops_att
(
  aop_att_id numeric(10,0),
  aop_id numeric(10,0),
  aop_att_de character(100),
  aop_att_fu character(100),
  in_art_des character(1),
  match_code character(10),
  PRIMARY KEY ( aop_att_id, aop_id )
);

DROP INDEX IF EXISTS fmk.rnal_aops_att_id1;
DROP INDEX IF EXISTS fmk.rnal_aops_att_id2;
CREATE INDEX fmk.rnal_aops_att_id1 ON fmk.rnal_aops_att(e_gr_id);
CREATE INDEX fmk.rnal_aops_att_id2 ON fmk.rnal_aops_att(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_aops_att TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_aops_att
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

DROP INDEX IF EXISTS semaphores_rnal_aops_att_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_aops_att(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_aops_att TO xtrole;


-- rnal/customs

CREATE TABLE fmk.rnal_customs
(
  cust_id numeric(10,0),
  cust_desc character(250),
  cust_addr character(50),
  cust_tel character(100),
  cust_ident character(13),
  match_code character(10),
  PRIMARY KEY ( cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_customs_id1;
DROP INDEX IF EXISTS fmk.rnal_customs_id2;
CREATE INDEX fmk.rnal_customs_id1 ON fmk.rnal_customs(e_gr_id);
CREATE INDEX fmk.rnal_customs_id2 ON fmk.rnal_customs(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_customs TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_customs
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

DROP INDEX IF EXISTS semaphores_rnal_customs_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_customs(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_customs TO xtrole;

-- rnal/contacts

CREATE TABLE fmk.rnal_contacts
(
  cont_id numeric(10,0),
  cust_id numeric(10,0),
  cont_desc character(150),
  cont_tel character(100),
  cont_add_d character(250),
  match_code character(10),
  PRIMARY KEY ( cont_id, cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_contacts_id1;
DROP INDEX IF EXISTS fmk.rnal_contacts_id2;
CREATE INDEX fmk.rnal_contacts_id1 ON fmk.rnal_contacts(e_gr_id);
CREATE INDEX fmk.rnal_contacts_id2 ON fmk.rnal_contacts(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_contacts TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_contacts
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

DROP INDEX IF EXISTS semaphores_rnal_contacts_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_contacts(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_contacts TO xtrole;


-- rnal/objects

CREATE TABLE fmk.rnal_objects
(
  obj_id numeric(10,0),
  cust_id numeric(10,0),
  obj_desc character(150),
  match_code character(10),
  PRIMARY KEY ( obj_id, cust_id )
);

DROP INDEX IF EXISTS fmk.rnal_objects_id1;
DROP INDEX IF EXISTS fmk.rnal_objects_id2;
CREATE INDEX fmk.rnal_objects_id1 ON fmk.rnal_objects(e_gr_id);
CREATE INDEX fmk.rnal_objects_id2 ON fmk.rnal_objects(e_gr_desc);
GRANT ALL ON TABLE fmk.rnal_objects TO xtrole;

CREATE TABLE IF NOT EXISTS fmk.semaphores_rnal_objects
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

DROP INDEX IF EXISTS semaphores_rnal_objects_user_code_idx;
CREATE INDEX on fmk.semaphores_rnal_objects(user_code);
GRANT ALL ON TABLE fmk.semaphores_rnal_objects TO xtrole;













$$)
WHERE (u2.knowhow_package_version('fmk') <  40007);

---- verzija 4.0.7
