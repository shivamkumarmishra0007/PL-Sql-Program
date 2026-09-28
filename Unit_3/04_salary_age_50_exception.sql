SET SERVEROUTPUT ON

DECLARE
  v_salary EMP.BASIC_SAL%TYPE;
BEGIN
  SELECT BASIC_SAL
  INTO v_salary
  FROM EMP
  WHERE AGE = 50;

  DBMS_OUTPUT.PUT_LINE('Salary of employee aged 50 = Rs. ' || v_salary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee with age 50 found.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one employee has age 50.');
END;
/
