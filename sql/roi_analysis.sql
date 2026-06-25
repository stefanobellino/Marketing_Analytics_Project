USE marketing_analytics;

-- Campaign ROI Simulation
WITH campaign_financials AS (
    SELECT 
        SUM(Sales_Delta) AS gross_incremental_revenue,
        -- Simulating a fixed campaign cost (e.g., $100,000)
        100000.00 AS campaign_cost
    FROM 
        marketing_campaign_data
    WHERE 
        `Group` = 'Treatment'
)
SELECT 
    gross_incremental_revenue,
    campaign_cost,
    ROUND(gross_incremental_revenue - campaign_cost, 2) AS net_profit,
    ROUND(((gross_incremental_revenue - campaign_cost) / campaign_cost) * 100, 2) AS roi_percentage
FROM 
    campaign_financials;