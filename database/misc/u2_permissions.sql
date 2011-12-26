/* 
 * This file is part of the bring.out knowhow ERP, a free and open source 
 * Enterprise Resource Planning software suite,
 * Copyright (c) 1994-2011 by bring.out doo Sarajevo.
 * It is licensed to you under the Common Public Attribution License
 * version 1.0, the full text of which (including FMK specific Exhibits)
 * is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the 
 * root directory of this source code archive.
 * By using this software, you agree to be bound by its terms.
 */

---- start verzija 4.0.7

SELECT u2.execute($$

GRANT ALL ON SCHEMA u2 TO admin;
GRANT ALL ON SCHEMA u2 TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') <  40007);

---- verzija 4.0.7
