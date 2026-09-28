SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_n NUMBER PROMPT 'Enter limit: '

DECLARE
  v_i NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Using LOOP:');
  v_i := 1;
  LOOP
    EXIT WHEN v_i > &p_n;
    DBMS_OUTPUT.PUT(v_i || ' ');
    v_i := v_i + 1;
  END LOOP;
  DBMS_OUTPUT.NEW_LINE;

  DBMS_OUTPUT.PUT_LINE('Using FOR LOOP:');
  FOR i IN 1..&p_n LOOP
    DBMS_OUTPUT.PUT(i || ' ');
  END LOOP;
  DBMS_OUTPUT.NEW_LINE;

  DBMS_OUTPUT.PUT_LINE('Using WHILE LOOP:');
  v_i := 1;
  WHILE v_i <= &p_n LOOP
    DBMS_OUTPUT.PUT(v_i || ' ');
    v_i := v_i + 1;
  END LOOP;
  DBMS_OUTPUT.NEW_LINE;
END;
/
