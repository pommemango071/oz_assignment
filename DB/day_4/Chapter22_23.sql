-- 1. CREATE: 25문제
-- (1) customer 테이블에 새 고객 추가
INSERT INTO customers (customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
VALUES ('500', 'Hyonee Stores. Inc', 'Hyonee', 'Kim', '123 1234 111', 'A Street', 'AA', 'NYC', 'NY', '77777', 'USA', '1800', '90000');

-- (2) products 테이블에 새 제품 추가
INSERT INTO products (productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP)
VALUES ('S800_111', 'Ford Model B', 'Vintage Cars', '1:20', 'Unimax Art Galleries', 'This model features...', '7000', '55.55', '100.77');

-- (3) employees 테이블에 새 직원 추가
INSERT INTO employees(employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
VALUES ('1800', 'Danny', 'Joe', 'x1111', 'Danny@danny.com', '7','1143', 'Sales Rep');

-- (4) offices 테이블에 새 사무실 추가
INSERT INTO offices (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
VALUES ('8', 'Cairo', '+20 2 1234567', '89 Tahrir Square', 'Cairo', NULL, 'Egypt', '11511', 'Africa');

-- (5) orders 테이블에 새 주문 추가
INSERT INTO orders (orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber)
VALUES ('10500', '2005-06-01', '2005-07-01', NULL, 'In Process', NULL, '500');

-- (6) orderdetails 테이블에 주문 상세 정보 추가
INSERT INTO orderdetails (orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber)
VALUES ('10500', 'S800_111', '50', '55.55', '20');

-- (7) payments 테이블에서 지불 정보 추가
INSERT INTO payments (customerNumber,checkNumber,paymentDate,amount)
VALUES ('500', 'KI777777', '2006-07-01', '70000.56');

-- (8) productlines 테이블에 제품 라인 추가
INSERT INTO productlines (productLine,textDescription,htmlDescription,image)
VALUES ('A type Cars', 'A type Cars are...', NULL, NULL);

-- (9) customers 테이블에 다른 지역 고객 추가
INSERT INTO customers (customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
VALUES ('501', 'Jenny Stores. Inc', 'Jenny', 'Young', '321 4321 111', 'B Street', 'BB', 'BBB', 'Nairobi', '77777', 'Kenya', '1702', '50000');

-- (10) products 테이블에 다른 카테고리 제품 추가
INSERT INTO products (productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP)
VALUES ('S800_222', 'Train ABC', 'Trains', '1:20', 'Trainrbox Collectibles', 'This train features...', '300', '100.60', '44.77');

-- 2. READ: 25문제

-- (1) customers 테이블 모든 고객 정보 조회
SELECT * FROM customers;

-- (2) products 테이블 모든 제품 목록 조회
SELECT * FROM products;

-- (3) employees 테이블 모든 직원이름과 직급 조회
SELECT lastName,firstName,jobTitle FROM employees;

-- (4) offices 테이블 모든 사무실 위치 조회
SELECT city,state,country FROM offices;

-- (5) orders 테이블 최근 10개 주문 조회
SELECT * FROM orders
ORDER BY orderDate DESC
LIMIT 10;

-- (6) orderdetails 테이블 특정 주문의 모든 상세 정보 조회
SELECT * FROM orderdetails WHERE orderNumber = '10500';

-- (7) payments 테이블 특정 고객 모든 지불 정보 조회
SELECT * FROM payments WHERE customerNumber = '500';

-- (8) productlines 테이블 각 제품 라인의 설명 조회
SELECT productLine, textDescription FROM productlines;

-- (9) customers 테이블 특정 지역의 고객 조회
SELECT * FROM customers WHERE city = 'NYC';

-- (10) products 테이블 특정 가격 범위의 제품 조회
SELECT * FROM products WHERE buyPrice BETWEEN 50 AND 100;

-- 3. UPDATE: 25문제
-- (1) customers 테이블 특정 고객 주소 갱신
UPDATE customers SET addressLine1 = 'C street' WHERE customerNumber = '500';

-- (2) products 테이블 특정 제품 가격 갱신
UPDATE products SET buyPrice = '77.77' WHERE productCode = 'S800_111';

-- (3) employees 테이블 특정 직원의 직급 갱신
UPDATE employees SET jobTitle = 'Sales Manager (NA)' WHERE employeeNumber = '1800';

-- (4) offices 테이블 특정 사무실의 전화번호 갱신
UPDATE offices SET phone = '+20 7 7654321' WHERE officeCode = '8';

-- (5) orders 테이블 특정 주문의 상태 갱신
UPDATE orders SET status = 'Shipped' WHERE orderNumber = '10500';

-- (6) orderdetails 테이블 특정 주문 상세 수량 갱신
UPDATE orderdetails SET quantityOrdered = '40' WHERE orderNumber = '10500';

-- (7) payments 테이블 특정 지불의 금액 갱신
UPDATE payments SET amount = '50000.22' WHERE customerNumber = '500';

-- (8) productlines 테이블 특정 제품 라인의 설명 갱신
UPDATE productlines SET textDescription = 'A type Cars feature...' WHERE productLine = 'A type Cars';

-- (9) employees 테이블 특정 고객의 이메일 갱신 => customers에는 고객 이메일 컬럼이 없으므로 employees로 바꿈.
UPDATE employees SET email = 'Danny111@danny.com' WHERE employeeNumber = '1800';

-- (10) products 테이블 여러 제품의 가격 한번에 갱신
SET SQL_SAFE_UPDATES = 0;
UPDATE products SET buyPrice = buyPrice * 1.2 ;

-- 4. DELETE: 25문제
-- (1) customers 테이블 특정 고객 삭제
DELETE FROM customers WHERE customerNumber = '501';

-- (2) products 테이블 특정 제품 삭제
DELETE FROM products WHERE productCode = 'S800_222';

-- (3) employees 테이블 특정 직원 삭제
DELETE FROM employees WHERE employeeNumber = '1800';

-- (4) offices 테이블 특정 사무실 삭제
DELETE FROM offices WHERE officeCode = '4';

-- (5) orders 테이블 특정 주문 삭제
DELETE FROM orders WHERE orderNumber = '10423';

-- (6) orderdetails 테이블 특정 주문 상세 삭제
DELETE FROM orderdetails WHERE orderNumber = '10205';

-- (7) payments 테이블 특정 지불 내역 삭제
DELETE FROM payments WHERE customerNumber = '487';

-- (8) productlines 테이블 특정 제품 라인 삭제
DELETE FROM productlines WHERE productLine = 'Trains';

-- (9) customers 테이블 특정 지역의 모든 고객 삭제
DELETE FROM customers WHERE city = 'Nantes';

-- (10) products 테이블 특정 카테고리 모든 제품 삭제
DELETE FROM products WHERE productLine = 'Trucks and Buses';

