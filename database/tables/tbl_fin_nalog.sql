CREATE TABLE fmk.fin_nalog
(
  idfirma character(2),
  idvn character(2),
  brnal character(8),
  datnal date,
  dugbhd numeric(17,2),
  potbhd numeric(17,2),
  dugdem numeric(15,2),
  potdem numeric(15,2),
  brisano character(1),
  sifra character(6)
);

GRANT ALL ON TABLE fmk.fin_nalog TO xtrole;


