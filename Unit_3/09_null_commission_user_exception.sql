SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_eid NUMBER PROMPT 'Enter EID: '

DECLARE
  v_commission EMP.COMMISSION%TYPE;
  null_commission EXCEPTION;
BEGIN
  SELECT COMMISSION INTO v_commission
  FROM EMP
  WHERE EID = &p_eid;

  IF v_commission IS NULL THEN
    RAISE null_commission;
  END IF;

  DBMS_OUTPUT.PUT_LINE('Commission = Rs. ' || v_commission);
EXCEPTION
  WHEN null_commission THEN
    DBMS_OUTPUT.PUT_LINE('NULL_COMMISSION: Commission is NULL for this employee.');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
