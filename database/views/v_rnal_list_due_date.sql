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


