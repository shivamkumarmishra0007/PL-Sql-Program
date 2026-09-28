SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_eid NUMBER PROMPT 'Enter EID: '
ACCEPT p_percent NUMBER PROMPT 'Enter salary increase percentage: '

BEGIN
  UPDATE EMP
  SET BASIC_SAL = BASIC_SAL + (BASIC_SAL * &p_percent / 100)
  WHERE EID = &p_eid;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Employee updated. Rows affected = ' || SQL%ROWCOUNT);
    COMMIT;
  END IF;
END;
/
