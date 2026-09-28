SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_eid NUMBER PROMPT 'Enter EID: '

DECLARE
  v_basic EMP.BASIC_SAL%TYPE;
  v_hra NUMBER;
  v_da NUMBER;
  v_medical NUMBER := 500;
  v_pf NUMBER;
  v_gross NUMBER;
BEGIN
  SELECT BASIC_SAL INTO v_basic FROM EMP WHERE EID = &p_eid;
  v_hra := v_basic * 15 / 100;
  v_da := v_basic * 50 / 100;
  v_pf := v_basic * 10 / 100;
  v_gross := v_basic + v_da + v_hra + v_medical - v_pf;

  DBMS_OUTPUT.PUT_LINE('Basic Salary = Rs. ' || v_basic);
  DBMS_OUTPUT.PUT_LINE('HRA          = Rs. ' || v_hra);
  DBMS_OUTPUT.PUT_LINE('DA           = Rs. ' || v_da);
  DBMS_OUTPUT.PUT_LINE('Medical      = Rs. ' || v_medical);
  DBMS_OUTPUT.PUT_LINE('PF           = Rs. ' || v_pf);
  DBMS_OUTPUT.PUT_LINE('Gross Salary = Rs. ' || v_gross);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
