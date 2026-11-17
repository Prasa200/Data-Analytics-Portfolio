
/*
====================================================
PROJECT : MARKETING CAMPAIGN ANALYSIS
STEP    : 05 - EXPLORATORY DATA ANALYSIS
DATABASE: MarketingCampaignDB
====================================================
*/

USE MarketingCampaignDB;
GO

-- 1. Total number of records

SELECT COUNT(*) AS TotalCampaignRecords
FROM dbo.[marketing campaign performance];
GO

-- 2. Campaign categories

SELECT
    CampaignName,
    COUNT(*) AS CampaignCount
FROM dbo.[marketing campaign performance]
GROUP BY CampaignName
ORDER BY CampaignCount DESC;
GO

-- 3. Regional distribution

SELECT
    Region,
    COUNT(*) AS TotalCampaigns
FROM dbo.[marketing campaign performance]
GROUP BY Region
ORDER BY TotalCampaigns DESC;
GO

-- 4. Industry distribution

SELECT
    Industry,
    COUNT(*) AS TotalCampaigns
FROM dbo.[marketing campaign performance]
GROUP BY Industry
ORDER BY TotalCampaigns DESC;
GO

-- 5. Overall marketing performance

SELECT
    SUM(Spend) AS TotalSpend,
    SUM(Revenue) AS TotalRevenue,
    AVG(ROI) AS AverageROI,
    SUM(Impressions) AS TotalImpressions,
    SUM(Clicks) AS TotalClicks,
    SUM(Conversions) AS TotalConversions
FROM dbo.[marketing campaign performance];
GO

-- 6. Highest and lowest spending

SELECT
    MAX(Spend) AS HighestSpend,
    MIN(Spend) AS LowestSpend,
    AVG(Spend) AS AverageSpend
FROM dbo.[marketing campaign performance];
GO

-- 7. Highest and lowest ROI

SELECT
    MAX(ROI) AS HighestROI,
    MIN(ROI) AS LowestROI,
    AVG(ROI) AS AverageROI
FROM dbo.[marketing campaign performance];
GO
