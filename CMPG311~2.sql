CREATE TABLE MEMBER (
    member_id NUMBER(5) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    phone_number VARCHAR2(15) UNIQUE,
    email VARCHAR2(100) UNIQUE,
    gender CHAR(1),
    date_of_birth DATE,
    address VARCHAR2(150),
    star_ranking NUMBER(1) DEFAULT 0,

    CONSTRAINT chk_gender
    CHECK (gender IN ('M', 'F')),

    CONSTRAINT chk_star_ranking
    CHECK (star_ranking BETWEEN 0 AND 5)
);

CREATE TABLE Membership_Status (
    Status_ID NUMBER(5) PRIMARY KEY,
    Status_Name VARCHAR2(30) NOT NULL UNIQUE
);

CREATE TABLE Membership_Type (
    Membership_Type_ID NUMBER(5) PRIMARY KEY,
    Type_Name VARCHAR2(50) NOT NULL,
    Duration_Months NUMBER(3) NOT NULL,
    Price NUMBER(8,2) NOT NULL,

    CONSTRAINT chk_duration_months
    CHECK (Duration_Months > 0),

    CONSTRAINT chk_price
    CHECK (Price > 0)
);

CREATE TABLE Benefit (
    Benefit_ID NUMBER(5) PRIMARY KEY,
    Benefit_Name VARCHAR2(100) NOT NULL UNIQUE
);

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

    CONSTRAINT fk_employee_manager
    FOREIGN KEY (Manager_ID)
    REFERENCES Employee(Employee_ID),

    CONSTRAINT chk_salary
    CHECK (Salary > 0)
);

CREATE TABLE Trainer (
    Trainer_ID NUMBER(5) PRIMARY KEY,
    Employee_ID NUMBER(5) UNIQUE NOT NULL,
    Specialization VARCHAR2(100),

    CONSTRAINT fk_trainer_employee
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(Employee_ID)
);



CREATE TABLE Expertise (
    Expertise_ID NUMBER(5) PRIMARY KEY,
    Expertise_Name VARCHAR2(100) NOT NULL UNIQUE
);

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

CREATE TABLE Gym_Class (
    Class_ID NUMBER(5) PRIMARY KEY,
    Trainer_ID NUMBER(5) NOT NULL,
    Class_Name VARCHAR2(100) NOT NULL,
    Schedule VARCHAR2(100),
    Max_Capacity NUMBER(3) NOT NULL,

    CONSTRAINT fk_class_trainer
    FOREIGN KEY (Trainer_ID)
    REFERENCES Trainer(Trainer_ID),

    CONSTRAINT chk_max_capacity
    CHECK (Max_Capacity > 0)
);

CREATE TABLE Equipment (
    Equipment_ID NUMBER(5) PRIMARY KEY,
    Equipment_Name VARCHAR2(100) NOT NULL,
    Equipment_Type VARCHAR2(50),
    Purchase_Date DATE,
    Condition_Status VARCHAR2(30),

    CONSTRAINT chk_condition_status
    CHECK (Condition_Status IN ('GOOD', 'DAMAGED', 'UNDER MAINTENANCE'))
);

CREATE TABLE Usage_Record (
    Usage_ID NUMBER(5) PRIMARY KEY,
    Equipment_ID NUMBER(5) NOT NULL,
    Member_ID NUMBER(5) NOT NULL,
    Usage_Date DATE DEFAULT SYSDATE,
    Duration_Minutes NUMBER(5),

    CONSTRAINT fk_usage_equipment
    FOREIGN KEY (Equipment_ID)
    REFERENCES Equipment(Equipment_ID),

    CONSTRAINT fk_usage_member
    FOREIGN KEY (Member_ID)
    REFERENCES Member(Member_ID),

    CONSTRAINT chk_duration_minutes
    CHECK (Duration_Minutes > 0)
);