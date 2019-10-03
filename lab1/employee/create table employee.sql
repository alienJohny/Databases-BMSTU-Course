use users

create table employee (
	[id] int identity(1, 1) not null,
	[username] varchar (100) not null,
	[password] varchar (100) not null,
	[first_name] varchar (100) not null,
	[last_name] varchar (100) not null,
	[email] varchar (100) not null,
	[phone_number] varchar (100) not null,
	[gender] varchar (100) not null,
	[country] varchar (100) not null,
	[city] varchar (100) not null,
	[street_address] varchar (150) not null,
	[insurance_company] varchar (250) not null,
	[department] varchar (100) not null,
	[university] varchar (250) not null,
	[credit_card_type] varchar (50) not null,
	[credit_card_number] bigint not null,
	[shirt_size] varchar (50) not null
)