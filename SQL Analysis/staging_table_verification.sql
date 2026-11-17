
/*
PROJECT: MARKETING CAMPAIGN ANALYSIS
STEP 03: IMPORTED DATA VERIFICATION
*/

USE MarketingCampaignDB;
GO

-- Check imported record count
SELECT COUNT(*) AS TotalRecords
FROM dbo.[marketing campaign performance];
GO

-- Display imported data
SELECT TOP 20 *
FROM dbo.[marketing campaign performance];
GO

-- Check column names and data types
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'marketing campaign performance'
ORDER BY ORDINAL_POSITION;
GO
