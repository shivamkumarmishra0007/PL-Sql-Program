SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_eid NUMBER PROMPT 'Enter EID to delete: '

BEGIN
  DELETE FROM EMP WHERE EID = &p_eid;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No employee found for EID ' || &p_eid);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Employee deleted successfully.');
    COMMIT;
  END IF;
END;
/
