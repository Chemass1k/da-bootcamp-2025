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