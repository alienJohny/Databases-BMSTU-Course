alter table employee
add
	PASSPORT_PK int identity(1, 1) not null FOREIGN KEY REFERENCES passports(id)