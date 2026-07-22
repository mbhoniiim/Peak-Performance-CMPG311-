SET DEFINE OFF;


/* MEMBER */

INSERT INTO MEMBER
(Member_ID, First_Name, Last_Name, Email,
 Phone_Number, Address, Date_Of_Birth,
 Gender, Star_Ranking)
VALUES
(1, 'John', 'Smith', 'john.smith@email.com',
'0712340001', '12 Oak Street, Johannesburg',
TO_DATE('1990-05-14','YYYY-MM-DD'),
'M', 4);

INSERT INTO MEMBER
(Member_ID, First_Name, Last_Name, Email,
 Phone_Number, Address, Date_Of_Birth,
 Gender, Star_Ranking)
VALUES
(2, 'Sarah', 'Johnson', 'sarah.johnson@email.com',
'0712340002', '45 Pine Avenue, Pretoria',
TO_DATE('1988-11-22','YYYY-MM-DD'),
'F', 5);

INSERT INTO MEMBER
(Member_ID, First_Name, Last_Name, Email,
 Phone_Number, Address, Date_Of_Birth,
 Gender, Star_Ranking)
VALUES
(3, 'Michael', 'Brown', 'michael.brown@email.com',
'0712340003', '78 Cedar Road, Durban',
TO_DATE('1992-03-09','YYYY-MM-DD'),
'M', 3);

INSERT INTO MEMBER
(Member_ID, First_Name, Last_Name, Email,
 Phone_Number, Address, Date_Of_Birth,
 Gender, Star_Ranking)
VALUES
(4, 'Emily', 'Davis', 'emily.davis@email.com',
'0712340004', '23 Maple Drive, Cape Town',
TO_DATE('1995-07-18','YYYY-MM-DD'),
'F', 4);

INSERT INTO MEMBER
(Member_ID, First_Name, Last_Name, Email,
 Phone_Number, Address, Date_Of_Birth,
 Gender, Star_Ranking)
VALUES
(5, 'Daniel', 'Wilson', 'daniel.wilson@email.com',
'0712340005', '90 Birch Lane, Bloemfontein',
TO_DATE('1987-01-30','YYYY-MM-DD'),
'M', 5);


/* MEMBERSHIP_STATUS */

INSERT INTO Membership_Status VALUES (1, 'Active');
INSERT INTO Membership_Status VALUES (2, 'Expired');
INSERT INTO Membership_Status VALUES (3, 'Cancelled');
INSERT INTO Membership_Status VALUES (4, 'Suspended');
INSERT INTO Membership_Status VALUES (5, 'Pending');


/* MEMBERSHIP_TYPE */

INSERT INTO Membership_Type VALUES
(1, 'Basic', 12, 299.99);

INSERT INTO Membership_Type VALUES
(2, 'Premium', 12, 499.99);

INSERT INTO Membership_Type VALUES
(3, 'VIP', 12, 799.99);

INSERT INTO Membership_Type VALUES
(4, 'Student', 6, 149.99);

INSERT INTO Membership_Type VALUES
(5, 'Day Pass', 1, 19.99);


/* BENEFIT */

INSERT INTO Benefit VALUES (1, 'Gym Access');
INSERT INTO Benefit VALUES (2, 'Locker Room Access');
INSERT INTO Benefit VALUES (3, 'Group Classes');
INSERT INTO Benefit VALUES (4, 'Sauna Access');
INSERT INTO Benefit VALUES (5, 'Personal Trainer Sessions');


/* EMPLOYEE */

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name,
 Phone_Number, Email, Hire_Date,
 Salary, Role, Manager_ID)
VALUES
(1, 'Michael', 'Adams',
'0715551001', 'michael.adams@gym.com',
TO_DATE('2023-01-15','YYYY-MM-DD'),
35000, 'Trainer', NULL);

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name,
 Phone_Number, Email, Hire_Date,
 Salary, Role, Manager_ID)
VALUES
(2, 'Sarah', 'Williams',
'0715551002', 'sarah.williams@gym.com',
TO_DATE('2023-03-10','YYYY-MM-DD'),
34000, 'Trainer', NULL);

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name,
 Phone_Number, Email, Hire_Date,
 Salary, Role, Manager_ID)
VALUES
(3, 'David', 'Nkosi',
'0715551003', 'david.nkosi@gym.com',
TO_DATE('2023-04-05','YYYY-MM-DD'),
36000, 'Trainer', NULL);

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name,
 Phone_Number, Email, Hire_Date,
 Salary, Role, Manager_ID)
VALUES
(4, 'Jessica', 'Brown',
'0715551004', 'jessica.brown@gym.com',
TO_DATE('2023-06-20','YYYY-MM-DD'),
33000, 'Trainer', NULL);

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name,
 Phone_Number, Email, Hire_Date,
 Salary, Role, Manager_ID)
VALUES
(5, 'Chris', 'Daniels',
'0715551005', 'chris.daniels@gym.com',
TO_DATE('2023-08-15','YYYY-MM-DD'),
34500, 'Trainer', NULL);


/* TRAINER */

INSERT INTO Trainer
(Trainer_ID, Employee_ID, Specialization)
VALUES
(1, 1, 'Strength Training');

INSERT INTO Trainer
(Trainer_ID, Employee_ID, Specialization)
VALUES
(2, 2, 'Weight Loss & Cardio');

INSERT INTO Trainer
(Trainer_ID, Employee_ID, Specialization)
VALUES
(3, 3, 'Bodybuilding');

INSERT INTO Trainer
(Trainer_ID, Employee_ID, Specialization)
VALUES
(4, 4, 'Yoga & Flexibility');

INSERT INTO Trainer
(Trainer_ID, Employee_ID, Specialization)
VALUES
(5, 5, 'CrossFit & HIIT');


/* EXPERTISE */

INSERT INTO Expertise VALUES (1, 'Strength Training');
INSERT INTO Expertise VALUES (2, 'Weight Loss');
INSERT INTO Expertise VALUES (3, 'Cardio');
INSERT INTO Expertise VALUES (4, 'Bodybuilding');
INSERT INTO Expertise VALUES (5, 'Yoga');


/* EQUIPMENT */

INSERT INTO Equipment VALUES
(1, 'Treadmill', 'Cardio',
TO_DATE('2024-01-10','YYYY-MM-DD'),
'GOOD');

INSERT INTO Equipment VALUES
(2, 'Bench Press', 'Strength',
TO_DATE('2024-02-15','YYYY-MM-DD'),
'GOOD');

INSERT INTO Equipment VALUES
(3, 'Exercise Bike', 'Cardio',
TO_DATE('2024-03-01','YYYY-MM-DD'),
'GOOD');

INSERT INTO Equipment VALUES
(4, 'Elliptical Machine', 'Cardio',
TO_DATE('2024-01-20','YYYY-MM-DD'),
'GOOD');

INSERT INTO Equipment VALUES
(5, 'Squat Rack', 'Strength',
TO_DATE('2024-02-10','YYYY-MM-DD'),
'GOOD');


/* MEMBERSHIP */

INSERT INTO Membership
(Member_ID, Membership_Type_ID,
 Status_ID, Start_Date, End_Date)
VALUES
(1, 1, 1,
TO_DATE('2025-01-01','YYYY-MM-DD'),
TO_DATE('2025-12-31','YYYY-MM-DD'));

INSERT INTO Membership
(Member_ID, Membership_Type_ID,
 Status_ID, Start_Date, End_Date)
VALUES
(2, 2, 1,
TO_DATE('2025-01-02','YYYY-MM-DD'),
TO_DATE('2025-12-31','YYYY-MM-DD'));

INSERT INTO Membership
(Member_ID, Membership_Type_ID,
 Status_ID, Start_Date, End_Date)
VALUES
(3, 3, 1,
TO_DATE('2025-01-03','YYYY-MM-DD'),
TO_DATE('2025-12-31','YYYY-MM-DD'));

INSERT INTO Membership
(Member_ID, Membership_Type_ID,
 Status_ID, Start_Date, End_Date)
VALUES
(4, 1, 1,
TO_DATE('2025-01-04','YYYY-MM-DD'),
TO_DATE('2025-12-31','YYYY-MM-DD'));

INSERT INTO Membership
(Member_ID, Membership_Type_ID,
 Status_ID, Start_Date, End_Date)
VALUES
(5, 2, 1,
TO_DATE('2025-01-05','YYYY-MM-DD'),
TO_DATE('2025-12-31','YYYY-MM-DD'));


/* MEMBERSHIP_TYPE_BENEFIT */

INSERT INTO Membership_Type_Benefit VALUES (1,1);
INSERT INTO Membership_Type_Benefit VALUES (1,2);

INSERT INTO Membership_Type_Benefit VALUES (2,1);
INSERT INTO Membership_Type_Benefit VALUES (2,2);
INSERT INTO Membership_Type_Benefit VALUES (2,3);

INSERT INTO Membership_Type_Benefit VALUES (3,1);
INSERT INTO Membership_Type_Benefit VALUES (3,2);
INSERT INTO Membership_Type_Benefit VALUES (3,3);
INSERT INTO Membership_Type_Benefit VALUES (3,4);
INSERT INTO Membership_Type_Benefit VALUES (3,5);


/* TRAINER_EXPERTISE */

INSERT INTO Trainer_Expertise VALUES (1,1);
INSERT INTO Trainer_Expertise VALUES (2,2);
INSERT INTO Trainer_Expertise VALUES (2,3);
INSERT INTO Trainer_Expertise VALUES (3,4);
INSERT INTO Trainer_Expertise VALUES (4,5);


/* GYM_CLASS */

INSERT INTO Gym_Class
(Class_ID, Trainer_ID, Class_Name,
 Schedule, Max_Capacity)
VALUES
(1, 4, 'Yoga',
'Monday 08:00-09:00', 20);

INSERT INTO Gym_Class
(Class_ID, Trainer_ID, Class_Name,
 Schedule, Max_Capacity)
VALUES
(2, 4, 'Pilates',
'Monday 09:00-10:00', 15);

INSERT INTO Gym_Class
(Class_ID, Trainer_ID, Class_Name,
 Schedule, Max_Capacity)
VALUES
(3, 5, 'HIIT Training',
'Tuesday 10:00-11:00', 25);

INSERT INTO Gym_Class
(Class_ID, Trainer_ID, Class_Name,
 Schedule, Max_Capacity)
VALUES
(4, 1, 'Strength & Conditioning',
'Wednesday 12:00-13:00', 20);

INSERT INTO Gym_Class
(Class_ID, Trainer_ID, Class_Name,
 Schedule, Max_Capacity)
VALUES
(5, 2, 'Zumba',
'Wednesday 13:00-14:00', 35);


/* BOOKING */

INSERT INTO Booking
(Member_ID, Class_ID,
 Booking_Date, Booking_Status)
VALUES
(1, 1,
TO_DATE('2025-05-01','YYYY-MM-DD'),
'CONFIRMED');

INSERT INTO Booking
(Member_ID, Class_ID,
 Booking_Date, Booking_Status)
VALUES
(2, 2,
TO_DATE('2025-05-01','YYYY-MM-DD'),
'CONFIRMED');

INSERT INTO Booking
(Member_ID, Class_ID,
 Booking_Date, Booking_Status)
VALUES
(3, 3,
TO_DATE('2025-05-01','YYYY-MM-DD'),
'PENDING');

INSERT INTO Booking
(Member_ID, Class_ID,
 Booking_Date, Booking_Status)
VALUES
(4, 4,
TO_DATE('2025-05-02','YYYY-MM-DD'),
'CANCELLED');

INSERT INTO Booking
(Member_ID, Class_ID,
 Booking_Date, Booking_Status)
VALUES
(5, 5,
TO_DATE('2025-05-02','YYYY-MM-DD'),
'CONFIRMED');


/* PAYMENT */

INSERT INTO Payment
(Member_ID, Amount,
 Payment_Date, Payment_Method)
VALUES
(1, 299.99,
TO_DATE('2025-01-01','YYYY-MM-DD'),
'Card');

INSERT INTO Payment
(Member_ID, Amount,
 Payment_Date, Payment_Method)
VALUES
(2, 499.99,
TO_DATE('2025-01-02','YYYY-MM-DD'),
'EFT');

INSERT INTO Payment
(Member_ID, Amount,
 Payment_Date, Payment_Method)
VALUES
(3, 799.99,
TO_DATE('2025-01-03','YYYY-MM-DD'),
'Cash');

INSERT INTO Payment
(Member_ID, Amount,
 Payment_Date, Payment_Method)
VALUES
(4, 299.99,
TO_DATE('2025-01-04','YYYY-MM-DD'),
'Card');

INSERT INTO Payment
(Member_ID, Amount,
 Payment_Date, Payment_Method)
VALUES
(5, 499.99,
TO_DATE('2025-01-05','YYYY-MM-DD'),
'EFT');


/* ATTENDANCE */

INSERT INTO Attendance
(Member_ID, Class_ID,
 Attendance_Date, Attendance_Time)
VALUES
(1, 1,
TO_DATE('2025-05-01','YYYY-MM-DD'),
TO_TIMESTAMP('2025-05-01 06:00:00',
'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Attendance
(Member_ID, Class_ID,
 Attendance_Date, Attendance_Time)
VALUES
(2, 2,
TO_DATE('2025-05-01','YYYY-MM-DD'),
TO_TIMESTAMP('2025-05-01 06:15:00',
'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Attendance
(Member_ID, Class_ID,
 Attendance_Date, Attendance_Time)
VALUES
(3, 3,
TO_DATE('2025-05-01','YYYY-MM-DD'),
TO_TIMESTAMP('2025-05-01 06:30:00',
'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Attendance
(Member_ID, Class_ID,
 Attendance_Date, Attendance_Time)
VALUES
(4, NULL,
TO_DATE('2025-05-02','YYYY-MM-DD'),
TO_TIMESTAMP('2025-05-02 07:00:00',
'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Attendance
(Member_ID, Class_ID,
 Attendance_Date, Attendance_Time)
VALUES
(5, 5,
TO_DATE('2025-05-02','YYYY-MM-DD'),
TO_TIMESTAMP('2025-05-02 07:30:00',
'YYYY-MM-DD HH24:MI:SS'));


/* USAGE_RECORD */

INSERT INTO Usage_Record
(Equipment_ID, Member_ID,
 Usage_Date, Duration_Minutes)
VALUES
(1, 1,
TO_DATE('2025-05-01','YYYY-MM-DD'),
45);

INSERT INTO Usage_Record
(Equipment_ID, Member_ID,
 Usage_Date, Duration_Minutes)
VALUES
(2, 2,
TO_DATE('2025-05-01','YYYY-MM-DD'),
30);

INSERT INTO Usage_Record
(Equipment_ID, Member_ID,
 Usage_Date, Duration_Minutes)
VALUES
(3, 3,
TO_DATE('2025-05-02','YYYY-MM-DD'),
60);

INSERT INTO Usage_Record
(Equipment_ID, Member_ID,
 Usage_Date, Duration_Minutes)
VALUES
(4, 4,
TO_DATE('2025-05-02','YYYY-MM-DD'),
40);

INSERT INTO Usage_Record
(Equipment_ID, Member_ID,
 Usage_Date, Duration_Minutes)
VALUES
(5, 5,
TO_DATE('2025-05-03','YYYY-MM-DD'),
50);


COMMIT;