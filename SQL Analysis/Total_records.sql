
/*
PROJECT: MARKETING CAMPAIGN ANALYSIS
STEP 04: TRANSFER IMPORTED DATA
*/

USE MarketingCampaignDB;
GO

-- Check source and destination records

SELECT
    (SELECT COUNT(*)
     FROM dbo.[marketing campaign performance])
     AS ImportedRecords,

    (SELECT COUNT(*)
     FROM dbo.MarketingCampaignPerformance)
     AS MainTableRecords;
GO

-- Transfer data without duplicating CampaignID

INSERT INTO dbo.MarketingCampaignPerformance
(
    CampaignID,
    CampaignName,
    Region,
    Industry,
    Spend,
    Impressions,
    Clicks,
    Conversions,
    Revenue,
    ROI
)
SELECT
    s.CampaignID,
    s.CampaignName,
    s.Region,
    s.Industry,
    s.Spend,
    s.Impressions,
    s.Clicks,
    s.Conversions,
    s.Revenue,
    s.ROI
FROM dbo.[marketing campaign performance] s
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.MarketingCampaignPerformance t
    WHERE t.CampaignID = s.CampaignID
);
GO

-- Verify transferred records

SELECT
    COUNT(*) AS TotalRecords,
    SUM(Spend) AS TotalSpend,
    SUM(Revenue) AS TotalRevenue,
    AVG(ROI) AS AverageROI
FROM dbo.MarketingCampaignPerformance;
GO
