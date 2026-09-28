SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_name CHAR PROMPT 'Enter employee name: '

DECLARE
  v_salary EMP.BASIC_SAL%TYPE;
BEGIN
  SELECT BASIC_SAL INTO v_salary
  FROM EMP
  WHERE UPPER(ENAME) = UPPER('&p_name');

  DBMS_OUTPUT.PUT_LINE('Basic Salary = Rs. ' || v_salary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one employee has that name.');
END;
/
