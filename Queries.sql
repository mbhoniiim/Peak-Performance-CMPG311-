/** 1. Member Profile **/
SELECT First_Name, Last_Name, Phone_Number FROM MEMBER;

/** 2. Trainer Expertise **/
SELECT Trainer_ID, Specialization FROM Trainer;

/** 3. Active Membership Check **/
SELECT m.First_Name, m.Last_Name, ms.End_Date
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
WHERE ms.End_Date > SYSDATE;

/** 4. Emergency Contact List **/
SELECT First_Name, Last_Name, Address, Phone_Number FROM MEMBER;

/** 5. Role Breakdown **/
SELECT Role, COUNT(*) AS Employee_Count FROM Employee GROUP BY Role;

/** 6. Class Capacity Status **/
SELECT Class_Name, Max_Capacity FROM Gym_Class;

/** 7. Payment Audit **/
SELECT Payment_ID, Payment_Method, Amount, Payment_Date FROM Payment;

/** 8. Trainer Load **/
SELECT t.Trainer_ID, gc.Class_Name
FROM Trainer t
JOIN Gym_Class gc ON t.Trainer_ID = gc.Trainer_ID;

/** 9. Benefit Catalog for Premium **/
SELECT b.Benefit_Name
FROM Benefit b
JOIN Membership_Type_Benefit mtb ON b.Benefit_ID = mtb.Benefit_ID
WHERE mtb.Membership_Type_ID = 2;

/** 10. Equipment Condition **/
SELECT Equipment_Name, Condition_Status FROM Equipment;

/** 1. Recent Joiners **/
SELECT First_Name, Email FROM MEMBER WHERE ROWNUM <= 10 ORDER BY Member_ID DESC;

/** 2. Top Paid Staff **/
SELECT First_Name, Last_Name, Salary FROM Employee WHERE ROWNUM <= 3 ORDER BY Salary DESC;

/** 3. Quick Booking View **/
SELECT Member_ID, Booking_Date FROM Booking WHERE ROWNUM <= 20;

/** 4. Limited Equipment View **/
SELECT Equipment_Name FROM Equipment WHERE ROWNUM <= 5;

/** 1. Schedule Timeline **/
SELECT Class_Name, Schedule FROM Gym_Class ORDER BY Schedule;

/** 2. Member Birthdays **/
SELECT First_Name, Last_Name, Date_Of_Birth FROM MEMBER ORDER BY Date_Of_Birth;

/** 3. Highest Payments **/
SELECT Payment_ID, Amount FROM Payment ORDER BY Amount DESC;

/** 4. Experience Sort **/
SELECT First_Name, Last_Name, Hire_Date FROM Employee ORDER BY Hire_Date;

/** 1. Strength Focus **/
SELECT Class_Name FROM Gym_Class WHERE Class_Name LIKE '%Strength%';

/** 2. Specific Providers **/
SELECT First_Name, Last_Name, Email FROM MEMBER WHERE Email LIKE '%gmail.com' OR Email LIKE '%outlook.com';

/** 3. High-Value/Long-Term **/
SELECT Type_Name, Price, Duration_Months FROM Membership_Type WHERE Price > 500 AND Duration_Months = 12;

/** 4. Search by Initial **/
SELECT First_Name, Last_Name FROM Employee WHERE First_Name LIKE 'S%';

/** 1. Formal Name **/
SELECT CONCAT(CONCAT(Last_Name, ', '), First_Name) AS Formal_Name FROM MEMBER;

/** 2. Email Cleanup **/
SELECT LOWER(Email) AS Clean_Email FROM MEMBER;

/** 3. Short Specialization **/
SELECT SUBSTR(Specialization, 1, 10) AS Short_Specialization FROM Trainer;

/** 4. Username Generation **/
SELECT SUBSTR(First_Name, 1, 3) || Member_ID AS Username FROM MEMBER;

/** 1. Daily Equivalent **/
SELECT Price, ROUND(Price / 30, 2) AS Daily_Equivalent FROM Membership_Type;

/** 2. Staff Salary Truncation **/
SELECT First_Name, Last_Name, TRUNC(Salary) AS Truncated_Salary FROM Employee;

/** 3. Average Class Duration **/
SELECT AVG(Duration_Minutes) AS Avg_Minutes, ROUND(AVG(Duration_Minutes)/60, 1) AS Avg_Hours FROM Usage_Record;

/** 4. VAT Calculation **/
SELECT Amount, ROUND(Amount * 0.15, 2) AS VAT, ROUND(Amount * 1.15, 2) AS Total_Inc_VAT FROM Payment;

/** 1. Membership Aging **/
SELECT Membership_ID, (End_Date - Start_Date) AS Days_Active FROM Membership;

/** 2. Payment Month **/
SELECT Payment_ID, TO_CHAR(Payment_Date, 'Month') AS Payment_Month FROM Payment;

/** 3. Contract Reminders **/
SELECT m.First_Name, m.Last_Name, ms.End_Date
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
WHERE ms.End_Date = SYSDATE + 7;

/** 4. Attendance Day **/
SELECT TO_CHAR(Attendance_Date, 'DY') AS Day_Name, COUNT(*) AS Attendance_Count
FROM Attendance
GROUP BY TO_CHAR(Attendance_Date, 'DY')
ORDER BY Attendance_Count DESC;

/** 1. Total Revenue **/
SELECT SUM(Amount) AS Total_Revenue FROM Payment;

/** 2. Active Member Count **/
SELECT COUNT(DISTINCT m.Member_ID) AS Active_Members
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
WHERE ms.End_Date > SYSDATE;

/** 3. Average Member Age **/
SELECT AVG(MONTHS_BETWEEN(SYSDATE, Date_Of_Birth)/12) AS Avg_Age FROM MEMBER;

/**  4. Minimum Price **/
SELECT MIN(Price) AS Cheapest_Plan_Price FROM Membership_Type;

/** 1. Popularity Check **/
SELECT gc.Class_Name, COUNT(b.Booking_ID) AS Booking_Count
FROM Gym_Class gc
LEFT JOIN Booking b ON gc.Class_ID = b.Class_ID
GROUP BY gc.Class_Name
ORDER BY Booking_Count DESC;

/** 2. Staffing Needs (Peak Hours) **/
SELECT TO_CHAR(Attendance_Time, 'HH24') AS Hour, COUNT(*) AS Attendance_Count
FROM Attendance
GROUP BY TO_CHAR(Attendance_Time, 'HH24')
ORDER BY Attendance_Count DESC;

/** 3. High-Activity Members **/
SELECT Member_ID, COUNT(*) AS Visit_Count
FROM Attendance
GROUP BY Member_ID
HAVING COUNT(*) > 15;

/** 4. Revenue by Method **/
SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method
ORDER BY Total_Amount DESC;

/** 1. Booking Confirmation (Today's Bookings) **/
SELECT m.First_Name, m.Last_Name, gc.Class_Name, b.Booking_Date
FROM Booking b
JOIN MEMBER m ON b.Member_ID = m.Member_ID
JOIN Gym_Class gc ON b.Class_ID = gc.Class_ID
WHERE TRUNC(b.Booking_Date) = TRUNC(SYSDATE);

/** 2. Trainer Class List (Yoga) **/
SELECT t.Trainer_ID, e.First_Name, e.Last_Name, gc.Class_Name
FROM Trainer t
JOIN Employee e ON t.Employee_ID = e.Employee_ID
JOIN Gym_Class gc ON t.Trainer_ID = gc.Trainer_ID
WHERE gc.Class_Name = 'Yoga';

/** 3. Member Plan Details **/
SELECT m.First_Name, m.Last_Name, mt.Type_Name, mt.Price
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
JOIN Membership_Type mt ON ms.Membership_Type_ID = mt.Membership_Type_ID;

/** 4. Usage Audit **/
SELECT e.Equipment_Name, m.First_Name, m.Last_Name, ur.Duration_Minutes
FROM Usage_Record ur
JOIN Equipment e ON ur.Equipment_ID = e.Equipment_ID
JOIN MEMBER m ON ur.Member_ID = m.Member_ID
ORDER BY ur.Duration_Minutes DESC;

/** 5. Benefit Access for Member ID 1 **/
SELECT DISTINCT b.Benefit_Name
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
JOIN Membership_Type mt ON ms.Membership_Type_ID = mt.Membership_Type_ID
JOIN Membership_Type_Benefit mtb ON mt.Membership_Type_ID = mtb.Membership_Type_ID
JOIN Benefit b ON mtb.Benefit_ID = b.Benefit_ID
WHERE m.Member_ID = 1;

/** 1. Underpaid Trainers **/
SELECT e.First_Name, e.Last_Name, e.Salary
FROM Employee e
JOIN Trainer t ON e.Employee_ID = t.Employee_ID
WHERE e.Salary < (SELECT AVG(Salary) FROM Employee);

/** 2. Ghost Members (Paid but Zero Attendance) **/
SELECT DISTINCT m.Member_ID, m.First_Name, m.Last_Name
FROM MEMBER m
JOIN Payment p ON m.Member_ID = p.Member_ID
WHERE m.Member_ID NOT IN (SELECT DISTINCT Member_ID FROM Attendance);

/** 3. Max Attendance Streak (Star Ranking Candidate) **/
SELECT Member_ID, COUNT(*) AS Attendance_Count
FROM Attendance
GROUP BY Member_ID
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM Attendance GROUP BY Member_ID);

/** 4. Over-capacity Risk **/
SELECT gc.Class_ID, gc.Class_Name, gc.Max_Capacity, COUNT(b.Booking_ID) AS Bookings
FROM Gym_Class gc
JOIN Booking b ON gc.Class_ID = b.Class_ID
GROUP BY gc.Class_ID, gc.Class_Name, gc.Max_Capacity
HAVING COUNT(b.Booking_ID) = gc.Max_Capacity;

/** 5. Recent Active Payers (Paid and Attended Same Month) **/
SELECT DISTINCT m.Member_ID, m.First_Name, m.Last_Name
FROM MEMBER m
WHERE EXISTS (
    SELECT 1 FROM Payment p
    WHERE p.Member_ID = m.Member_ID
    AND EXISTS (
        SELECT 1 FROM Attendance a
        WHERE a.Member_ID = m.Member_ID
        AND TO_CHAR(a.Attendance_Date, 'YYYY-MM') = TO_CHAR(p.Payment_Date, 'YYYY-MM')
    )
);

