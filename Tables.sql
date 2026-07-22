/* DROP OLD OBJECTS */

DROP TABLE Trainer_Expertise CASCADE CONSTRAINTS;
DROP TABLE Membership_Type_Benefit CASCADE CONSTRAINTS;
DROP TABLE Usage_Record CASCADE CONSTRAINTS;
DROP TABLE Attendance CASCADE CONSTRAINTS;
DROP TABLE Booking CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Gym_Class CASCADE CONSTRAINTS;
DROP TABLE Trainer CASCADE CONSTRAINTS;
DROP TABLE Expertise CASCADE CONSTRAINTS;
DROP TABLE Equipment CASCADE CONSTRAINTS;
DROP TABLE Membership CASCADE CONSTRAINTS;
DROP TABLE Membership_Type CASCADE CONSTRAINTS;
DROP TABLE Membership_Status CASCADE CONSTRAINTS;
DROP TABLE Benefit CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

DROP SEQUENCE membership_seq;
DROP SEQUENCE booking_seq;
DROP SEQUENCE payment_seq;
DROP SEQUENCE attendance_seq;
DROP SEQUENCE usage_record_seq;


/* MEMBER TABLE */

CREATE TABLE MEMBER (
    Member_ID NUMBER(5) PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone_Number VARCHAR2(15) UNIQUE,
    Address VARCHAR2(150),
    Date_Of_Birth DATE,

    /* Extra attributes from business rules */
    Gender CHAR(1),
    Star_Ranking NUMBER(1) DEFAULT 0,

    CONSTRAINT chk_gender
        CHECK (Gender IN ('M', 'F')),

    CONSTRAINT chk_star_ranking
        CHECK (Star_Ranking BETWEEN 0 AND 5)
);


/* MEMBERSHIP_STATUS TABLE */

CREATE TABLE Membership_Status (
    Status_ID NUMBER(5) PRIMARY KEY,
    Status_Name VARCHAR2(30) NOT NULL UNIQUE
);


/* MEMBERSHIP_TYPE TABLE */

CREATE TABLE Membership_Type (
    Membership_Type_ID NUMBER(5) PRIMARY KEY,
    Type_Name VARCHAR2(50) NOT NULL UNIQUE,
    Duration_Months NUMBER(3) NOT NULL,
    Price NUMBER(8,2) NOT NULL,

    CONSTRAINT chk_duration_months
        CHECK (Duration_Months > 0),

    CONSTRAINT chk_price
        CHECK (Price > 0)
);


/* MEMBERSHIP TABLE */

CREATE TABLE Membership (
    Membership_ID NUMBER(5) PRIMARY KEY,
    Member_ID NUMBER(5) NOT NULL,
    Membership_Type_ID NUMBER(5) NOT NULL,
    Status_ID NUMBER(5) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,

    CONSTRAINT chk_membership_dates
        CHECK (End_Date >= Start_Date),

    CONSTRAINT fk_membership_member
        FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID),

    CONSTRAINT fk_membership_type
        FOREIGN KEY (Membership_Type_ID)
        REFERENCES Membership_Type(Membership_Type_ID),

    CONSTRAINT fk_membership_status
        FOREIGN KEY (Status_ID)
        REFERENCES Membership_Status(Status_ID)
);


/* BENEFIT TABLE */

CREATE TABLE Benefit (
    Benefit_ID NUMBER(5) PRIMARY KEY,
    Benefit_Name VARCHAR2(100) NOT NULL UNIQUE
);


/* MEMBERSHIP_TYPE_BENEFIT TABLE */

CREATE TABLE Membership_Type_Benefit (
    Membership_Type_ID NUMBER(5),
    Benefit_ID NUMBER(5),

    CONSTRAINT pk_membership_type_benefit
        PRIMARY KEY (Membership_Type_ID, Benefit_ID),

    CONSTRAINT fk_mtb_membership_type
        FOREIGN KEY (Membership_Type_ID)
        REFERENCES Membership_Type(Membership_Type_ID),

    CONSTRAINT fk_mtb_benefit
        FOREIGN KEY (Benefit_ID)
        REFERENCES Benefit(Benefit_ID)
);


/* EMPLOYEE TABLE */

CREATE TABLE Employee (
    Employee_ID NUMBER(5) PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Phone_Number VARCHAR2(15) UNIQUE,
    Email VARCHAR2(100) UNIQUE,
    Hire_Date DATE NOT NULL,
    Salary NUMBER(10,2),
    Role VARCHAR2(50),
    Manager_ID NUMBER(5),

    CONSTRAINT chk_salary
        CHECK (Salary > 0),

    CONSTRAINT chk_employee_role
        CHECK (Role IN
        ('Trainer', 'Manager',
         'Receptionist', 'Cleaner')),

    CONSTRAINT fk_employee_manager
        FOREIGN KEY (Manager_ID)
        REFERENCES Employee(Employee_ID)
);


/* TRAINER TABLE */

CREATE TABLE Trainer (
    Trainer_ID NUMBER(5) PRIMARY KEY,
    Employee_ID NUMBER(5) UNIQUE NOT NULL,
    Specialization VARCHAR2(100),

    CONSTRAINT fk_trainer_employee
        FOREIGN KEY (Employee_ID)
        REFERENCES Employee(Employee_ID)
);


/* EXPERTISE TABLE */

CREATE TABLE Expertise (
    Expertise_ID NUMBER(5) PRIMARY KEY,
    Expertise_Name VARCHAR2(100) NOT NULL UNIQUE
);


/* TRAINER_EXPERTISE TABLE */

CREATE TABLE Trainer_Expertise (
    Trainer_ID NUMBER(5),
    Expertise_ID NUMBER(5),

    CONSTRAINT pk_trainer_expertise
        PRIMARY KEY (Trainer_ID, Expertise_ID),

    CONSTRAINT fk_te_trainer
        FOREIGN KEY (Trainer_ID)
        REFERENCES Trainer(Trainer_ID),

    CONSTRAINT fk_te_expertise
        FOREIGN KEY (Expertise_ID)
        REFERENCES Expertise(Expertise_ID)
);


/* GYM_CLASS TABLE */

CREATE TABLE Gym_Class (
    Class_ID NUMBER(5) PRIMARY KEY,
    Trainer_ID NUMBER(5) NOT NULL,
    Class_Name VARCHAR2(100) NOT NULL UNIQUE,
    Schedule VARCHAR2(100),
    Max_Capacity NUMBER(3) NOT NULL,

    CONSTRAINT chk_max_capacity
        CHECK (Max_Capacity > 0),

    CONSTRAINT fk_class_trainer
        FOREIGN KEY (Trainer_ID)
        REFERENCES Trainer(Trainer_ID)
);


/* EQUIPMENT TABLE */

CREATE TABLE Equipment (
    Equipment_ID NUMBER(5) PRIMARY KEY,
    Equipment_Name VARCHAR2(100) NOT NULL,
    Equipment_Type VARCHAR2(50),
    Purchase_Date DATE,
    Condition_Status VARCHAR2(30) DEFAULT 'GOOD',

    CONSTRAINT chk_condition_status
        CHECK (Condition_Status IN
        ('GOOD', 'DAMAGED', 'UNDER MAINTENANCE'))
);


/* USAGE_RECORD TABLE */

CREATE TABLE Usage_Record (
    Usage_ID NUMBER(5) PRIMARY KEY,
    Equipment_ID NUMBER(5) NOT NULL,
    Member_ID NUMBER(5) NOT NULL,
    Usage_Date DATE DEFAULT SYSDATE,
    Duration_Minutes NUMBER(5),

    CONSTRAINT chk_duration_minutes
        CHECK (Duration_Minutes > 0),

    CONSTRAINT fk_usage_equipment
        FOREIGN KEY (Equipment_ID)
        REFERENCES Equipment(Equipment_ID),

    CONSTRAINT fk_usage_member
        FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID)
);


/* ATTENDANCE TABLE */

CREATE TABLE Attendance (
    Attendance_ID NUMBER(5) PRIMARY KEY,
    Member_ID NUMBER(5) NOT NULL,
    Class_ID NUMBER(5),
    Attendance_Date DATE NOT NULL,
    Attendance_Time TIMESTAMP NOT NULL,

    CONSTRAINT fk_attendance_member
        FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID),

    CONSTRAINT fk_attendance_class
        FOREIGN KEY (Class_ID)
        REFERENCES Gym_Class(Class_ID)
);


/* BOOKING TABLE */

CREATE TABLE Booking (
    Booking_ID NUMBER(5) PRIMARY KEY,
    Member_ID NUMBER(5) NOT NULL,
    Class_ID NUMBER(5) NOT NULL,
    Booking_Date DATE NOT NULL,
    Booking_Status VARCHAR2(30) DEFAULT 'PENDING',

    CONSTRAINT chk_booking_status
        CHECK (Booking_Status IN
        ('CONFIRMED', 'PENDING', 'CANCELLED')),

    CONSTRAINT fk_booking_member
        FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID),

    CONSTRAINT fk_booking_class
        FOREIGN KEY (Class_ID)
        REFERENCES Gym_Class(Class_ID)
);


/* PAYMENT TABLE */

CREATE TABLE Payment (
    Payment_ID NUMBER(5) PRIMARY KEY,
    Member_ID NUMBER(5) NOT NULL,
    Amount NUMBER(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR2(50) NOT NULL,

    CONSTRAINT chk_payment_amount
        CHECK (Amount >= 0),

    CONSTRAINT chk_payment_method
        CHECK (Payment_Method IN
        ('Cash', 'Card', 'EFT')),

    CONSTRAINT fk_payment_member
        FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID)
);


/* SEQUENCES TABLE */

CREATE SEQUENCE membership_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE booking_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE payment_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE attendance_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE usage_record_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


/* MEMBERSHIP TRIGGER TABLE */

CREATE OR REPLACE TRIGGER membership_trigger
BEFORE INSERT ON Membership
FOR EACH ROW
BEGIN
    IF :NEW.Membership_ID IS NULL THEN
        SELECT membership_seq.NEXTVAL
        INTO :NEW.Membership_ID
        FROM DUAL;
    END IF;
END;
/

/* BOOKING TRIGGER TABLE */

CREATE OR REPLACE TRIGGER booking_trigger
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    IF :NEW.Booking_ID IS NULL THEN
        SELECT booking_seq.NEXTVAL
        INTO :NEW.Booking_ID
        FROM DUAL;
    END IF;
END;
/

/* PAYMENT TRIGGER TABLE */

CREATE OR REPLACE TRIGGER payment_trigger
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    IF :NEW.Payment_ID IS NULL THEN
        SELECT payment_seq.NEXTVAL
        INTO :NEW.Payment_ID
        FROM DUAL;
    END IF;
END;
/

/* ATTENDANCE TRIGGER TABLE */

CREATE OR REPLACE TRIGGER attendance_trigger
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN
    IF :NEW.Attendance_ID IS NULL THEN
        SELECT attendance_seq.NEXTVAL
        INTO :NEW.Attendance_ID
        FROM DUAL;
    END IF;
END;
/

/* USAGE_RECORD TRIGGER TABLE */

CREATE OR REPLACE TRIGGER usage_record_trigger
BEFORE INSERT ON Usage_Record
FOR EACH ROW
BEGIN
    IF :NEW.Usage_ID IS NULL THEN
        SELECT usage_record_seq.NEXTVAL
        INTO :NEW.Usage_ID
        FROM DUAL;
    END IF;
END;
/