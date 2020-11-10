--Q1
--returns user names containing Ka in the name born in a day 08
SELECT *
FROM inst_user iu
WHERE iu.user_DOB LIKE '%08%' AND iu.user_name LIKE '%Ka%'

--Q2
--returns users renting guitar model 'M03899'
SELECT *
FROM inst_user iu
JOIN inst_rent ir ON iu.user_id=ir.rent_user_id
WHERE ir.`rent_inst_no`  = '7081434'

--Q3
--returns user name renting guitar from '2020-11-06 00:00:00'
SELECT *
FROM inst_user iu
JOIN inst_rent ir ON ir.rent_user_id=iu.user_id
WHERE ir.`rent_from_date` = '2020-11-06 00:00:00'

--Q4
--returns instruments to be picked up in store that contains Wall
SELECT *
FROM inst_locations ils
JOIN inst_instrument_location il ON ils.location_zip = il.location_zip
WHERE ils.location_address
LIKE '%Wall%'

--Q5
--returns Gibson guitars
SELECT *
FROM inst_instrument ins
JOIN inst_manuf im ON ins.manuf_id=im.manuf_id
WHERE im.manuf_brand  = 'Gibson'

-----------------------------------------------------------
-----------------------------------------------------------------------------------
--Q6
--Return nr. of instruments with 
SELECT *
FROM inst_instrument ins
JOIN inst_color ico ON ins.color_id=ico.color_id
WHERE ico.color_name  = 'Cherry'


--Q7
--Return nr. of successful payments

SELECT COUNT(payment_status)
FROM inst_payment
WHERE payment_status='Successful';
----------------------------------------------------------------------------
--------------------------------------------------------------------------------------



--Q8
-- Returns the payment status of the product with the highest price

SELECT payment_status,MAX(price)
FROM inst_payment ip
WHERE ip.price = ( 
	SELECT MAX(price)
	FROM inst_payment ip
	)

--Q9
-- Returns the last ordered product after 06 November for each product_no
SELECT inst_no, MAX(ir.rent_from_date) AS last_order_date
FROM inst_rent ir
GROUP BY ir.rent_from_date
HAVING last_order_date> '2020-11-06 00:00:00';


