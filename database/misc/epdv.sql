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


-- ver 2.0.0

SELECT u2.execute($$

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

$$)
WHERE (u2.knowhow_package_version('fmk') < 20000);


--- end 2.0.0 verzija


--- start 4.4.0 verzija

SELECT u2.execute($$

-- epdv_pdv
ALTER TABLE fmk.epdv_pdv ADD COLUMN i_opor     numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN i_u_pdv_41 numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN i_u_pdv_43 numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN i_izvoz    numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN i_neop     numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN u_nab_21   numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN u_nab_23   numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN u_uvoz     numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN u_pdv_41   numeric(18,2);
ALTER TABLE fmk.epdv_pdv ADD COLUMN u_pdv_43   numeric(18,2);

ALTER TABLE fmk.epdv_pdv RENAME COLUMN i_pdv_nr_1 to i_pdv_nr1;
ALTER TABLE fmk.epdv_pdv RENAME COLUMN i_pdv_nr_2 to i_pdv_nr2;
ALTER TABLE fmk.epdv_pdv RENAME COLUMN i_pdv_nr_3 to i_pdv_nr3;
ALTER TABLE fmk.epdv_pdv RENAME COLUMN i_pdv_nr_4 to i_pdv_nr4;


-- edv_kuf
ALTER TABLE fmk.epdv_kuf ADD COLUMN p_kat    char(1);
ALTER TABLE fmk.epdv_kuf ADD COLUMN p_kat_2  char(1);

-- edv_kif
ALTER TABLE fmk.epdv_kif ADD COLUMN p_kat    char(1);
ALTER TABLE fmk.epdv_kif ADD COLUMN p_kat_2  char(1);


$$)
WHERE (u2.knowhow_package_version('fmk') < 40401);

--- end 4.4.0 verzija
