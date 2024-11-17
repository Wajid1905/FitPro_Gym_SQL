-- Business Problems
-- 1.	Retrieve all details of members who have a Cancelled membership.
-- 2.	Find all members who are Male and have a Weekly membership type, and order the result by join_date.
-- 3.	Get a list of distinct member ages.
-- 4.	Retrieve the name, membership_type, and join_date of all members who joined after 2023-10-01, ordered by join_date in ascending order.
-- 5.	Count the total number of visits made by each member, grouping by member_id.
-- 6.	Retrieve the membership_type and the count of members for each membership type.
-- 7.	Get the names and ages of members who have a Monthly membership and are younger than 25, using WHERE.
-- 8.	Retrieve the number of visits for each visit_date, ordered by visit_date.
-- 9.	Find the average age of members who have a Quarterly membership type.
-- 10.	Retrieve the name, membership_type, and status of members who are Active and Monthly, ordered by status.
-- 11.	Count the number of members with each membership_type, using GROUP BY and HAVING to show only those with more than 1 member.
-- 12.	Find the name of the member who has made the most visits, ordered by total_visits.
-- 13.	Retrieve the list of name and status of members who have Cancelled status and joined before 2023-11-01, and limit the result to 3 rows.
-- 14.	Find the average age of members with Active status, grouped by membership_type.
-- 15.	Retrieve all visit details (date, check-in, check-out) for the first 5 visits, ordered by visit_date in descending order.

-- 1.	Retrieve all details of members who have a Cancelled membership.

SELECT * 
FROM
	memberships
WHERE
	status = 'Cancelled';

-- 2.	Find all members who are Male and have a Weekly membership type, and order the result by join_date.

SELECT *
FROM 
	memberships
WHERE
	gender = 'M'
	AND
	membership_type = 'Weekly'
ORDER BY
	join_date;

-- 3.	Get a list of distinct member ages.

SELECT 
	DISTINCT age
FROM
	memberships
ORDER BY age;

-- 4.	Retrieve the name, membership_type, and join_date of all members who joined after 2023-10-01, ordered by join_date in ascending order.

SELECT 
	m.name,
	ms.membership_type,
	ms.join_date
FROM 
	members m
JOIN
	memberships ms
ON 
	m.member_id = ms.member_id
WHERE
	join_date > '2023-10-01'
ORDER BY
	join_date;

-- 5.	Count the total number of visits made by each member, grouping by member_id.

SELECT
	member_id,
	COUNT(*) AS total_visits
FROM
	visits
GROUP BY 
	member_id
ORDER BY 2 DESC;


-- 6.	Retrieve the membership_type and the count of members for each membership type.

SELECT
	membership_type,
	COUNT(*) AS total_members
FROM 
	memberships
GROUP BY
	membership_type;

-- 7.	Get the names and ages of members who have a Monthly membership and are younger than 25, using WHERE.

SELECT
	m.name,
	ms.age
FROM
	members m 
JOIN
	memberships ms
ON 
	m.member_id = ms.member_id
WHERE
	age < 25
	AND 
	membership_type = 'Monthly';

-- 8.	Retrieve the number of visits for each visit_date, ordered by visit_date.

SELECT
	visit_date,
	COUNT(*) AS total_visits
FROM 
	visits
GROUP BY 
	visit_date
ORDER BY
	visit_date;


-- 9.	Find the average age of members who have a Quarterly membership type.

SELECT
	ROUND(AVG(age),2) AS Quaterly_membership_average_age
FROM
	memberships
WHERE	
	membership_type = 'Quaterly';


-- 10.	Retrieve the name, membership_type, and status of members who are Active and Monthly, ordered by status.

SELECT
	m.name,
	ms.membership_type,
	ms.status
FROM 
	members m
JOIN
	memberships ms
ON
	m.member_id = ms.member_id
WHERE
	status = 'Active'
	AND
	membership_type = 'Monthly'
ORDER BY 
	status;


-- 11.	Count the number of members with each membership_type, using GROUP BY and HAVING to show only those with more than 1 member.

SELECT	
	membership_type,
	COUNT(member_id) AS total_members
FROM 
	memberships
GROUP BY
	membership_type
HAVING
	COUNT(member_id) > 1;


-- 12.	Find the name of the member who has made the most visits, ordered by total_visits.

SELECT
	m.name,
	COUNT(v.visit_id) as total_visits
FROM
	members m
JOIN
	visits v
ON
	m.member_id = v.member_id
GROUP BY 
	m.name
ORDER BY 
	total_visits DESC;

-- 13.	Retrieve the list of name and status of members who have Cancelled status and joined before 2023-11-01, and limit the result to 3 rows.

SELECT
	m.name,
	ms.status
FROM
	members m
JOIN
	memberships ms
ON
	m.member_id = ms.member_id
WHERE
	status = 'Cancelled'
	AND
	join_date < '2023-11-01'
LIMIT 3;

-- 14.	Find the average age of members with Active status, grouped by membership_type.

SELECT
	membership_type,
	ROUND(AVG(age),2) AS average_age
FROM
	memberships
WHERE
	status = 'Active'
GROUP BY
	membership_type;

-- 15.	Retrieve all visit details (date, check-in, check-out) for the first 5 visits, ordered by visit_date in descending order.

SELECT * 
FROM
	visits
ORDER BY 
	visit_date DESC
LIMIT 5;
