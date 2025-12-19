CREATE TABLE custome_order_payments as
SELECT c.*, 
o.order_id, 
o.order_status, 
o.order_purchase_timestamp,
o.order_delivered_customer_date, 
op.payment_type, 
op.payment_installments,
op.payment_value,
ot.	order_item_id,
ot.product_id,
ot.seller_id,
ot.price,
ot.freight_value,
r.review_id,
r.review_score,
r.review_creation_date,
p.product_category_name as product_category_name_pt,
p.product_weight_g,
s.seller_zip_code_prefix,
s.seller_city,
s.seller_state,
cn.product_category_name as product_category_name_original,
cn.product_category_name_english
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
LEFT JOIN order_payments op
ON o.order_id = op.order_id
LEFT JOIN order_item ot
ON o.order_id = ot.order_id
LEFT JOIN order_reviews r
ON ot.order_id = r.order_id
LEFT JOIN products p
ON ot.product_id = p.product_id
LEFT JOIN sellers s
ON ot.seller_id = s.seller_id
LEFT JOIN product_category_name_translation cn
	ON p.product_category_name = cn.product_category_name;
	
ALTER custome_order_payments
RENAME TO customer_order_payments;

DELETE 	customer_order_payments
WHERE payment_value = 0;

se
select * from customer_order_payments;
