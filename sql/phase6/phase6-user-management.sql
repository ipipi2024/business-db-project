USE company_db;

-- -------------------------------------------------------
-- USER MANAGEMENT: DBA and Analyst accounts
-- -------------------------------------------------------

-- -------------------------------------------------------
-- DBA USER: IpuleDBA
-- -------------------------------------------------------

-- Create the DBA user with a strong password
CREATE USER 'IpuleDBA'@'localhost'
IDENTIFIED BY 'StrongPassword123!';

-- Verify the DBA user was created successfully
SELECT user, host
FROM mysql.user
WHERE user = 'IpuleDBA';

-- Grant full administrative privileges on the database to the DBA user
GRANT ALL PRIVILEGES
ON company_db.*
TO 'IpuleDBA'@'localhost';

-- Apply the privilege changes immediately
FLUSH PRIVILEGES;

-- Confirm the privileges assigned to the DBA user
SHOW GRANTS FOR 'IpuleDBA'@'localhost';

-- -------------------------------------------------------
-- ANALYST USER: JacobAnalyst
-- -------------------------------------------------------

-- Create the Analyst user with read-only access
CREATE USER 'JacobAnalyst'@'localhost'
IDENTIFIED BY 'Analyst123!';

-- Verify the Analyst user was created successfully
SELECT user, host
FROM mysql.user
WHERE user = 'JacobAnalyst';

-- Grant read-only SELECT privileges on the database to the Analyst user
GRANT SELECT
ON company_db.*
TO 'JacobAnalyst'@'localhost';

-- Apply the privilege changes immediately
FLUSH PRIVILEGES;

-- Confirm the privileges assigned to the Analyst user
SHOW GRANTS FOR 'JacobAnalyst'@'localhost';
