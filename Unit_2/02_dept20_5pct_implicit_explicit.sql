SET SERVEROUTPUT ON

PROMPT --- Explicit cursor: %ISOPEN and %NOTFOUND ---
DECLARE
  CURSOR c_emp IS
    SELECT EID, BASIC_SAL
    FROM EMP
    WHERE DEPTNO = 20
    FOR UPDATE OF BASIC_SAL;

  v_eid EMP.EID%TYPE;
  v_basic EMP.BASIC_SAL%TYPE;
  v_found BOOLEAN := FALSE;
BEGIN
  OPEN c_emp;
  DBMS_OUTPUT.PUT_LINE('Cursor open = ' || CASE WHEN c_emp%ISOPEN THEN 'TRUE' ELSE 'FALSE' END);

  LOOP
    FETCH c_emp INTO v_eid, v_basic;
    EXIT WHEN c_emp%NOTFOUND;
    v_found := TRUE;

    UPDATE EMP
    SET BASIC_SAL = BASIC_SAL * 1.05
    WHERE CURRENT OF c_emp;

    INSERT INTO EMP_UPDATE(EID,OLD_SAL,NEW_SAL)
    VALUES (v_eid,v_basic,v_basic * 1.05);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Cursor NOTFOUND = ' || CASE WHEN c_emp%NOTFOUND THEN 'TRUE' ELSE 'FALSE' END);
  CLOSE c_emp;

  IF v_found THEN
    DBMS_OUTPUT.PUT_LINE('Department 20 employees updated by 5%.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
  END IF;

  COMMIT;
END;
/

PROMPT --- Implicit cursor demonstration ---
BEGIN
  UPDATE EMP
  SET BASIC_SAL = BASIC_SAL
  WHERE DEPTNO = 20;

  DBMS_OUTPUT.PUT_LINE('Implicit cursor SQL%ROWCOUNT = ' || SQL%ROWCOUNT);
END;
/
