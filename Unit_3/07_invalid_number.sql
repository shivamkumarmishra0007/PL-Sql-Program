SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_value CHAR PROMPT 'Enter a value to convert to NUMBER: '

DECLARE
  v_num NUMBER;
BEGIN
  v_num := TO_NUMBER('&p_value');
  DBMS_OUTPUT.PUT_LINE('Converted number = ' || v_num);
EXCEPTION
  WHEN INVALID_NUMBER THEN
    DBMS_OUTPUT.PUT_LINE('INVALID_NUMBER: The entered value is not a valid number.');
END;
/
