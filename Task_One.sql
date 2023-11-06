-- Active: 1699110462151@@127.0.0.1@3306@ecommerce
/* customer = a, Users = b, orders=c*/
SELECT b.`lastName`, a.`user_id`, COUNT(c.`id`) AS `TotalOrder` FROM customers a LEFT JOIN `users` b ON a.user_id=b.id RIGHT JOIN `orders` c ON c.customer_id=a.id ORDER BY `TotalOrder` DESC
