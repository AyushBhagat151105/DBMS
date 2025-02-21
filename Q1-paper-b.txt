CREATE TABLE Project (
    Pid VARCHAR2(4) PRIMARY KEY CHECK (Pid LIKE 'P%'),
    Pname VARCHAR2(35) NOT NULL,
    Pstart_dt DATE NOT NULL,
    Pend_dt DATE NOT NULL,
    CONSTRAINT chk_pend_dt CHECK (Pend_dt > Pstart_dt) -- Table-level constraint
);

INSERT INTO Project VALUES ('P001', 'School Management System', TO_DATE('01-Jun-07', 'DD-Mon-YY'), TO_DATE('31-Mar-08', 'DD-Mon-YY'));
INSERT INTO Project VALUES ('P002', 'Hospital Management System', TO_DATE('05-May-08', 'DD-Mon-YY'), TO_DATE('28-Feb-09', 'DD-Mon-YY'));
INSERT INTO Project VALUES ('P003', 'Mobile info system', TO_DATE('01-Jan-08', 'DD-Mon-YY'), TO_DATE('08-Jan-09', 'DD-Mon-YY'));
INSERT INTO Project VALUES ('P004', 'Website development system', TO_DATE('04-Apr-08', 'DD-Mon-YY'), TO_DATE('01-Nov-09', 'DD-Mon-YY'));
INSERT INTO Project VALUES ('P005', 'Java tutorial', TO_DATE('01-Dec-08', 'DD-Mon-YY'), TO_DATE('25-Dec-09', 'DD-Mon-YY'));



CREATE TABLE StudXXX (
    Sid VARCHAR2(4) PRIMARY KEY CHECK (Sid LIKE 'S%'),
    Sname VARCHAR2(20) NOT NULL,
    Class VARCHAR2(5) CHECK (Class IN ('TYBCA', 'TYIS')),
    Pid VARCHAR2(4),
    CONSTRAINT fk_project FOREIGN KEY (Pid) REFERENCES Project(Pid)
);

INSERT INTO StudXXX VALUES ('S001', 'Nayan Jani', 'TYIS', 'P001');
INSERT INTO StudXXX VALUES ('S002', 'Jay Mehata', 'TYIS', 'P002');
INSERT INTO StudXXX VALUES ('S003', 'Ami Shah', 'TYBCA', 'P001');
INSERT INTO StudXXX VALUES ('S004', 'Vijay Solanki', 'TYIS', 'P003');
INSERT INTO StudXXX VALUES ('S005', 'Meena Patel', 'TYBCA', 'P004');
INSERT INTO StudXXX VALUES ('S006', 'Kamya Patel', 'TYBCA', 'P002');
INSERT INTO StudXXX VALUES ('S007', 'Charmi Patel', 'TYIS', 'P004');
INSERT INTO StudXXX VALUES ('S008', 'Mitul Nagar', 'TYIS', 'P003');
INSERT INTO StudXXX VALUES ('S009', 'Purvi Shah', 'TYBCA', 'P005');
INSERT INTO StudXXX VALUES ('S010', 'Jayesh Patel', 'TYBCA', 'P005');

