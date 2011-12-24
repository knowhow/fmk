---- start verzija 4.0.6

SELECT u2.execute($$

-- https://github.com/knowhow/xtupleserver/blob/master/dbscripts/functions/fetchmetrictext.sql

CREATE SEQUENCE metric_metric_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 445
  CACHE 1;
ALTER TABLE metric_metric_id_seq
  OWNER TO admin;
GRANT ALL ON TABLE metric_metric_id_seq TO admin;
GRANT ALL ON TABLE metric_metric_id_seq TO xtrole;

CREATE TABLE metric
(
  metric_id integer NOT NULL DEFAULT nextval(('metric_metric_id_seq'::text)::regclass),
  metric_name text,
  metric_value text,
  metric_module text,
  CONSTRAINT metric_pkey PRIMARY KEY (metric_id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE metric
  OWNER TO admin;
GRANT ALL ON TABLE metric TO admin;
GRANT ALL ON TABLE metric TO xtrole;
COMMENT ON TABLE metric
  IS 'Application-wide settings information';

-- Index: metric_name_key

-- DROP INDEX metric_name_key;

CREATE INDEX metric_name_key
  ON metric
  USING btree
  (metric_name COLLATE pg_catalog."default" );


CREATE OR REPLACE FUNCTION FetchMetricText(text) RETURNS TEXT STABLE AS 
$BODY$
DECLARE
  _pMetricName ALIAS FOR $1;
  _returnVal TEXT;
BEGIN
  SELECT metric_value::TEXT INTO _returnVal
    FROM metric
   WHERE metric_name = _pMetricName;
  
  IF (FOUND) THEN
     RETURN _returnVal;
  ELSE
     RETURN '!!notfound!!';
  END IF;

END;
$BODY$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION setMetric(TEXT, TEXT) RETURNS BOOLEAN AS 
$BODY$
DECLARE
  pMetricName ALIAS FOR $1;
  pMetricValue ALIAS FOR $2;
  _metricid INTEGER;

BEGIN

  IF (pMetricValue = '!!UNSET!!'::TEXT) THEN
     DELETE FROM metric
     WHERE (metric_name=pMetricName);
     RETURN TRUE;
  END IF;
  
  SELECT metric_id INTO _metricid
  FROM metric
  WHERE (metric_name=pMetricName);

  IF (FOUND) THEN
    UPDATE metric
    SET metric_value=pMetricValue
    WHERE (metric_id=_metricid);

  ELSE
    INSERT INTO metric
    (metric_name, metric_value)
    VALUES (pMetricName, pMetricValue);
  END IF;

  RETURN TRUE;

END;
$BODY$
LANGUAGE 'plpgsql';


$$)
WHERE (u2.knowhow_package_version('fmk') <  40006);

---- verzija 4.0.6
