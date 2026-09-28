SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_rollno NUMBER PROMPT 'Enter Rollno: '

DECLARE
  v_name RESULT.NAME%TYPE;
  v_total RESULT.TOTAL%TYPE;
  v_per RESULT.PER%TYPE;
  v_grade RESULT.GRADE%TYPE;
  v_sub1 RESULT.SUB1%TYPE;
  v_sub2 RESULT.SUB2%TYPE;
  v_sub3 RESULT.SUB3%TYPE;
  v_sub4 RESULT.SUB4%TYPE;
  v_sub5 RESULT.SUB5%TYPE;
BEGIN
  SELECT NAME,SUB1,SUB2,SUB3,SUB4,SUB5
  INTO v_name,v_sub1,v_sub2,v_sub3,v_sub4,v_sub5
  FROM RESULT
  WHERE ROLLNO = &p_rollno;

  v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5;
  v_per := v_total / 5;

  v_grade := CASE
    WHEN v_per >= 90 THEN 'A+'
    WHEN v_per >= 80 THEN 'A'
    WHEN v_per >= 70 THEN 'B'
    WHEN v_per >= 60 THEN 'C'
    WHEN v_per >= 50 THEN 'D'
    ELSE 'F'
  END;

  UPDATE RESULT
  SET TOTAL = v_total, PER = v_per, GRADE = v_grade
  WHERE ROLLNO = &p_rollno;
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Name       = ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Total      = ' || v_total);
  DBMS_OUTPUT.PUT_LINE('Percentage = ' || v_per);
  DBMS_OUTPUT.PUT_LINE('Grade      = ' || v_grade);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No student found for Rollno ' || &p_rollno);
END;
/
