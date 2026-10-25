 CREATE DATABASE myDB

 USE myDB;

 CREATE TABLE users(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    mobile VARCHAR(50) NOT NULL,
    otp VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );

 --changed an attributes 
ALTER TABLE `users` 
	CHANGE `otp` `otp` varchar(50) NOT NULL DEFAULT '0' ;

 CREATE TABLE categories(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    
    user_id BIGINT(20) NOT NULL,
    Foreign Key (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,

    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );


 --add column 
 ALTER TABLE `categories` ADD COLUMN `name` VARCHAR(255) NOT NULL ;


 CREATE TABLE customers(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    mobile VARCHAR(50) NOT NULL,

    user_id BIGINT(20) NOT NULL,
    Foreign Key (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,

    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );


 CREATE TABLE products(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    img_url VARCHAR(50) NOT NULL,
    price VARCHAR(50) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    user_id BIGINT(20) NOT NULL,
    category_id BIGINT(20) NOT NULL,
    Foreign Key (category_id) REFERENCES categories(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );
ALTER TABLE products DROP COLUMN email;
 
 CREATE TABLE invoices(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    user_id BIGINT(20) NOT NULL,
    customer_id BIGINT(20) NOT NULL,
    Foreign Key (customer_id) REFERENCES customers(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    total VARCHAR(50) NOT NULL,
    discount VARCHAR(50) NOT NULL,
    vat VARCHAR(50) NOT NULL,
    payable VARCHAR(50) NOT NULL,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );

 CREATE TABLE invoice_products(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    user_id BIGINT(20) NOT NULL,
    product_id BIGINT(20) NOT NULL,
    invoice_id BIGINT(20) NOT NULL,

    Foreign Key (invoice_id) REFERENCES invoices(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (product_id) REFERENCES products(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (user_id) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE,

    qty VARCHAR(50) NOT NULL,
    sale_price VARCHAR(50) NOT NULL,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    updated_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP() NOT NULL ON UPDATE CURRENT_TIMESTAMP()
 );


-- Data insert

INSERT INTO users
(firstname,lastname,email,mobile,password)
VALUES
    ('naimur','rahman','naimur@ex.com','0188','12345'),
    ('naimur','rahman','rahman@ex.com','0188','12345')


-- check existis

SELECT count(*) from users WHERE email='naimur@ex.com' and password='12345';

-- delete users
DELETE from users WHERE email='naimur@ex.com';


-- update users
UPDATE users 
SET mobile='1099'
WHERE email='naimur@ex.com';


INSERT INTO categories
(name,user_id)
VALUES
   ('electronis',4),
   ('gorceries',4),
   ('furnitures',4),
   ('books',4),
   ('cars',4)

select * from categories;


--can use for searching 
select * from categories WHERE name LIKE '%elec%';
select name from categories ORDER BY name asc


INSERT INTO products 
(user_id,category_id,name,price,unit,img_url)
VALUES
(4,6,'smartphone','20000','1','img.com'),
(4,7,'rice','20000','1','img.com'),
(4,8,'sofa','20000','2','img.com'),
(5,9,'Tom','20000','20','img.com'),
(5,10,'BMW','20000','1','img.com')

SELECT COUNT(*) from products;
SELECT name from products WHERE unit=(SELECT MAX(unit) from products);

-- Inner Join
select p.name, p.id ,c.name AS category_name from products p
INNER JOIN categories c
ON c.id = p.category_id;

SELECT SUM(price) from products AS total_ammount; --deriver attribute 'total_ammount'


