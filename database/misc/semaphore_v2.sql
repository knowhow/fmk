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

---- start verzija 4.1.1

SELECT u2.execute($$


ALTER table semaphores_banke ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_banke ADD COLUMN b_season int;
ALTER table semaphores_banke ADD COLUMN client_id int;

ALTER table semaphores_dest ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_dest ADD COLUMN b_season int;
ALTER table semaphores_dest ADD COLUMN client_id int;

ALTER table semaphores_dopr ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_dopr ADD COLUMN b_season int;
ALTER table semaphores_dopr ADD COLUMN client_id int;

ALTER table semaphores_epdv_kif ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_epdv_kif ADD COLUMN b_season int;
ALTER table semaphores_epdv_kif ADD COLUMN client_id int;

ALTER table semaphores_epdv_pdv ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_epdv_pdv ADD COLUMN b_season int;
ALTER table semaphores_epdv_pdv ADD COLUMN client_id int;

ALTER table semaphores_epdv_sg_kif    ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_epdv_sg_kif    ADD COLUMN b_season int;
ALTER table semaphores_epdv_sg_kif    ADD COLUMN client_id int;

ALTER table semaphores_epdv_sg_kuf    ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_epdv_sg_kuf    ADD COLUMN b_season int;
ALTER table semaphores_epdv_sg_kuf    ADD COLUMN client_id int;

ALTER table semaphores_f18_rules      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_f18_rules      ADD COLUMN b_season int;
ALTER table semaphores_f18_rules      ADD COLUMN client_id int;

ALTER table semaphores_fakt_doks      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_doks      ADD COLUMN b_season int;
ALTER table semaphores_fakt_doks      ADD COLUMN client_id int;

ALTER table semaphores_fakt_doks2     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_doks2     ADD COLUMN b_season int;
ALTER table semaphores_fakt_doks2     ADD COLUMN client_id int;

ALTER table semaphores_fakt_fakt      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_fakt      ADD COLUMN b_season int;
ALTER table semaphores_fakt_fakt      ADD COLUMN client_id int;

ALTER table semaphores_fakt_ftxt      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_ftxt      ADD COLUMN b_season int;
ALTER table semaphores_fakt_ftxt      ADD COLUMN client_id int;

ALTER table semaphores_fakt_gen_ug    ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_gen_ug    ADD COLUMN b_season int;
ALTER table semaphores_fakt_gen_ug    ADD COLUMN client_id int;

ALTER table semaphores_fakt_gen_ug_p  ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_gen_ug_p  ADD COLUMN b_season int;
ALTER table semaphores_fakt_gen_ug_p  ADD COLUMN client_id int;

ALTER table semaphores_fakt_rugov     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_rugov     ADD COLUMN b_season int;
ALTER table semaphores_fakt_rugov     ADD COLUMN client_id int;

ALTER table semaphores_fakt_ugov      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_ugov      ADD COLUMN b_season int;
ALTER table semaphores_fakt_ugov      ADD COLUMN client_id int;

ALTER table semaphores_fakt_upl       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fakt_upl       ADD COLUMN b_season int;
ALTER table semaphores_fakt_upl       ADD COLUMN client_id int;

ALTER table semaphores_fin_anal       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fin_anal       ADD COLUMN b_season int;
ALTER table semaphores_fin_anal       ADD COLUMN client_id int;

ALTER table semaphores_fin_nalog      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fin_nalog      ADD COLUMN b_season int;
ALTER table semaphores_fin_nalog      ADD COLUMN client_id int;

ALTER table semaphores_fin_sint       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fin_sint       ADD COLUMN b_season int;
ALTER table semaphores_fin_sint       ADD COLUMN client_id int;

ALTER table semaphores_fin_suban      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_fin_suban      ADD COLUMN b_season int;
ALTER table semaphores_fin_suban      ADD COLUMN client_id int;

ALTER table semaphores_kalk_doks      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_kalk_doks      ADD COLUMN b_season int;
ALTER table semaphores_kalk_doks      ADD COLUMN client_id int;

ALTER table semaphores_kalk_kalk      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_kalk_kalk      ADD COLUMN b_season int;
ALTER table semaphores_kalk_kalk      ADD COLUMN client_id int;

ALTER table semaphores_kbenef         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_kbenef         ADD COLUMN b_season int;
ALTER table semaphores_kbenef         ADD COLUMN client_id int;

ALTER table semaphores_koncij         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_koncij         ADD COLUMN b_season int;
ALTER table semaphores_koncij         ADD COLUMN client_id int;

ALTER table semaphores_konto          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_konto          ADD COLUMN b_season int;
ALTER table semaphores_konto          ADD COLUMN client_id int;

ALTER table semaphores_kred           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_kred           ADD COLUMN b_season int;
ALTER table semaphores_kred           ADD COLUMN client_id int;

ALTER table semaphores_ld_ld          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_ld          ADD COLUMN b_season int;
ALTER table semaphores_ld_ld          ADD COLUMN client_id int;

ALTER table semaphores_ld_norsiht     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_norsiht     ADD COLUMN b_season int;
ALTER table semaphores_ld_norsiht     ADD COLUMN client_id int;

ALTER table semaphores_ld_obracuni    ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_obracuni    ADD COLUMN b_season int;
ALTER table semaphores_ld_obracuni    ADD COLUMN client_id int;

ALTER table semaphores_ld_parobr      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_parobr      ADD COLUMN b_season int;
ALTER table semaphores_ld_parobr      ADD COLUMN client_id int;

ALTER table semaphores_ld_pk_data     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_pk_data     ADD COLUMN b_season int;
ALTER table semaphores_ld_pk_data     ADD COLUMN client_id int;

ALTER table semaphores_ld_pk_radn     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_pk_radn     ADD COLUMN b_season int;
ALTER table semaphores_ld_pk_radn     ADD COLUMN client_id int;

ALTER table semaphores_ld_radkr       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_radkr       ADD COLUMN b_season int;
ALTER table semaphores_ld_radkr       ADD COLUMN client_id int;

ALTER table semaphores_ld_radn        ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_radn        ADD COLUMN b_season int;
ALTER table semaphores_ld_radn        ADD COLUMN client_id int;

ALTER table semaphores_ld_radsat      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_radsat      ADD COLUMN b_season int;
ALTER table semaphores_ld_radsat      ADD COLUMN client_id int;

ALTER table semaphores_ld_radsiht     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_radsiht     ADD COLUMN b_season int;
ALTER table semaphores_ld_radsiht     ADD COLUMN client_id int;

ALTER table semaphores_ld_rj          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_rj          ADD COLUMN b_season int;
ALTER table semaphores_ld_rj          ADD COLUMN client_id int;

ALTER table semaphores_ld_tprsiht     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ld_tprsiht     ADD COLUMN b_season int;
ALTER table semaphores_ld_tprsiht     ADD COLUMN client_id int;

ALTER table semaphores_lokal          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_lokal          ADD COLUMN b_season int;
ALTER table semaphores_lokal          ADD COLUMN client_id int;

ALTER table semaphores_mat_anal       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_mat_anal       ADD COLUMN b_season int;
ALTER table semaphores_mat_anal       ADD COLUMN client_id int;

ALTER table semaphores_mat_karkon     ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_mat_karkon     ADD COLUMN b_season int;
ALTER table semaphores_mat_karkon     ADD COLUMN client_id int;

ALTER table semaphores_mat_nalog      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_mat_nalog      ADD COLUMN b_season int;
ALTER table semaphores_mat_nalog      ADD COLUMN client_id int;

ALTER table semaphores_mat_sint       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_mat_sint       ADD COLUMN b_season int;
ALTER table semaphores_mat_sint       ADD COLUMN client_id int;

ALTER table semaphores_mat_suban      ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_mat_suban      ADD COLUMN b_season int;
ALTER table semaphores_mat_suban      ADD COLUMN client_id int;

ALTER table semaphores_ops            ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_ops            ADD COLUMN b_season int;
ALTER table semaphores_ops            ADD COLUMN client_id int;

ALTER table semaphores_os_amort       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_os_amort       ADD COLUMN b_season int;
ALTER table semaphores_os_amort       ADD COLUMN client_id int;

ALTER table semaphores_os_k1          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_os_k1          ADD COLUMN b_season int;
ALTER table semaphores_os_k1          ADD COLUMN client_id int;

ALTER table semaphores_os_os          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_os_os          ADD COLUMN b_season int;
ALTER table semaphores_os_os          ADD COLUMN client_id int;

ALTER table semaphores_os_promj       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_os_promj       ADD COLUMN b_season int;
ALTER table semaphores_os_promj       ADD COLUMN client_id int;

ALTER table semaphores_os_reval       ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_os_reval       ADD COLUMN b_season int;
ALTER table semaphores_os_reval       ADD COLUMN client_id int;

ALTER table semaphores_partn          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_partn          ADD COLUMN b_season int;
ALTER table semaphores_partn          ADD COLUMN client_id int;

ALTER table semaphores_por            ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_por            ADD COLUMN b_season int;
ALTER table semaphores_por            ADD COLUMN client_id int;

ALTER table semaphores_refer          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_refer          ADD COLUMN b_season int;
ALTER table semaphores_refer          ADD COLUMN client_id int;

ALTER table semaphores_rj             ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_rj             ADD COLUMN b_season int;
ALTER table semaphores_rj             ADD COLUMN client_id int;

ALTER table semaphores_roba           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_roba           ADD COLUMN b_season int;
ALTER table semaphores_roba           ADD COLUMN client_id int;

ALTER table semaphores_sast           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_sast           ADD COLUMN b_season int;
ALTER table semaphores_sast           ADD COLUMN client_id int;

ALTER table semaphores_sifk           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_sifk           ADD COLUMN b_season int;
ALTER table semaphores_sifk           ADD COLUMN client_id int;

ALTER table semaphores_sifv           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_sifv           ADD COLUMN b_season int;
ALTER table semaphores_sifv           ADD COLUMN client_id int;

ALTER table semaphores_strspr         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_strspr         ADD COLUMN b_season int;
ALTER table semaphores_strspr         ADD COLUMN client_id int;

ALTER table semaphores_tarifa         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_tarifa         ADD COLUMN b_season int;
ALTER table semaphores_tarifa         ADD COLUMN client_id int;

ALTER table semaphores_tdok           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_tdok           ADD COLUMN b_season int;
ALTER table semaphores_tdok           ADD COLUMN client_id int;

ALTER table semaphores_tippr          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_tippr          ADD COLUMN b_season int;
ALTER table semaphores_tippr          ADD COLUMN client_id int;

ALTER table semaphores_tippr2         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_tippr2         ADD COLUMN b_season int;
ALTER table semaphores_tippr2         ADD COLUMN client_id int;

ALTER table semaphores_tnal           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_tnal           ADD COLUMN b_season int;
ALTER table semaphores_tnal           ADD COLUMN client_id int;

ALTER table semaphores_trfp           ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_trfp           ADD COLUMN b_season int;
ALTER table semaphores_trfp           ADD COLUMN client_id int;

ALTER table semaphores_trfp2          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_trfp2          ADD COLUMN b_season int;
ALTER table semaphores_trfp2          ADD COLUMN client_id int;

ALTER table semaphores_trfp3          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_trfp3          ADD COLUMN b_season int;
ALTER table semaphores_trfp3          ADD COLUMN client_id int;

ALTER table semaphores_valute         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_valute         ADD COLUMN b_season int;
ALTER table semaphores_valute         ADD COLUMN client_id int;

ALTER table semaphores_vposla         ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_vposla         ADD COLUMN b_season int;
ALTER table semaphores_vposla         ADD COLUMN client_id int;

ALTER table semaphores_vprih          ADD COLUMN b_year int CHECK (b_year > 1990 and b_year < 2990);
ALTER table semaphores_vprih          ADD COLUMN b_season int;
ALTER table semaphores_vprih          ADD COLUMN client_id int;

$$)
WHERE (u2.knowhow_package_version('fmk') <  040101);

---- verzija 4.1.1

