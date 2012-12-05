---- start verzija 4.5.9

SELECT u2.execute($$

CREATE OR REPLACE FUNCTION fmk.primary_keys_on_off()
RETURNS integer AS $BODY$
DECLARE existsPK INTEGER;

BEGIN

IF exists(select 1 from pg_constraint where conname = 'fakt_fakt_pkey') THEN
  perform fmk.setmetric( 'primary_keys', '1' );
  existsPK = 1;
ELSE
  perform fmk.setmetric( 'primary_keys', '0' );
  existsPK = 0;
END IF;

return existsPK;

END;

$BODY$ LANGUAGE 'plpgsql' VOLATILE;

ALTER FUNCTION fmk.primary_keys_on_off() OWNER TO xtrole;

$$)
WHERE (u2.knowhow_package_version('fmk') <  40509);

---- verzija 4.5.9
