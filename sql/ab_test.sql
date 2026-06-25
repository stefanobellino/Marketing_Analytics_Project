USE marketing_analytics;

-- A/B Testing

SELECT 
    `Group` AS ab_test_group,
    COUNT(*) AS total_audience,
    
    -- Sales Conversion Rate (How many customers made a purchase out of the total)
    ROUND(SUM(CASE WHEN Purchase_Made = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS conversion_rate_pct,
    
    -- Revenue Performance (Before vs. After the Campaign)
    ROUND(AVG(Sales_Before), 2) AS avg_revenue_before,
    ROUND(AVG(Sales_After), 2) AS avg_revenue_after,
    
    -- Absolute Financial Impact (Sales Delta)
    ROUND(AVG(Sales_Delta), 2) AS avg_revenue_delta_per_customer,
    ROUND(SUM(Sales_Delta), 2) AS total_net_revenue_generated,
    
    -- Campaign Efficiency (Growth Rate Uplift)
    ROUND(AVG(Sales_Efficiency) * 100, 2) AS avg_sales_growth_pct,
    
    -- Brand Perception Metrics (Customer Satisfaction Index)
    ROUND(AVG(Customer_Satisfaction_Before), 2) AS avg_satisfaction_before,
    ROUND(AVG(Customer_Satisfaction_After), 2) AS avg_satisfaction_after,
    ROUND(AVG(Satisfaction_Delta), 2) AS avg_satisfaction_delta
FROM 
    marketing_campaign_data
GROUP BY 
    `Group`;
