CREATE DATABASE Meal

USE Meal

CREATE TABLE MEALS
(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(100),
Price money 
)

CREATE Table [Tables]
(
Id Int PRIMARY KEY IDENTITY,
No varchar(100)
)


CREATE TABLE Orders
(
Id Int PRIMARY KEY IDENTITY,
MealID int FOREIGN KEY REFERENCES MEALS(Id),
TableId Int FOREIGN KEY REFERENCES Tables(Id),
DateTime Datetime2
)

INSERT INTO MEALS (Name, Price) VALUES 
('Spaghetti Bolognese', 10.99),
('Grilled Salmon', 15.50),
('Chicken Caesar Salad', 8.75);

INSERT INTO [Tables] (No) VALUES 
('Table 1'),
('Table 2'),
('Table 3');

INSERT INTO Orders (MealID, TableId, DateTime) VALUES 
(1, 1, '2024-02-17 12:30:00'),
(2, 2, '2024-02-17 13:15:00'),
(3, 3, '2024-02-17 14:00:00');

SELECT T.*, COUNT(O.TableId) AS OrderCount
FROM [Tables] AS T
LEFT JOIN Orders AS O ON T.Id = O.TableId
GROUP BY T.Id, T.No;

SELECT M.Id, M.Name, M.Price, COUNT(O.MealID) AS OrderCount
FROM MEALS AS M
LEFT JOIN Orders AS O ON M.Id = O.MealID
GROUP BY M.Id, M.Name, M.Price;

SELECT Orders.Id,Orders.MealID,Orders.TableId,Orders.DateTime,M.Name  FROM Orders
LEFT JOIN MEALS AS M ON Orders.Id =M.Id

SELECT O.Id, O.MealID, O.TableId, O.DateTime, M.Name AS MealName, T.No AS TableNumber
FROM Orders AS O
LEFT JOIN MEALS AS M ON O.MealID = M.Id
LEFT JOIN [Tables] AS T ON O.TableId = T.Id;
   
SELECT T.*, SUM(M.Price) AS TotalAmount
FROM [Tables] AS T
LEFT JOIN Orders AS O ON T.Id = O.TableId
LEFT JOIN MEALS AS M ON O.MealID = M.Id
GROUP BY T.Id, T.No;

SELECT T.*
FROM [Tables] AS T
LEFT JOIN Orders AS O ON T.Id = O.TableId
WHERE O.TableId IS NULL;




