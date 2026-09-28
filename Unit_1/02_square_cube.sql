SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_num NUMBER PROMPT 'Enter a number: '

DECLARE
  v_square NUMBER;
  v_cube NUMBER;
BEGIN
  v_square := &p_num * &p_num;
  v_cube := &p_num * &p_num * &p_num;
  DBMS_OUTPUT.PUT_LINE('Square = ' || v_square);
  DBMS_OUTPUT.PUT_LINE('Cube   = ' || v_cube);
END;
/
