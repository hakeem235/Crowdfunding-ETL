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

INSERT INTO email_contacts_remaining_goal_amount (first_name, last_name, email, remaining_goal_amount)
SELECT b.first_name,
       b.last_name,
       b.email,
       d.goal - d.pledged AS remaining_goal_amount
FROM backers AS b
JOIN campaign AS d ON b.cf_id = d.cf_id
WHERE d.outcome = 'live'
-- ORDER BY remaining_goal_amount;
SELECT * FROM public.email_contacts_remaining_goal_amount DESC LIMIT 100

-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


SELECT * FROM public.campaign
ORDER BY cf_id ASC LIMIT 100





