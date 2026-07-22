/** INDEXES **/ 

CREATE INDEX idx_membership_member ON Membership(Member_ID);
CREATE INDEX idx_membership_type ON Membership(Membership_Type_ID);
CREATE INDEX idx_membership_status ON Membership(Status_ID);
CREATE INDEX idx_booking_member ON Booking(Member_ID);
CREATE INDEX idx_booking_class ON Booking(Class_ID);
CREATE INDEX idx_booking_date ON Booking(Booking_Date);
CREATE INDEX idx_attendance_member ON Attendance(Member_ID);
CREATE INDEX idx_attendance_class ON Attendance(Class_ID);
CREATE INDEX idx_attendance_date ON Attendance(Attendance_Date);
CREATE INDEX idx_payment_member ON Payment(Member_ID);
CREATE INDEX idx_payment_date ON Payment(Payment_Date);
CREATE INDEX idx_usage_member ON Usage_Record(Member_ID);
CREATE INDEX idx_usage_equipment ON Usage_Record(Equipment_ID);
CREATE INDEX idx_gym_class_trainer ON Gym_Class(Trainer_ID);
CREATE INDEX idx_member_email ON MEMBER(Email);
CREATE INDEX idx_member_phone ON MEMBER(Phone_Number);
CREATE INDEX idx_membership_end_date ON Membership(End_Date);

/** VIEWS **/

CREATE OR REPLACE VIEW Active_Members_View AS
SELECT m.Member_ID, m.First_Name, m.Last_Name, m.Email, m.Phone_Number,
       mt.Type_Name AS Membership_Type, ms.Start_Date, ms.End_Date
FROM MEMBER m
JOIN Membership ms ON m.Member_ID = ms.Member_ID
JOIN Membership_Type mt ON ms.Membership_Type_ID = mt.Membership_Type_ID
WHERE ms.End_Date > SYSDATE AND ms.Status_ID = 1;

CREATE OR REPLACE VIEW Class_Schedule_View AS
SELECT gc.Class_ID, gc.Class_Name, gc.Schedule, gc.Max_Capacity,
       e.First_Name AS Trainer_First, e.Last_Name AS Trainer_Last,
       t.Specialization
FROM Gym_Class gc
JOIN Trainer t ON gc.Trainer_ID = t.Trainer_ID
JOIN Employee e ON t.Employee_ID = e.Employee_ID;

CREATE OR REPLACE VIEW Member_Payment_Summary AS
SELECT m.Member_ID, m.First_Name, m.Last_Name,
       COUNT(p.Payment_ID) AS Total_Payments,
       SUM(p.Amount) AS Total_Spent,
       MAX(p.Payment_Date) AS Last_Payment_Date
FROM MEMBER m
LEFT JOIN Payment p ON m.Member_ID = p.Member_ID
GROUP BY m.Member_ID, m.First_Name, m.Last_Name;

/** EXTRA FUNCTIONALITY: Capacity Trigger **/

CREATE OR REPLACE TRIGGER check_booking_capacity
BEFORE INSERT ON Booking
FOR EACH ROW
DECLARE
    v_current_count NUMBER;
    v_max_capacity NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_current_count
    FROM Booking
    WHERE Class_ID = :NEW.Class_ID
    AND Booking_Status = 'CONFIRMED';
    
    SELECT Max_Capacity INTO v_max_capacity
    FROM Gym_Class
    WHERE Class_ID = :NEW.Class_ID;
    
    IF v_current_count >= v_max_capacity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Class is full! Cannot book.');
    END IF;
END;
/

/** EXTRA FUNCTIONALITY: Renewal Procedure **/

CREATE OR REPLACE PROCEDURE Renew_Membership(
    p_Member_ID IN NUMBER,
    p_New_Membership_Type_ID IN NUMBER
) AS
    v_duration_months NUMBER;
BEGIN
    /** Get duration of new membership **/
    SELECT Duration_Months INTO v_duration_months
    FROM Membership_Type
    WHERE Membership_Type_ID = p_New_Membership_Type_ID;
    
    /** Update existing membership to Expired **/
    UPDATE Membership
    SET Status_ID = 2
    WHERE Member_ID = p_Member_ID AND Status_ID = 1;
    
    /** Insert new membership **/
    INSERT INTO Membership (Member_ID, Membership_Type_ID, Status_ID, Start_Date, End_Date)
    VALUES (p_Member_ID, p_New_Membership_Type_ID, 1, SYSDATE, ADD_MONTHS(SYSDATE, v_duration_months));
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Membership renewed for Member ID: ' || p_Member_ID);
END;
/