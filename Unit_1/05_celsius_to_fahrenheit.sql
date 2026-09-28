SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_celsius NUMBER PROMPT 'Enter temperature in Celsius: '

BEGIN
  DBMS_OUTPUT.PUT_LINE('Fahrenheit = ' || ((&p_celsius * 9/5) + 32));
END;
/
