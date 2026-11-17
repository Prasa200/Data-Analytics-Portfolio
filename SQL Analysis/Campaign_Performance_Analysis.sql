
/*
====================================================
PROJECT : MARKETING CAMPAIGN ANALYSIS
STEP    : 06 - CAMPAIGN PERFORMANCE ANALYSIS
DATABASE: MarketingCampaignDB
====================================================
*/

USE MarketingCampaignDB;
GO

-- 1. Campaign-wise performance

SELECT
    CampaignName,
    COUNT(*) AS TotalCampaigns,
    SUM(Spend) AS TotalSpend,
    SUM(Revenue) AS TotalRevenue,
    AVG(ROI) AS AverageROI
FROM dbo.[marketing campaign performance]
GROUP BY CampaignName
ORDER BY AverageROI DESC;
GO

-- 2. Region-wise performance

SELECT
    Region,
    SUM(Spend) AS TotalSpend,
    SUM(Revenue) AS TotalRevenue,
    AVG(ROI) AS AverageROI
FROM dbo.[marketing campaign performance]
GROUP BY Region
ORDER BY TotalRevenue DESC;
GO

-- 3. Industry-wise performance

SELECT
    Industry,
    SUM(Spend) AS TotalSpend,
    SUM(Revenue) AS TotalRevenue,
    AVG(ROI) AS AverageROI
FROM dbo.[marketing campaign performance]
GROUP BY Industry
ORDER BY AverageROI DESC;
GO

-- 4. Top 5 campaigns by ROI

SELECT TOP 5
    CampaignID,
    CampaignName,
    Region,
    Spend,
    Revenue,
    ROI
FROM dbo.[marketing campaign performance]
ORDER BY ROI DESC;
GO

-- 5. Campaign performance classification

SELECT
    CampaignName,
    AVG(ROI) AS AverageROI,
    CASE
        WHEN AVG(ROI) >= 1.00 THEN 'High Performance'
        WHEN AVG(ROI) >= 0.65 THEN 'Moderate Performance'
        ELSE 'Low Performance'
    END AS PerformanceCategory
FROM dbo.[marketing campaign performance]
GROUP BY CampaignName
ORDER BY AverageROI DESC;
GO
