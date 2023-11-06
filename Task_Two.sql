-- Active: 1699110462151@@127.0.0.1@3306@ecommerce
/*
products = p
orders_items = o
*/
SELECT p.`name`, o.`order_id`, o.`quantity` AS `Order Quantity`, (o.`quantity` * o.`unit_price`) AS `Total Amount` FROM products p RIGHT JOIN order_otems o ON o.product_id=p.id ORDER BY `Total Amount` ASC