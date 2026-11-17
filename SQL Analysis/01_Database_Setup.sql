
/*
====================================================
PROJECT   : MARKETING CAMPAIGN ANALYSIS
DATABASE  : MarketingCampaignDB
TOOL      : SQL SERVER MANAGEMENT STUDIO
STEP      : 01 - DATABASE CREATION
====================================================
*/

-- Create database

CREATE DATABASE MarketingCampaignDB;
GO

-- Select database

USE MarketingCampaignDB;
GO

-- Verify database creation

SELECT
    DB_NAME() AS DatabaseName;
GO

-- Check database details

SELECT
    name AS DatabaseName,
    database_id AS DatabaseID,
    create_date AS CreatedDate
FROM sys.databases
WHERE name = 'MarketingCampaignDB';
GO
