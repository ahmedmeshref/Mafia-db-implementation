CREATE TABLE dbo."Role" (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(100),
	role_description TEXT
);CREATE TABLE dbo.Permission (
    permission_id INT NOT NULL PRIMARY KEY,
	permission_description TEXT,
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	operation_id INT
);

CREATE TABLE dbo."Location" (
    location_id INT NOT NULL PRIMARY KEY,
    city VARCHAR(100),
	country VARCHAR(100),
);

CREATE TABLE dbo.Person (
    person_id INT NOT NULL PRIMARY KEY,
    person_name VARCHAR(100),
	nickname VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(100),
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	location_id INT UNIQUE FOREIGN KEY REFERENCES "Location"(location_id)
);/* Insert values into role */INSERT INTO dbo."Role" VALUES ('Boss', 'Manages the whole gang');
GO/* Insert locations */INSERT INTO dbo."Location" VALUES ('Cairo', 'Egypt');
INSERT INTO dbo."Location" VALUES ('Kigali', 'Rwanda');
GO/* Insert people */INSERT INTO dbo.Person VALUES ('Meshref','hamd', 'meshref@emails.com', '+20118123', 1, 1);
GO
