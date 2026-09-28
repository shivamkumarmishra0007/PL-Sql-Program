SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_deptno NUMBER PROMPT 'Enter department number: '

DECLARE
  CURSOR c_emp IS
    SELECT EID, ENAME, DEPTNO, DEPTNAME, GENDER, AGE, BASIC_SAL, COMMISSION
    FROM EMP
    WHERE DEPTNO = &p_deptno;

  v_count NUMBER := 0;
  no_dept_found EXCEPTION;
BEGIN
  FOR r IN c_emp LOOP
    INSERT INTO EMP_BACKUP(EID,ENAME,DEPTNO,DEPTNAME,GENDER,AGE,BASIC_SAL,COMMISSION)
    VALUES (r.EID,r.ENAME,r.DEPTNO,r.DEPTNAME,r.GENDER,r.AGE,r.BASIC_SAL,r.COMMISSION);
    v_count := v_count + 1;
  END LOOP;

  IF v_count = 0 THEN
    RAISE no_dept_found;
  END IF;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) copied to EMP_BACKUP.');
EXCEPTION
  WHEN no_dept_found THEN
    DBMS_OUTPUT.PUT_LINE('NO_DEPT_FOUND: No employee exists for department ' || &p_deptno);
END;
/
