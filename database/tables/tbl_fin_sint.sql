CREATE TABLE fmk.fin_sint
(
  idfirma character(2),
  idkonto character(3),
  idvn character(2),
  brnal character(8),
  rbr character(3),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  brisano character(1)
);

GRANT ALL ON TABLE fmk.fin_sint TO xtrole;


