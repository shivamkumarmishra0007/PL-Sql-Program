SET SERVEROUTPUT ON

DECLARE
  CURSOR c_customer IS
    SELECT CUSTOMER_ID, CUSTOMER_NAME, CITY, PHONE
    FROM CUSTOMER
    ORDER BY CUSTOMER_ID;

  v_id CUSTOMER.CUSTOMER_ID%TYPE;
  v_name CUSTOMER.CUSTOMER_NAME%TYPE;
  v_city CUSTOMER.CITY%TYPE;
  v_phone CUSTOMER.PHONE%TYPE;
BEGIN
  OPEN c_customer;
  LOOP
    FETCH c_customer INTO v_id, v_name, v_city, v_phone;
    EXIT WHEN c_customer%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_id || ' | ' || v_name || ' | ' || v_city || ' | ' || v_phone);
  END LOOP;
  CLOSE c_customer;
END;
/
