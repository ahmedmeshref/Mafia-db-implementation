CREATE TABLE dbo."Role" (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(100),
	role_description TEXT
);

CREATE TABLE dbo."Location" (
    location_id INT NOT NULL PRIMARY KEY,
    city VARCHAR(100),
	country VARCHAR(100)
);

CREATE TABLE dbo.Operation (
	operation_id INT NOT NULL PRIMARY KEY,
	operation_name VARCHAR(100),
	operation_description TEXT,
	/* economic_value can be string from 1 to 5 with 1 indicating higher value */
	economic_value int ,
	cover_up_info Text,
	check (economic_value between 1 and 5)
);

CREATE TABLE dbo.Permission (
    permission_id INT NOT NULL PRIMARY KEY,
	permission_description TEXT,
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	operation_id INT FOREIGN KEY REFERENCES Operation(operation_id),
);

CREATE TABLE dbo.Person (
    person_id INT NOT NULL PRIMARY KEY,
    person_name VARCHAR(100),
	nickname VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(100),
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	location_id INT FOREIGN KEY REFERENCES "Location"(location_id)
);

CREATE TABLE dbo.Hierarchy (
	hierarchy_id INT NOT NULL PRIMARY KEY,
	parent_id INT FOREIGN KEY REFERENCES "Person"(person_id),
	child_id INT FOREIGN KEY REFERENCES "Person"(person_id),
	hierarchy_description TEXT
);

create table dbo.Account (
	account_id INT NOT NULL PRIMARY KEY,
	account_name VARCHAR(100),
	account_amount DECIMAL(19,4),
	person_id INT NOT NULL FOREIGN KEY REFERENCES Person(person_id),
);

CREATE TABLE dbo."Transaction" (
	transaction_id INT NOT NULL PRIMARY KEY,
	transaction_name TEXT,
	transaction_date DATE,
	transaction_amount DECIMAL(19,4),
	account_id INT NOT NULL FOREIGN KEY REFERENCES Account(account_id)
);

/* Insert values into role */
INSERT INTO dbo."Role" VALUES (1, 'Boss', 'Manages the whole gang');
INSERT INTO dbo."Role" VALUES (2, 'Financial Manager', 'Manages the financials');
INSERT INTO dbo."Role" VALUES (3, 'Operation Manager', 'Manages the operations');
INSERT INTO dbo."Role" VALUES (4, 'Soldier', 'Soldiers in the operation');
INSERT INTO dbo."Role" VALUES (5, 'Territory Manager', 'Manages the territories');

GO

/* Insert locations (id, city, country) */
INSERT INTO dbo.Location VALUES (1, 'Cairo', 'Egypt');
INSERT INTO dbo.Location VALUES (2, 'Kigali', 'Rwanda');
INSERT INTO dbo.Location VALUES (3, 'London', 'UK');
INSERT INTO dbo.Location VALUES (4, 'Seatle', 'USA');
INSERT INTO dbo.Location VALUES (5, 'New York', 'USA');
GO

/* Insert operations (operation_id, operation_name, operation_description, economic_value, cover_up_info) */
INSERT INTO dbo.Operation VALUES (1, 'Use Account', 'use accounts for payment', 1, 'financial managers');
INSERT INTO dbo.Operation VALUES (2, 'Handle Deal', 'handle deals with other gangs', 2, 'boss');

/* Insert people (id, fName, lName, email, role, location)*/
INSERT INTO dbo.Person VALUES (1, 'meshref','ahmed', 'meshref@emails.com', '+20118123', 1, 1);
INSERT INTO dbo.Person VALUES (2, 'paul','arah', 'paul@emails.com', '+20218123', 2, 2);
INSERT INTO dbo.Person VALUES (3, 'wens','raf', 'wens@emails.com', '+20318123', 3, 3);
INSERT INTO dbo.Person VALUES (4, 'zubrah','nagy', 'zubrah@emails.com', '+250218123', 4, 1);
INSERT INTO dbo.Person VALUES (5, 'zaki','nas', 'zaki@emails.com', '+230118123', 5, 4);
INSERT INTO dbo.Person VALUES (6, 'bruce','bruce', 'hayley.b@coldmail.com', '+20118123', 2, 5);
INSERT INTO dbo.Person VALUES (7, 'khaled','zaki', 'khaled@coldmail.com', '+20118123', 5, 4);
GO

/* Insert Hierarchy (hierarchy_id, parent_id, child_id, hierarchy_description) */
INSERT INTO dbo.Hierarchy VALUES (1, 1, 2, 'Ahmed manages Paul');
INSERT INTO dbo.Hierarchy VALUES (2, 1, 6, 'Ahmed manages Bruce');
INSERT INTO dbo.Hierarchy VALUES (3, 2, 3, 'Paul manages Wens');
INSERT INTO dbo.Hierarchy VALUES (4, 6, 4, 'Bruce manages Zubrah');
INSERT INTO dbo.Hierarchy VALUES (5, 4, 7, 'Zubrah manages Khaled');
GO

/* Insert Accounts  (account_id, account_name, account_amount, person_id) */
INSERT INTO dbo.Account VALUES (1, 'Payment', 10000.50, 2);
INSERT INTO dbo.Account VALUES (2, 'Deals', 12083.40, 6);
GO

/* Insert Transaction  (transaction_id, transaction_name, transaction_date, transaction_amount, account_id) */
INSERT INTO dbo."Transaction" VALUES (1, 'deal with gang', '2022-02-27', 100.50, 2);
INSERT INTO dbo."Transaction" VALUES (2, 'March payment', '2022-03-01', 1200.50, 1);
INSERT INTO dbo."Transaction" VALUES (3, 'April payment', '2022-04-01', 1200.50, 1);
GO
