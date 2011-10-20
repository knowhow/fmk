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


