SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_name CHAR PROMPT 'Enter student name: '

DECLARE
  v_roll RESULT.ROLLNO%TYPE;
  v_total RESULT.TOTAL%TYPE;
  v_per RESULT.PER%TYPE;
  v_grade RESULT.GRADE%TYPE;
BEGIN
  SELECT ROLLNO,TOTAL,PER,GRADE
  INTO v_roll,v_total,v_per,v_grade
  FROM RESULT
  WHERE UPPER(NAME) = UPPER('&p_name');

  DBMS_OUTPUT.PUT_LINE('Rollno     = ' || v_roll);
  DBMS_OUTPUT.PUT_LINE('Total      = ' || v_total);
  DBMS_OUTPUT.PUT_LINE('Percentage = ' || v_per);
  DBMS_OUTPUT.PUT_LINE('Grade      = ' || v_grade);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Student not found.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one student has that name.');
END;
/
