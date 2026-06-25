USE marketing_analytics;

-- Segment Uplift Analysis

SELECT 
    Customer_Segment,
    `Group` AS ab_test_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(Sales_Delta), 2) AS avg_revenue_lift,
    ROUND(AVG(Sales_Efficiency) * 100, 2) AS avg_efficiency_pct,
    ROUND(AVG(Satisfaction_Delta), 2) AS avg_satisfaction_lift
FROM 
    marketing_campaign_data
GROUP BY 
    Customer_Segment, `Group`
ORDER BY 
    Customer_Segment, `Group`;
