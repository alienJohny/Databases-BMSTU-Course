ALTER TABLE employee 
  ADD FOREIGN KEY (PASSPORT_FK) REFERENCES passports (id);

go

ALTER TABLE employee 
  ADD FOREIGN KEY (company) REFERENCES companies (company);

go

