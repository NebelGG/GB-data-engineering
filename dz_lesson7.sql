-- ������� 1 - ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� (orders) � ��������-��������.

-- ������� ���������� �������� ������� orders � �������:

-- ALTER TABLE
-- 	orders 
-- CHANGE COLUMN
-- 	user_id user_id BIGINT(20) UNSIGNED NOT NULL;
-- *

-- ALTER TABLE orders
-- ADD CONSTRAINT fk_user_id
-- 	FOREIGN KEY (user_id)
-- 	REFERENCES users(id)
-- 	ON DELETE RESTRICT
-- 	ON UPDATE RESTRICT;
-- *

-- ALTER TABLE
-- 	orders 
-- CHANGE COLUMN
-- 	catalog_id catalog_id BIGINT(20) UNSIGNED NOT NULL;
-- *

-- ALTER TABLE orders
-- ADD CONSTRAINT fk_catalog_id
-- 	FOREIGN KEY (catalog_id)
-- 	REFERENCES catalogs(id)
-- 	ON DELETE RESTRICT
-- 	ON UPDATE RESTRICT;
-- *

-- 	UPDATE orders
-- 	SET created_at = NOW()
-- 	WHERE created_at is NULL;

-- UPDATE orders
-- 	SET updated_at = NOW()
-- 	WHERE created_at is NULL;
-- *

-- ALTER TABLE
-- 	orders_products 
-- CHANGE COLUMN
-- 	order_id order_id BIGINT(20) UNSIGNED NOT NULL;
-- -- *

-- ALTER TABLE
-- 	orders_products 
-- CHANGE COLUMN
-- 	product_id product_id BIGINT(20) UNSIGNED NOT NULL;
-- -- *

-- ALTER TABLE
-- 	orders_products
-- ADD CONSTRAINT fk_order_id
-- 	FOREIGN KEY(order_id)
-- 	REFERENCES orders(id)
-- 	ON DELETE RESTRICT 
-- 	ON UPDATE RESTRICT;
-- -- *

-- ALTER TABLE
-- 	orders_products
-- ADD CONSTRAINT fk_order_product_id
-- 	FOREIGN KEY(product_id)
-- 	REFERENCES products(id)
-- 	ON DELETE RESTRICT 
-- 	ON UPDATE RESTRICT;
-- *

-- ������� ����� �������������
-- �������� ������� �������� � ��������� �� ���� �������
-- �� ������ ������� ��������� ��������� ����
-- ALTER TABLE orders_products DROP id;
-- ALTER TABLE orders_products 
-- 	DROP PRIMARY KEY,
-- 	ADD PRIMARY KEY(order_id, product_id);
-- *

-- �������� ����. �������(orders) �
-- ����. ������� �������(orders_products) �� ������.
-- INSERT INTO orders(user_id)
-- VALUES (156); -- check == true
-- *

-- INSERT INTO
-- 	orders(user_id)
-- VALUES
-- 	(1), -- ��������
-- 	(3), -- ���������
-- 	(8); -- ����
-- *

-- INSERT INTO
-- 	orders_products(order_id, product_id)
-- VALUES
-- 	(1, 1),
-- 	(1, 1); -- check == true
-- *

-- ������ ���������� ��������
-- INSERT INTO
-- 	orders_products(order_id, product_id)
-- VALUES
-- 	(1, 1),
-- 	(1, 2);
-- *

-- ������ ���������� �����������
-- INSERT INTO
-- 	orders_products(order_id, product_id)
-- VALUES
-- 	(2, 1),
-- 	(2, 2);
-- *

-- ������ ���������� ������
-- INSERT INTO
-- 	orders_products(order_id, product_id, total)
-- VALUES
-- 	(4, 1, 1),
-- 	(4, 4, 3),
-- 	(4, 5, 2);


--  ���������� ������� 1�� �������
SELECT 
	u.id AS user_id, u.name,
	o.id AS order_id
FROM 
	users AS u
RIGHT JOIN
	orders AS o 
ON
	u.id = o.user_id;

-- * ����� ����������� ������� ������� 1* --
SELECT 
	u.id AS user_id, u.name AS user_name,
	op.order_id AS order_id,
	op.product_id AS product_id,
	(SELECT name FROM products WHERE id = op.product_id) AS product_name,
	op.total
FROM 
	users AS u
RIGHT JOIN
	orders AS o 
ON
	u.id = o.user_id
RIGHT JOIN
	orders_products AS op
ON
	o.id = op.order_id
ORDER BY u.name, op.order_id;


-- ������� 2
-- �������� ������ ������� products � �������� catalogs,
 -- ������� ������������� ������.
SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id; 