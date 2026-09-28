SET SERVEROUTPUT ON

DECLARE
  CURSOR c_emp(p_deptno EMP.DEPTNO%TYPE) IS
    SELECT EID, ENAME, BASIC_SAL
    FROM EMP
    WHERE DEPTNO = p_deptno
    ORDER BY EID;

  v_total_basic NUMBER;
  v_total_gross NUMBER;
  v_gross NUMBER;
BEGIN
  FOR d IN (SELECT DISTINCT DEPTNO FROM EMP ORDER BY DEPTNO) LOOP
    v_total_basic := 0;
    v_total_gross := 0;

    DBMS_OUTPUT.PUT_LINE('--- Department ' || d.DEPTNO || ' ---');

    FOR e IN c_emp(d.DEPTNO) LOOP
      v_gross := e.BASIC_SAL + (e.BASIC_SAL * 0.50) +
                 (e.BASIC_SAL * 0.15) + 500 - (e.BASIC_SAL * 0.10);
      v_total_basic := v_total_basic + e.BASIC_SAL;
      v_total_gross := v_total_gross + v_gross;

      DBMS_OUTPUT.PUT_LINE(
        e.EID || ' | ' || e.ENAME ||
        ' | Basic=' || e.BASIC_SAL ||
        ' | Gross=' || v_gross
      );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Department Total Basic = ' || v_total_basic);
    DBMS_OUTPUT.PUT_LINE('Department Total Gross = ' || v_total_gross);
  END LOOP;
END;
/
