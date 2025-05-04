
-- DATA MANIPULATION LANGUAGE
--SELECT STATEMENT

--	Write a query to find all the players in the "Arizona" team.
SELECT * FROM Football_Players_Data$
WHERE team = 'Arizona';
--	Write a query to find all the players who play as a "WR" (Wide Receiver).
SELECT name, POS from Football_Players_Data$
WHERE POS = 'WR';
--	Write a query to list all players taller than 6 feet 2 inches.
SELECT * FROM [dbo].[Football_Players_Data$]
WHERE FT = 6 AND inc > 2;
--	Write a query to find all players who attended the "Washington" college.
SELECT name, college from [dbo].[Football_Players_Data$]
WHERE college = 'Washington';
--	Write a query to list players who are 25 years old or younger.
UPDATE  [dbo].[Football_Players_Data$]
SET AGE = NULL
WHERE AGE = 'N/A';
ALTER TABLE [dbo].[Football_Players_Data$]
ALTER COLUMN age INT NULL;
SELECT name,age FROM [dbo].[Football_Players_Data$]
WHERE age <= 25;
--	Write a query to find all players with missing Age data.
SELECT name, AGE FROM Football_Players_Data$
WHERE age IS NULL;
--	Write a query to find players who are rookies (Exp = 'R').
SELECT name FROM Football_Players_Data$
WHERE EXP = 'R';
--	Write a query to find the tallest player on the "New Orleans" team.
ALTER TABLE Football_Players_Data$
ALTER COLUMN inches INT;
SELECT name,inches FROM Football_Players_Data$ 
WHERE  team = 'New Orleans'
AND inches = (SELECT MAX(inches) FROM Football_Players_Data$
WHERE team = 'New Orleans');

--	Write a query to find players weighing more than 250 pounds.
SELECT name,wt FROM Football_Players_Data$
WHERE wt >=250;
--	Write a query to calculate the average height of players at each position.
SELECT pos
,AVG(inches) AS Average_height 
FROM Football_Players_Data$
GROUP BY pos;
--Write a query to find the heaviest player for each position.
SELECT * FROM Football_Players_Data$
SELECT pos
,MAX(wt) AS heaviest_player
FROM Football_Players_Data$
GROUP BY pos;
--Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.
SELECT  *
,RANK() OVER(PARTITION BY team ORDER BY wt )
FROM Football_Players_Data$;
--Write a query to calculate the average height (in inches) for all players older than 25 years.
SELECT
AVG(inches) AS Average_height
FROM Football_Players_Data$
where age > 25;

--Write a query to find all players whose height is greater than the average height of their respective team.
SELECT name,inches FROM Football_Players_Data$
WHERE INCHES > (SELECT AVG(INCHES) 
FROM Football_Players_Data$);
;


--Write a query to find all players who share the same last name.
SELECT DISTINCT NAME,LASTNAME
FROM [dbo].[Football_Players_Data$]
WHERE LastName IN (
    SELECT LastName
    FROM [dbo].[Football_Players_Data$]
    GROUP BY LastName
    HAVING COUNT(*) > 1
)
ORDER BY LastName;
--Write a query to get the number of players for each team grouped by their experience level.
SELECT team,EXP, COUNT(*) AS players_count
FROM Football_Players_Data$
GROUP BY team,EXP;


--Write a query to find the tallest and shortest players from each college.
SELECT college,MAX(INCHES) AS tallest_player FROM Football_Players_Data$
GROUP BY college;
SELECT college,MIN(INCHES)AS shortest_player from Football_Players_Data$
group by college;
--Write a query to find all players whose weight is above the average weight for their respective position.
WITH AvgWeightByPosition AS (
    SELECT Pos, AVG(Wt) AS AvgWeight
    FROM Football_Players_Data$
    GROUP BY Pos
)
SELECT DISTINCT p.*
FROM Football_Players_Data$ p
JOIN AvgWeightByPosition a ON p.Pos = a.Pos
WHERE p.Wt > a.AvgWeight
ORDER BY p.Pos, p.Wt DESC;
