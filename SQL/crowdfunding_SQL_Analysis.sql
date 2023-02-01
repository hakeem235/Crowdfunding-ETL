-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, backers_count, outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

CREATE TABLE email_contacts_remaining_goal_amount (
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  remaining_goal_amount NUMERIC(100,2)
);

INSERT INTO email_contacts_remaining_goal_amount (
	first_name, 
	last_name, 
	email, 
	remaining_goal_amount 
)
SELECT MIN(CO.first_name) AS first_name,
       MIN(CO.last_name) AS last_name, 
       MIN(CO.email) AS email,
       CP.goal - CP.pledged AS "Remaining Goal Amount"
FROM contacts AS CO
INNER JOIN campaign AS CP ON CO.contact_id = CP.contact_id
WHERE CP.outcome = 'live'
GROUP BY "Remaining Goal Amount"
ORDER BY "Remaining Goal Amount" DESC LIMIT 10;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount
ORDER BY "Remaining Goal Amount" DESC LIMIT 10;


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE email_backers_remaining_goal_amount (
	email VARCHAR(255),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	cf_id INT,
	company_name VARCHAR(255),
	description VARCHAR(255),
	end_date DATE,
	left_of_goal  NUMERIC(100,2)
);

INSERT INTO email_backers_remaining_goal_amount (
	email,
	first_name,
	last_name,
	cf_id,
	company_name,
	description ,
	end_date,
	left_of_goal
)
SELECT 	MIN(BK.email) AS email,
		MIN(BK.first_name) AS first_name,
		MIN(BK.last_name) AS last_name,
		BK.cf_id,
		CP.company_name,
		CP.description,
		CP.end_date DATE,
		CP.goal - CP.pledged AS "Left of Goal"
FROM campaign as CP
LEFT JOIN backers as BK
ON CP.cf_id = BK.cf_id
WHERE CP.outcome = 'live'
GROUP BY BK.email,
       BK.first_name, 
       BK.last_name,
       BK.cf_id, 
       CP.company_name,
       CP.description,
       CP.end_date,
       "Left of Goal"
ORDER BY BK.last_name LIMIT 10;


-- Check the table

SELECT * FROM email_backers_remaining_goal_amount
ORDER BY BK.last_name LIMIT 10;





