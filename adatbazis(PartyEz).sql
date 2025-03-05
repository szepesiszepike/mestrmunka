-- Adatbázis létrehozása
CREATE DATABASE partyez;
USE partyez;

-- Users tábla
CREATE TABLE users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    IsAdult BOOLEAN NOT NULL,
    Consent BOOLEAN NOT NULL,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Preferences tábla
CREATE TABLE preferences (
    PrefID INT PRIMARY KEY AUTO_INCREMENT,
    Preference TEXT NOT NULL
);

-- Bulihely tábla
CREATE TABLE bulihely (
    HelyID INT PRIMARY KEY AUTO_INCREMENT,
    HelyNev VARCHAR(50) NOT NULL,
    Stilus VARCHAR(50),
    ZeneStilusID INT,
    Orszag VARCHAR(50),
    Varos VARCHAR(50),
    Cim VARCHAR(50),
    FOREIGN KEY (ZeneStilusID) REFERENCES zenestilus(ZeneStilusID)
);

-- Rendezveny tábla
CREATE TABLE rendezveny (
    RendezvenyID INT PRIMARY KEY AUTO_INCREMENT,
    BuliID INT,
    RNeve VARCHAR(50) NOT NULL,
    Leiras TEXT,
    FOREIGN KEY (BuliID) REFERENCES bulihely(HelyID)
);

-- Reszvevok tábla
CREATE TABLE reszvevok (
    RendID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- PrefUser tábla
CREATE TABLE prefuser (
    UserID INT,
    PrefID INT,
    PRIMARY KEY (UserID, PrefID),
    FOREIGN KEY (UserID) REFERENCES users(UserID),
    FOREIGN KEY (PrefID) REFERENCES preferences(PrefID)
);

-- Organizers tábla
CREATE TABLE organizers (
    OrganizerID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PermissionLevel INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Zenestilus tábla
CREATE TABLE zenestilus (
    ZeneStilusID INT PRIMARY KEY AUTO_INCREMENT,
    StilusNev VARCHAR(50) NOT NULL
);