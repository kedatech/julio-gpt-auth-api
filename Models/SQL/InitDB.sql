CREATE TABLE TypeUser (
    TypeName VARCHAR(30) PRIMARY KEY
);
CREATE TABLE ClientUser (
    Id SERIAL PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RestartAccount BOOLEAN DEFAULT FALSE,
    ConfirmAccount BOOLEAN DEFAULT FALSE,
    Token VARCHAR(6),
    FirstName VARCHAR(60) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    BadConduct INTEGER,
    Banned BOOLEAN GENERATED ALWAYS AS (CASE WHEN BadConduct > 7 THEN TRUE ELSE FALSE END) STORED,
    TypeUserId VARCHAR(30),
    FOREIGN KEY (TypeUserId) REFERENCES TypeUser(TypeName)
);

CREATE TABLE FeedBack (
    Id SERIAL PRIMARY KEY,
    ClientUserId INTEGER,
    Message VARCHAR(200),
    FOREIGN KEY (ClientUserId) REFERENCES ClientUser(Id)
);

ALTER TABLE ClientUser ALTER COLUMN RestartAccount SET DEFAULT FALSE;
ALTER TABLE ClientUser ALTER COLUMN ConfirmAccount SET DEFAULT FALSE;
