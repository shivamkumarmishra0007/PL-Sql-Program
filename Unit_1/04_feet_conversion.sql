SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_feet NUMBER PROMPT 'Enter measurement in feet: '

DECLARE
  v_feet NUMBER := &p_feet;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Centimeters = ' || (v_feet * 30.48));
  DBMS_OUTPUT.PUT_LINE('Inches      = ' || (v_feet * 12));
  DBMS_OUTPUT.PUT_LINE('Meters      = ' || (v_feet * 0.3048));
END;
/
