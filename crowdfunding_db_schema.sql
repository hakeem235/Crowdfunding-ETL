-- To Drop the table if it exiest 
DROP TABLE backers


-- To create backers table
CREATE TABLE backers (
	backer_id VARCHAR(10) NOT NULL,
	cf_id INT NOT NULL,
	firs_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	email VARCHAR(255),
    PRIMARY KEY (backer_id),

)

-- To create campaign table
CREATE TABLE campaign(
	cf_id INTEGER NOT NULL,
	contact_id INTEGER NOT NULL,
	company_name VARCHAR(100),
	description TEXT,
	goal NUMERIC(10,2),
	pledged NUMERIC(10,2),
	outcome VARCHAR(50),
	backers_count INTEGER,
	country VARCHAR(10),
	currency VARCHAR(10),
	launched_date DATE,
	end_date DATE ,
	category_id VARCHAR(10),
	subcategory_id VARCHAR(10),
	PRIMARY KEY (cf_id)
)

-- Qury for selecting the first 10 rows
SELECT * FROM backers LIMIT 10 

SELECT * FROM campaign LIMIT 10 