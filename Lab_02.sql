USE northwind_dw;

CREATE TABLE fact_orders_2
AS
SELECT o.id AS order_id
	, o.employee_id
    , o.customer_id
	, o.order_date
	, o.shipped_date
	, o.shipper_id
	, o.shipping_fee
	, o.taxes
	, o.payment_type
	, o.paid_date
	, o.notes
    , o.tax_rate
	, o.tax_status_id
	, o.status_id
	, os.status_name AS order_status 
    , ods.status_name AS order_details_status
FROM northwind.orders AS o
INNER JOIN northwind.orders_status AS os
ON o.status_id = os.id
INNER JOIN northwind.order_details AS od
ON o.id = od.order_id
INNER JOIN northwind.order_details_status AS ods
ON od.status_id = ods.id;




SELECT * FROM northwind_dw.fact_orders_2;

TRUNCATE TABLE northwind_dw.fact_orders_2;


## this sumbmission combines the two parts of the lab, I have kept the orginial copies 
#that seperate the parts so that I can use them for notes!