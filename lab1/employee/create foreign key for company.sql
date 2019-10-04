-- Add not null
ALTER TABLE companies
	ALTER COLUMN company varchar(250) NOT NULL

go

-- Add primary key
ALTER TABLE companies
	ADD PRIMARY KEY (company)

go

alter table employee
	ADD FOREIGN KEY (company) REFERENCES companies(company)

go

