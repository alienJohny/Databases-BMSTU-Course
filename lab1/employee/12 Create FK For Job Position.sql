-- Add not null to job_position.job_position
ALTER TABLE job_position
	ALTER COLUMN job_position varchar(250) NOT NULL

go

-- Add primary key
ALTER TABLE job_position
	ADD PRIMARY KEY (job_position)

go

-- Add not null to Employee.job_position
ALTER TABLE employee
	ALTER COLUMN job_position varchar(250) NOT NULL

go

-- Add foreign key for job_position.job_position
alter table employee
	ADD FOREIGN KEY (job_position) REFERENCES job_position(job_position)

go