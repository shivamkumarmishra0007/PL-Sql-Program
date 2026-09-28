SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_product CHAR PROMPT 'Enter product name: '
ACCEPT p_qty NUMBER PROMPT 'Enter quantity: '
ACCEPT p_price NUMBER PROMPT 'Enter price per unit: '
ACCEPT p_discount NUMBER PROMPT 'Enter discount percentage: '

DECLARE
  v_product VARCHAR2(100) := '&p_product';
  v_qty NUMBER := &p_qty;
  v_price NUMBER := &p_price;
  v_discount_pct NUMBER := &p_discount;
  v_amount NUMBER;
  v_discount NUMBER;
BEGIN
  v_amount := v_qty * v_price;
  v_discount := v_amount * v_discount_pct / 100;
  DBMS_OUTPUT.PUT_LINE('Product       = ' || v_product);
  DBMS_OUTPUT.PUT_LINE('Gross Amount  = Rs. ' || v_amount);
  DBMS_OUTPUT.PUT_LINE('Discount      = Rs. ' || v_discount);
  DBMS_OUTPUT.PUT_LINE('Net Amount    = Rs. ' || (v_amount - v_discount));
END;
/
