
/*
====================================================
PROJECT  : MARKETING CAMPAIGN ANALYSIS
STEP     : 02 - TABLE CREATION
DATABASE : MarketingCampaignDB
====================================================
*/

USE MarketingCampaignDB;
GO

-- TABLE 1: CAMPAIGN PERFORMANCE

IF OBJECT_ID('dbo.MarketingCampaignPerformance','U') IS NULL
BEGIN
    CREATE TABLE dbo.MarketingCampaignPerformance
    (
        CampaignID INT PRIMARY KEY,
        CampaignName VARCHAR(100) NOT NULL,
        Region VARCHAR(100) NOT NULL,
        Industry VARCHAR(100) NOT NULL,
        Spend DECIMAL(18,2),
        Impressions BIGINT,
        Clicks BIGINT,
        Conversions BIGINT,
        Revenue DECIMAL(18,4),
        ROI DECIMAL(18,6)
    );
END;
GO

-- TABLE 2: CAMPAIGN DETAILS

IF OBJECT_ID('dbo.MarketingCampaignDetails','U') IS NULL
BEGIN
    CREATE TABLE dbo.MarketingCampaignDetails
    (
        CampaignName VARCHAR(100) PRIMARY KEY,
        Type VARCHAR(50),
        AverageSpend DECIMAL(18,2),
        AverageROI DECIMAL(18,4),
        TotalCampaigns INT
    );
END;
GO

-- TABLE 3: REGION PERFORMANCE

IF OBJECT_ID('dbo.RegionPerformance','U') IS NULL
BEGIN
    CREATE TABLE dbo.RegionPerformance
    (
        Region VARCHAR(100) PRIMARY KEY,
        TotalSpend DECIMAL(18,2),
        TotalRevenue DECIMAL(18,2),
        AverageROI DECIMAL(18,4)
    );
END;
GO

-- VERIFY TABLE CREATION

SELECT
    TABLE_NAME,
    COUNT(*) AS TotalColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
AND TABLE_NAME IN
(
    'MarketingCampaignPerformance',
    'MarketingCampaignDetails',
    'RegionPerformance'
)
GROUP BY TABLE_NAME
ORDER BY TABLE_NAME;
GO
