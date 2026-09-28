SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_num NUMBER PROMPT 'Enter numerator: '
ACCEPT p_den NUMBER PROMPT 'Enter denominator: '

DECLARE
  v_result NUMBER;
BEGIN
  v_result := &p_num / &p_den;
  DBMS_OUTPUT.PUT_LINE('Result = ' || v_result);
EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('ZERO_DIVIDE: Cannot divide by zero.');
END;
/
