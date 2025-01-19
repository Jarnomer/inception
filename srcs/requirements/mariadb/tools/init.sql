-- Drop the database if it exists, then create a new one
-- Placeholders are replaced by the entrypoint script
DROP DATABASE IF EXISTS `database_name`;
CREATE DATABASE `database_name`;

-- Create the user if it doesn't already exist and set permissions
-- Placeholders are replaced by the entrypoint script
CREATE USER IF NOT EXISTS 'database_user'@'%' IDENTIFIED BY 'database_pass';
GRANT ALL PRIVILEGES ON `database_name`.* TO 'database_user'@'%';
FLUSH PRIVILEGES;
