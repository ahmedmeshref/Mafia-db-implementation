CREATE TABLE dbo."Role" (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(100),
	role_description TEXT
);

CREATE TABLE dbo.Permission (
    permission_id INT NOT NULL PRIMARY KEY,
	permission_description TEXT,
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	operation_id INT
);

CREATE TABLE dbo."Location" (
    location_id INT NOT NULL PRIMARY KEY,
    city VARCHAR(100),
	territory_id INT FOREIGN KEY REFERENCES "Territory"(territory_id),
	boss_id INT FOREIGN KEY REFERENCES "Bosses"(boss_id)
);

CREATE TABLE dbo.Person (
    person_id INT NOT NULL PRIMARY KEY,
    person_name VARCHAR(100),
	nickname VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(100),
	role_id INT FOREIGN KEY REFERENCES "Role"(role_id),
	location_id INT UNIQUE FOREIGN KEY REFERENCES "Location"(location_id)
);

CREATE TABLE dbo.Operations (
	operation_id INT NOT NULL PRIMARY KEY,
	operation_name VARCHAR(100),
	operation_description TEXT,
	economic_value VARCHAR(100),
	Cover_Up_Name VARCHAR(100),
	Operation_status VARCHAR(100),
	boss_id INT FOREIGN KEY REFERENCES "Person"(person_id),
	fin_manager_id INT FOREIGN KEY REFERENCES "Person"(person_id),
);
CREATE TABLE dbo.Hierarchy (
	hierarchy_id INT NOT NULL PRIMARY KEY,
	parent_id INT UNIQUE FOREIGN KEY REFERENCES "Person"(person_id),
	child_id INT UNIQUE FOREIGN KEY REFERENCES "Person"(person_id),
	hierarchy_description TEXT
);

CREATE TABLE dbo.Bosses (
	boss_id INT NOT NULL PRIMARY KEY,
	boss_name VARCHAR(100),
	boss_description TEXT,
	role_id INT UNIQUE FOREIGN KEY REFERENCES "Role"(role_id),
	boss_location_id INT UNIQUE FOREIGN KEY REFERENCES "Location"(location_id)
);

create table dbo.Financial_Managers (
	fin_manager_id INT NOT NULL PRIMARY KEY,
	fin_manager_name VARCHAR(100),
	fin_phone_number TEXT,
	fin_manager_location_id INT UNIQUE FOREIGN KEY REFERENCES "Location"(location_id)
	fin_email_address TEXT
);

create table dbo.Accounts (
	account_id INT NOT NULL PRIMARY KEY,
	account_name VARCHAR(100),
	account_amount TEXT,
	boss_id INT NOT NULL FOREIGN KEY REFERENCES "Bosses"(boss_id),
);


CREATE TABLE dbo.Account_Permission (
	account_id INT NOT NULL FOREIGN KEY REFERENCES "Accounts"(account_id),
	permission_id INT NOT NULL FOREIGN KEY REFERENCES "Permission"(permission_id)
);

CREATE TABLE dbo.Transactions (
	transaction_id INT NOT NULL PRIMARY KEY,
	transaction_name TEXT,
	transaction_date DATE,
	transaction_description TEXT,
	fin_manager_name VARCHAR(255),
	account_id INT NOT NULL FOREIGN KEY REFERENCES "Accounts"(account_id)
	fin_manager_id INT NOT NULL FOREIGN KEY REFERENCES "Financial_Managers"(fin_manager_id)
);

CREATE TABLE dbo.Soldiers (
	soldier_id INT NOT NULL PRIMARY KEY,
	soldier_name VARCHAR(100),
	phone_number TEXT,
	email_address TEXT,
	operation_id INT NOT NULL FOREIGN KEY REFERENCES "Operation"(operation_id),
	soldier_territory_id INT UNIQUE FOREIGN KEY REFERENCES "Territories"(territory_id)
);

CREATE TABLE dbo.Territories (
	territory_id INT NOT NULL PRIMARY KEY,
	territory_name VARCHAR(100),
	territory_description TEXT,
	boss_id INT NOT NULL FOREIGN KEY REFERENCES "Bosses"(boss_id)
);
)




/* Insert values into role */
INSERT INTO dbo."Role" VALUES ('Boss', 'Manages the whole gang');
INSERT INTO dbo."Role" VALUES ('Financial Manager', 'Manages the financials');
INSERT INTO dbo."Role" VALUES ('Operation Manager', 'Manages the operations');
INSERT INTO dbo."Role" VALUES ('Soldier', 'Soldiers in the operation');
INSERT INTO dbo."Role" VALUES ('Territory Manager', 'Manages the territories');

GO

/* Insert locations */

INSERT INTO dbo.`Location` (`city`) VALUES (`Camp Verde`, `Camp Verde`, `Camp Verde`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Lakeland Village`, `Lakeland Village`, `Lakeland Village`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Orange`, `Orange`, `Orange`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Vale`, `Vale`, `Vale`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Valencia West`, `Valencia West`, `Valencia West`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Couderay`, `Couderay`, `Couderay`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Lasara`, `Lasara`, `Lasara`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Ruth`, `Ruth`, `Ruth`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Learned`, `Learned`, `Learned`);
INSERT INTO dbo.`Location` (`city`) VALUES (`Savoy`, `Savoy`, `Savoy`);
GO

/* Insert people */
INSERT INTO dbo.Person VALUES ('Meshref','hamd', 'meshref@emails.com', '+20118123', 1, 1);

GO


/* Insert operations */
INSERT INTO dbo.Operations VALUES (1, 'Operation 1', 'Operation 1 description', 'Economic Value', 'Cover Up Name', 'Operation Status', 1, 1);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Karat`, `288 Mulberry Court, Cody`, `288 Mulberry Court, Cody`, `Seat Pleasant`, 1);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Secretaryship`, `205 Sherwood Drive, Gem Lake`, `205 Sherwood Drive, Gem Lake`, `Highland Holiday`, 0);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Adjacently`, `257 East Avenue, Mildred`, `257 East Avenue, Mildred`, `Waterproof`, 0);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Floppier`, `594 Hillcrest Avenue, Napakiak`, `594 Hillcrest Avenue, Napakiak`, `Sanborn`, 1);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Rishis`, `757 Magnolia Court, Farmington`, `757 Magnolia Court, Farmington`, `Hayti`, 1);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Winnings`, `33 Cobblestone Court, Marfa`, `33 Cobblestone Court, Marfa`, `Shenorock`, 0);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Opport`, `188 8th Avenue, Beaver Falls`, `188 8th Avenue, Beaver Falls`, `Old Fort`, 1);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Primatial`, `55 High Street, Cotton Valley`, `55 High Street, Cotton Valley`, `Wickes`, 0);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Sparbema`, `265 Essex Court, Seagrove`, `265 Essex Court, Seagrove`, `Gouverneur`, 0);
INSERT INTO dbo.`Operations` (`operation_name`, `operation_description`, `Cover_Up_Name`, `Operation_status`) VALUES (`Voll`, `224 Devonshire Drive, Pleasant Garden`, `224 Devonshire Drive, Pleasant Garden`, `Cody`, 1);


/* Insert Soldiers */
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Felix`, `Felix`, `rory.m@btintertel.com`, `rory.m@btintertel.com`, `rory.m@btintertel.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Diana`, `Diana`, `hayley.b@coldmail.com`, `hayley.b@coldmail.com`, `hayley.b@coldmail.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Wanda`, `Wanda`, `ivy.erickson@datum.net`, `ivy.erickson@datum.net`, `ivy.erickson@datum.net`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Bruce`, `Bruce`, `mary.d@zoppo.com`, `mary.d@zoppo.com`, `mary.d@zoppo.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Juliana`, `Juliana`, `gerald.r@zoppo.com`, `gerald.r@zoppo.com`, `gerald.r@zoppo.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Miles`, `Miles`, `patricia.rose@opbox.com`, `patricia.rose@opbox.com`, `patricia.rose@opbox.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Janet`, `Janet`, `quinby.holloway@coldmail.com`, `quinby.holloway@coldmail.com`, `quinby.holloway@coldmail.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Fannie`, `Fannie`, `anthony.hampton@lavanit.com`, `anthony.hampton@lavanit.com`, `anthony.hampton@lavanit.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Gerald`, `Gerald`, `verda.f@geeglemail.com`, `verda.f@geeglemail.com`, `verda.f@geeglemail.com`);
INSERT INTO dbo.`Soldiers` (`soldier_name`, `email_address`) VALUES (`Lindsay`, `Lindsay`, `egan.n@btintertel.com`, `egan.n@btintertel.com`, `egan.n@btintertel.com`);


/* Insert Territories */
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`New Windsor`, `Excises`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Jewell`, `Refry`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Sweetser`, `Oilcan`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Poplarville`, `Soporose`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Allison Park`, `Findlave`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Poquott`, `Ting2`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Granite Shoals`, `Placable`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Vale`, `Totemists`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`El Indio`, `Barfkirk`);
INSERT INTO dbo.`Territories` (`territory_name`, `territory_description`) VALUES (`Loch Lomond`, `Etatist`);


/* Insert Transactions */
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Rows`, `2018-08-19`, `Rankin`, `Pandora`, `Pandora`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Dominicans`, `2019-01-27`, `Tomahawk`, `Cedric`, `Cedric`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Voll`, `2021-01-29`, `Boyce`, `Kay`, `Kay`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Welsher`, `2018-06-09`, `Port Murray`, `Dudley`, `Dudley`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Fio De Arame`, `2020-05-14`, `Mamers`, `Zera`, `Zera`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Screwballs`, `2021-12-07`, `Beach`, `Conan`, `Conan`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Chure`, `2021-01-04`, `Tullytown`, `Kiefer`, `Kiefer`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Demonizes`, `2021-08-26`, `Beechwood`, `Kyle`, `Kyle`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Inconsequentially`, `2020-08-01`, `Dot Lake`, `Hartley`, `Hartley`);
INSERT INTO dbo.`Transactions` (`transaction_name`, `transaction_date`, `transaction_description`, `fin_manager_name`, ``) VALUES (`Abhyasanam`, `2019-11-28`, `South Farmingdale`, `Michelle`, `Michelle`);