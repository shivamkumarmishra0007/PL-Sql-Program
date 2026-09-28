SET SERVEROUTPUT ON

BEGIN
  UPDATE EMP
  SET BASIC_SAL = BASIC_SAL * 1.10
  WHERE DEPTNO = 10;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No employees found in department 10.');
  ELSE
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) received a 10% raise.');
    COMMIT;
  END IF;
END;
/
