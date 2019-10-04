-- Add not null to Companies.Company
ALTER TABLE companies
	ALTER COLUMN company varchar(250) NOT NULL

go

-- Add primary key
ALTER TABLE companies
	ADD PRIMARY KEY (company)

go

-- Add not null to Enployee.Company
ALTER TABLE employee
	ALTER COLUMN company varchar(250) NOT NULL

go

alter table employee
	ADD FOREIGN KEY (company) REFERENCES companies(company)

go