---------#1(175)
DROP TABLE IF EXISTS Person, Address;
CREATE TABLE Person (
    personId INT PRIMARY KEY,
    firstName VARCHAR(255),
  	lastName VARCHAR(255)
);

CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);

INSERT INTO Person VALUES 
(1, 'Allen', 'Wang'),
(2, 'Bob', 'Alice');

INSERT INTO Address VALUES 
(1, 2, 'New York', 'NY'),
(2, 3, 'Leetcode', 'CA');


SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

---------#2 (595)
DROP TABLE IF EXISTS World;
CREATE TABLE World (
  name VARCHAR(255) PRIMARY KEY,
  continent VARCHAR(255),
  area INT,
  population INT,
  gdp BIGINT
  );
  
  INSERT INTO World VALUES 
  ('Afghanistan', 'Asia', 6652230, 25500100, 20343000000),
  ('Albania', 'Europe', 28748, 2831741, 12960000000),
  ('Algeria', 'Africa', 2381741, 37100000, 188681000000),
  ('Andorra', 'Europe', 468, 78115, 3712000000),
  ('Angola', 'Africa', 1246700, 20609294, 100990000000);
  
  Select name, population, area 
  from World
  Where area > 3000000 OR population > 25000000;

---------#3 (584)
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
  id int PRIMARY KEY,
  name VARCHAR(255),
  referee_id int
);

INSERT INTO Customer VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);

SELECT name
FROM Customer
Where referee_id != 2 OR referee_id IS NULL;

---------#4 (183)
DROP TABLE IF EXISTS Customers, Orders;
CREATE TABLE Customers(
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Orders(
  id INT PRIMARY KEY,
  customerId INT
);

INSERT INTO Customers VALUES 
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders VALUES
(1,3),
(2,1);

Select c.name as Customers 
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerID
Where o.customerId IS NULL;

---------#5 (511) 
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity(
  player_id INT,
  device_id INT,
  event_date DATE  PRIMARY KEY,
  games_played INT
);

INSERT INTO Activity VALUES 
(1,2, '2016-03-01', 5),
(1,2, '2016-05-02', 6),
(2,3, '2017-06-25', 1),
(3,1, '2016-03-02', 0),
(3,4, '2018-07-03', 5);

Select player_id, min(event_date) AS first_login
From Activity
GROUP BY player_id 
ORDER BY player_id ASC;

---------#6 (586)
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
  order_number INT PRIMARY KEY,
  customer_number INT
);

INSERT INTO Orders VALUES
(1,1),
(2,2),
(3,3),
(4,3);

Select customer_number
FROM (
  Select customer_number, COUNT(*) as order_cnt
  From Orders
  Group By customer_number
) AS t
ORDER BY  order_cnt DESC
LIMIT 1;

---------#7 (1148)
DROP TABLE IF EXISTS Views;
CREATE TABLE Views(
  article_id INT,
  author_id INT,
  viewer_id INT,
  view_date DATE
);

INSERT INTO Views VALUES
(1,3,5,'2019-08-01'),
(1,3,6,'2019-08-02'),
(2,7,7,'2019-08-01'),
(2,7,6,'2019-08-02'),
(4,7,1,'2019-07-22'),
(3,4,4,'2019-07-21'),
(3,4,4,'2019-07-21');

Select author_id as id
FROM (
  Select author_id, COUNT(viewer_id) as view_cnt
  From Views
  Where viewer_id = author_id
  GROUP BY author_id
) as t
ORDER BY view_cnt DESC;

---------#8 (1084)
DROP TABLE IF EXISTS Product, Sales;
CREATE TABLE Product(
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  unit_price INT
);

CREATE TABLE Sales(
  seller_id INT,
  product_id INT,
  buyer_id INT,
  sale_date DATE,
  quantity INT,
  price INT
);

INSERT INTO Product VALUES
(1,'S8', 1000),
(2,'G4', 800),
(3,'iPhone', 1400);

INSERT INTO Sales VALUES
(1,1,1,'2019-01-21', 2, 2000),
(1,2,2,'2019-02-17',1, 800),
(2,2,3,'2019-06-02',1,800),
(3,3,4,'2019-05-13',2,2800);

SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s 
ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND NOT EXISTS (
  SELECT 1
  FROM Sales s2
  WHERE s2.product_id = p.product_id
  	AND s2.sale_date > '2019-03-31'
  );

---------#9 (196)
DROP TABLE IF EXISTS Person;
CREATE TABLE Person(
  id INT PRIMARY KEY,
  email VARCHAR(255)
);

INSERT INTO Person VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

DELETE FROM Person
WHERE id NOT IN (
    SELECT min_id
    FROM (
        SELECT MIN(id) AS min_id
        FROM Person
        GROUP BY email
    ) AS t
);

---------#10 (1667)
DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
  user_id INT PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO Users VALUES
(1, 'alice'),
(2, 'bOB');

SELECT user_id,
       CONCAT(UPPER(SUBSTRING(name,1,1)),
              LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id ASC;

---------#11 (1327)
DROP TABLE IF EXISTS Products, Orders;
CREATE TABLE Products(
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  product_category VARCHAR(255)
);

CREATE TABLE Orders(
  product_id INT,
  order_date DATE,
  unit INT
);

INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4,'Lenovo','Laptop'),
(5,'Leetcode Kit', 'T-shirt');

INSERT INTO Orders VALUES
(1,'2020-02-05',60),
(1,'2020-02-10',70),
(2,'2020-01-18',30),
(2,'2020-02-11',80),
(3,'2020-02-17',2),
(3,'2020-02-24',3),
(4,'2020-03-01',20),
(4,'2020-03-04',30),
(4,'2020-03-04',60),
(5,'2020-02-25',50),
(5,'2020-02-27',50),
(5,'2020-03-01',50);

SELECT p.product_name, SUM(o.unit) as unit
FROM Products p
JOIN Orders o 
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

---------#12 (1517)
DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
  user_id INT PRIMARY KEY,
  name VARCHAR (255),
  mail VARCHAR(255)
);

INSERT INTO Users VALUES
(1,'Winston','winston@leetcode.com'),
(2,'Jonathan','jonathanisgreat'),
(3,'Annabelle','bella-@leetcode.com'),
(4,'Sally','sally.come@leetcode.com'),
(5,'Marwan','quarz#2020@leetcode.com'),
(6,'David','david69@gmail.com'),
(7,'Shapiro','.shapo@leetcode.com');

SELECT user_id, name, mail
FROM Users
WHERE mail LIKE '%@leetcode.com'
  AND mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$'
  AND position('@' in mail) = length(mail) - 12;

---------#13 (1890)
DROP TABLE IF EXISTS Logins;
CREATE TABLE Logins(
  user_id     INT,
  time_stamp  TIMESTAMP,
  PRIMARY KEY (user_id, time_stamp)
);

INSERT INTO Logins VALUES
(6, '2020-06-30 15:06:07'),
(6, '2021-04-21 14:06:06'),
(6, '2019-03-07 00:18:15'),
(8, '2020-02-01 05:10:53'),
(8, '2020-12-30 00:46:50'),
(2, '2020-01-16 02:49:50'),
(2, '2019-08-25 07:59:08'),
(14,'2019-07-14 09:00:00'),
(14,'2021-01-06 11:59:59');

Select user_id, max(time_stamp) as last_stamp
From Logins
Where time_stamp BETWEEN '2020-01-01' AND '2020-12-31'
Group By user_id;

---------#14 (197)
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather(
  id           INT PRIMARY KEY,
  recordDate   DATE,
  temperature  INT
);

INSERT INTO Weather VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

SELECT w2.id
FROM Weather w1
JOIN Weather w2 ON w2.recordDate = w1.recordDate + INTERVAL '1 day'
WHERE w2.temperature > w1.temperature;