-- 문제 1번. 
INSERT INTO users (first_name, last_name, email, gender, password, address, contact)
VALUES ("Hyonee", "Kim", "Hyonee@hyonee.com", "female", "0000", "AAA", "111-222-333");


-- 문제 2번.
UPDATE users SET address = "BBB" WHERE id=304;


-- 문제 3번. 
-- sales_records 데이터 생성
INSERT INTO sales_records (user_id) VALUES (304);


-- sales_items 데이터 생성 (LIMIT는 중복 데이터가 생겨버려 사용)
INSERT INTO sales_items (sales_record_id, product_id, quantity)
VALUES (751,
 (SELECT id FROM products WHERE name="Red Bean Bun" LIMIT 1),
 3);

INSERT INTO sales_items (sales_record_id, product_id, quantity)
VALUES (751,
 (SELECT id FROM products WHERE name="Fish Bun" LIMIT 1),
2);
 
INSERT INTO sales_items (sales_record_id, product_id, quantity)
VALUES (751,
 (SELECT id FROM products WHERE name="Chocolate Bun" LIMIT 1),
5);


-- 문제 4번.
INSERT INTO order_records (user_id, raw_material_id, quantity)
VALUES (304, 4 , 10);

INSERT INTO order_records (user_id, raw_material_id, quantity)
VALUES (304, 5, 20);

INSERT INTO order_records (user_id, raw_material_id, quantity)
VALUES (304, 6, 30);

-- 문제 5번...
-- 1) 원재료 사용 이력 3건 추가
INSERT INTO daily_records (stock_id, change_quantity, change_type)
VALUES (4, (SELECT quantity FROM stocks WHERE id = 4) + 5, "IN");

INSERT INTO daily_records (stock_id, change_quantity, change_type)
VALUES (5, (SELECT quantity FROM stocks WHERE id = 5) - 11, "OUT");

INSERT INTO daily_records (stock_id, change_quantity, change_type)
VALUES (6, (SELECT quantity FROM stocks WHERE id = 6) - 7, "OUT");

-- 2) 변동 재고 stocks 테이블 반영..
UPDATE stocks SET quantity = quantity + 5 WHERE id = 4;
UPDATE stocks SET quantity = quantity - 11 WHERE id = 5;
UPDATE stocks SET quantity = quantity - 7 WHERE id = 6;

-- 문제 6번.
SELECT
	sr.id AS sales_record_id,
	sr.created_at,
    u.first_name,
    u.last_name,
    si.product_id,
    SUM(si.quantity) AS total_quantity,
    p.price
FROM 
    sales_items AS si
JOIN 
    sales_records AS sr ON si.sales_record_id = sr.id
JOIN 
    users AS u ON sr.user_id = u.id
JOIN 
    products AS p ON si.product_id = p.id
WHERE 
    u.id = 304
GROUP BY 
    si.product_id, sr.id, sr.created_at, u.first_name, u.last_name, p.price
ORDER BY 
    p.price DESC;
    



