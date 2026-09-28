SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_principal NUMBER PROMPT 'Enter principal amount: '
ACCEPT p_rate NUMBER PROMPT 'Enter rate of interest (%): '
ACCEPT p_years NUMBER PROMPT 'Enter number of years: '

DECLARE
  v_si NUMBER(12,2);
BEGIN
  v_si := (&p_principal * &p_rate * &p_years) / 100;
  DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || v_si);
END;
/
