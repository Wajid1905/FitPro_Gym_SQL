-- Setup FitPro Database Schemas
-- Drop tables if they exist
DROP TABLE IF EXISTS visits, memberships, members;

-- Create members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create memberships table
CREATE TABLE memberships (
    member_id INT PRIMARY KEY,
    age INT,
    gender CHAR(1),
    membership_type VARCHAR(20),
    join_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Create visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    member_id INT,
    visit_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

SELECT 'All table created succussful!';
-- Schemas Creation END






