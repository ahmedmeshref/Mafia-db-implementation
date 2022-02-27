CREATE TABLE Role (
    id INTEGER PRIMARY KEY,
    role_name VARCHAR(100),
	role_description TEXT
);

CREATE TABLE Location (
    id INTEGER PRIMARY KEY,
    city VARCHAR(100),
	country VARCHAR(100)
);

CREATE TABLE Operation (
	id INTEGER PRIMARY KEY,
	operation_name VARCHAR(100),
	operation_description TEXT,
	/* economic_value can be string from 1 to 5 with 1 indicating higher value */
	economic_value int,
	cover_up_info Text,
	check (economic_value between 1 and 5)
);

CREATE TABLE Permission (
    id INTEGER NOT NULL PRIMARY KEY,
	permission_description TEXT,
	operation_id INTEGER NOT NULL,
	role_id INTEGER NOT NULL,
	foreign key(id) references Operation(operation_id),
	foreign key(id) references Role(role_id)
);

CREATE TABLE Person (
    id INTEGER NOT NULL PRIMARY KEY,
    person_name VARCHAR(100),
	nickname VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(100),
	operation_id INTEGER NOT NULL,
	location_id INTEGER NOT NULL,
	foreign key(id) references Role(role_id),
	foreign key(id) references Location(location_id)
);

CREATE TABLE Hierarchy (
	id INTEGER NOT NULL PRIMARY KEY,
	parent_id INTEGER NOT NULL,
	child_id INTEGER NOT NULL,
	foreign key(parent_id) references Person(id),
	foreign key(child_id) references Person(id),
	hierarchy_description TEXT
);

create table Account (
	id INTEGER NOT NULL PRIMARY KEY,
	account_name VARCHAR(100),
	account_amount DECIMAL(19,4),
	owner_id INTEGER NOT NULL,
	foreign key(owner_id) references Person(id)
);

CREATE TABLE Transaction (
	id INTEGER NOT NULL PRIMARY KEY,
	transaction_name TEXT,
	transaction_date DATE,
	transaction_amount DECIMAL(19,4),
	account_id INTEGER NOT NULL,
	foreign key(account_id) references Account(id)
);

/* Insert values into role */
INSERT INTO Role VALUES (1, 'Boss', 'Manages the whole gang');
INSERT INTO Role VALUES (2, 'Financial Manager', 'Manages the financials');
INSERT INTO Role VALUES (3, 'Operation Manager', 'Manages the operations');
INSERT INTO Role VALUES (4, 'Soldier', 'Soldiers in the operation');
INSERT INTO Role VALUES (5, 'Territory Manager', 'Manages the territories');

GO

/* Insert locations (id, city, country) */
INSERT INTO Location VALUES (1, 'Cairo', 'Egypt');
INSERT INTO Location VALUES (2, 'Kigali', 'Rwanda');
INSERT INTO Location VALUES (3, 'London', 'UK');
INSERT INTO Location VALUES (4, 'Seatle', 'USA');
INSERT INTO Location VALUES (5, 'New York', 'USA');
GO


/* Insert people (id, fName, lName, email, role, location)*/
INSERT INTO Person VALUES (1, 'meshref','ahmed', 'meshref@emails.com', '+20118123', 1, 1);
INSERT INTO Person VALUES (2, 'paul','arah', 'paul@emails.com', '+20218123', 2, 2);
INSERT INTO Person VALUES (3, 'wens','raf', 'wens@emails.com', '+20318123', 3, 3);
INSERT INTO Person VALUES (4, 'zubrah','nagy', 'zubrah@emails.com', '+250218123', 4, 1);
INSERT INTO Person VALUES (5, 'zaki','nas', 'zaki@emails.com', '+230118123', 5, 4);
INSERT INTO Person VALUES (6, 'bruce','bruce', 'hayley.b@coldmail.com', '+20118123', 2, 5);
INSERT INTO Person VALUES (7, 'khaled','zaki', 'khaled@coldmail.com', '+20118123', 5, 4);
GO

/* Insert operations (operation_id, operation_name, operation_description, economic_value, cover_up_info) */
INSERT INTO Operation VALUES (1, 'Use Account', 'use accounts for payment', 1, 'financial managers');
INSERT INTO Operation VALUES (2, 'Handle Deal', 'handle deals with other gangs', 2, 'boss');
INSERT INTO Operation VALUES (3, 'Bribe', 'bribe governments and orgs', 1, 'boss');
INSERT INTO Operation VALUES (4, 'Steal Banks', 'steal banks', 4, 'soldier');
INSERT INTO Operation VALUES (5, 'Steal Properties', 'steal private propeties', 4, 'soldier');


/* Insert permission (id, permission_description, operation_id, role_id)*/
INSERT INTO Permission VALUES (1, 'Financial Managers can use accounts', 1, 2);
INSERT INTO Permission VALUES (2, 'Boss can handle deals', 2, 1);
INSERT INTO Permission VALUES (3, 'Solider can steal banks', 4, 4);
INSERT INTO Permission VALUES (4, 'Solider can steal private propeties', 5, 4);
INSERT INTO Permission VALUES (5, 'Boss Managers can use accounts', 1, 1);
GO

/* Insert Hierarchy (hierarchy_id, parent_id, child_id, hierarchy_description) */
INSERT INTO Hierarchy VALUES (1, 1, 2, 'Ahmed manages Paul');
INSERT INTO Hierarchy VALUES (2, 1, 6, 'Ahmed manages Bruce');
INSERT INTO Hierarchy VALUES (3, 2, 3, 'Paul manages Wens');
INSERT INTO Hierarchy VALUES (4, 6, 4, 'Bruce manages Zubrah');
INSERT INTO Hierarchy VALUES (5, 4, 7, 'Zubrah manages Khaled');
GO

/* Insert Accounts  (account_id, account_name, account_amount, person_id) */
INSERT INTO Account VALUES (1, 'Payment', 10000.50, 2);
INSERT INTO Account VALUES (2, 'Deals', 12083.40, 6);
INSERT INTO Account VALUES (3, 'Main', 1112083.40, 2);
INSERT INTO Account VALUES (4, 'Internal', 122083.40, 6);
INSERT INTO Account VALUES (5, 'International', 122082.30, 2);
GO

/* Insert Transaction  (transaction_id, transaction_name, transaction_date, transaction_amount, account_id) */
INSERT INTO Transaction VALUES (1, 'deal with gang', '2022-02-27', 100.50, 2);
INSERT INTO Transaction VALUES (2, 'March payment', '2022-03-01', 1200.50, 1);
INSERT INTO Transaction VALUES (3, 'April payment', '2022-04-01', 1200.50, 1);
INSERT INTO Transaction VALUES (4, 'Government bripe', '2022-01-05', 1222.50, 5);
INSERT INTO Transaction VALUES (5, 'Internal Trans', '2022-01-03', 122.50, 4);
GO


SELECT * FROM Person;
SELECT * FROM Transaction;
