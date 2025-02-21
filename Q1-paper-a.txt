CREATE TABLE Artist (
    Art_id VARCHAR2(3) PRIMARY KEY CHECK (Art_id LIKE 'A%'),
    Art_nm VARCHAR2(20) NOT NULL,
    Art_dob DATE CHECK (Art_dob < DATE '2025-01-01') -- Future date constraint
);

INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A01', 'Suchitra', TO_DATE('15-Jun-1990', 'DD-Mon-YYYY'));
INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A02', 'Talatmahernood', TO_DATE('04-Apr-1992', 'DD-Mon-YYYY'));
INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A03', 'Meera', TO_DATE('22-Oct-1987', 'DD-Mon-YYYY'));
INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A04', 'E aritan', TO_DATE('27-Jul-1990', 'DD-Mon-YYYY'));
INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A05', 'Sukhvindar', TO_DATE('02-Jun-1987', 'DD-Mon-YYYY'));
INSERT INTO Artist (Art_id, Art_nm, Art_dob) VALUES ('A06', 'Chitra', TO_DATE('17-Sep-1989', 'DD-Mon-YYYY'));

CREATE TABLE CD (
    Cd_id VARCHAR2(3) PRIMARY KEY CHECK (Cd_id LIKE 'C%'),
    Art_id VARCHAR2(3),
    Title VARCHAR2(15) NOT NULL,
    Prize NUMBER(5,2) CHECK (Prize > 0),
    Quantity NUMBER(4) CHECK (Quantity > 0),
    Year NUMBER(4) CHECK (Year BETWEEN 2000 AND 2015),
    FOREIGN KEY (Art_id) REFERENCES Artist(Art_id)
);



INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C01', 'A01', 'Mix', 12.33, 100, 2002);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C02', 'A01', 'Magic', 25.45, 75, 2005);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C03', 'A02', 'Broadvision', 10.19, 80, 2010);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C04', 'A02', 'Victor', 30.05, 95, 2001);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C05', 'A03', 'Super System', 25.25, 35, 2000);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C06', 'A03', 'Chocolate', 49.50, 65, 2009);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C07', 'A04', 'The 420', 35.12, 70, 2010);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C08', 'A05', 'Livenation', 20.19, 90, 2008);
INSERT INTO CD (Cd_id, Art_id, Title, Prize, Quantity, Year) VALUES ('C09', 'A06', 'Killer', 20.19, 90, 2004);
