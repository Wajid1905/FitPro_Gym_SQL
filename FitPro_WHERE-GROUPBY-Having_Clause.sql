-- GROUP BY

-- 1.	Find the total number of visits made by each member, grouping by member_id.

SELECT 
	member_id, 
	COUNT(*) AS Total_Visits
FROM visits
GROUP BY
	member_id
ORDER BY
	member_id;

-- 2.	Retrieve the count of members by membership_type (e.g., how many Monthly, Weekly, and Quarterly members there are).

SELECT
	membership_type,
	COUNT(*) AS total_members
FROM 
	memberships
GROUP BY
	membership_type
ORDER BY 1;

-- 3.	Get the average age of members, grouped by their membership_type.

SELECT 
	membership_type,
	ROUND(AVG(age),2) AS average_age
FROM memberships
GROUP BY
	membership_type;

-- 4.	Find the total number of visits for each visit_date (group by the visit date).


SELECT 
	visit_date,
	COUNT(*) AS total_visits
FROM visits
GROUP BY visit_date;

-- 5.	Retrieve the number of members with each status (Active or Cancelled), grouped by status.

SELECT 
	status,
	COUNT(*) AS total_members
FROM 
	memberships
WHERE 
	status IN ('Active', 'Cancelled')
GROUP BY 
	status;


-- ******************************************************************************************
-- GROUP BY, HAVING

-- 1.	Retrieve the top 3 members who have made the most visits, only showing name 
--		and total_visits, and order by total_visits in descending order.

SELECT
	m.name,
	COUNT(*) AS total_visits
FROM
	members m 
JOIN 
	memberships ms
ON 
	m.member_id = ms.member_id
GROUP BY 
	m.name
ORDER BY 
	total_visits DESC
LIMIT 3;


-- 2.	Find the number of members with a Monthly membership who are Active, 
--		grouped by membership_type, and limit the result to the top 2 most recent join dates.

SELECT
	member_id,
	membership_type,
	join_date,
	COUNT(*) AS total_members
FROM 
	memberships
WHERE
	status = 'Active' AND membership_type = 'Monthly'
GROUP BY 
	member_id
ORDER BY 
	join_date DESC
LIMIT 2;


-- 3.	Get the total number of visits for each member who has more than 2 visits, 
--		ordered by total_visits, and display only the first 5 members.

SELECT 
	member_id,
	COUNT(*) AS total_visits
FROM visits
GROUP BY
	member_id
HAVING 
	COUNT(*) > 2
ORDER BY 
	total_visits
LIMIT 5;

-- 4.	Retrieve the number of members who have joined in 2023, grouped by membership_type, 
--		where the total number of members in each group is more than 1.

SELECT 
	membership_type,
	COUNT(*) as total_members
FROM memberships
WHERE	
	EXTRACT(YEAR FROM join_date) = 2023
GROUP BY
	membership_type
HAVING 
	COUNT(*) > 1;

-- 5.	Find the average age of members who have Active membership status, grouped by membership_type, 
--		ordered by membership_type alphabetically, and limit the result to 3.

SELECT 
	membership_type,
	ROUND(AVG(age),2) as average_age
FROM 
	memberships
WHERE
	status = 'Active'
GROUP BY
	membership_type
ORDER BY
	membership_type
LIMIT 3;

