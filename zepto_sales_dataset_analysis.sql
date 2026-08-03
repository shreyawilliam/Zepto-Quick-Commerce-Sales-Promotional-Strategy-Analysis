SELECT * FROM zepto_sales_dataset_analysis;

Identifies top-performing product categories, total order volume, total revenue generated, and the average discount percentage given.
SELECT 
    category,
    COUNT(product_name) AS total_products,
    SUM(orders) AS total_orders,
    ROUND(SUM(total_revenue), 2) AS aggregate_revenue,
    ROUND(AVG(discount), 2) AS avg_discount_pct,
    ROUND(AVG(original_price - current_price), 2) AS avg_savings_per_unit
FROM zepto_sales_dataset_analysis
GROUP BY category
ORDER BY aggregate_revenue DESC;

SELECT 
    product_name, 
    original_price, 
    current_price, 
    (original_price - current_price) AS raw_difference
FROM zepto_sales_dataset_analysis
LIMIT 5;

-- Updated Query 1 with Corrected Price Subtraction
SELECT 
    category,
    COUNT(product_name) AS total_products,
    SUM(orders) AS total_orders,
    ROUND(SUM(total_revenue), 2) AS aggregate_revenue,
    ROUND(AVG(discount), 2) AS avg_discount_pct,
    -- Flipped subtraction so savings show as a positive number
    ROUND(AVG(current_price - original_price), 2) AS avg_savings_per_unit
FROM zepto_sales_dataset_analysis
GROUP BY category
ORDER BY aggregate_revenue DESC;

Compares sales volume, total revenue, and average revenue per product between items backed by active influencer campaigns (influencer_active = TRUE / 1) versus organic items (influencer_active = FALSE / 0).
SELECT 
    category,
    influencer_active,
    COUNT(product_name) AS total_products,
    SUM(orders) AS total_orders,
    ROUND(SUM(total_revenue), 2) AS category_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_product,
    ROUND(AVG(orders), 2) AS avg_orders_per_product,
    -- Corrected: average unit savings per campaign type
    ROUND(AVG(current_price - original_price), 2) AS avg_unit_discount_rupees
FROM zepto_sales_dataset_analysis
GROUP BY category, influencer_active
ORDER BY category, influencer_active DESC;

Ranks the top revenue-generating product categories within each individual city hub (Delhi, Mumbai, Bangalore, etc.) using DENSE_RANK().
WITH CityCategoryTotals AS (
    SELECT 
        city,
        category,
        SUM(orders) AS city_orders,
        ROUND(SUM(total_revenue), 2) AS city_revenue,
        ROUND(AVG(discount), 2) AS avg_city_discount_pct,
        -- Corrected: total discount amount absorbed in that city/category
        ROUND(SUM(current_price - original_price * orders), 2) AS total_city_discount_rupees
    FROM zepto_sales_dataset_analysis
    GROUP BY city, category
)
SELECT 
    city,
    category,
    city_orders,
    city_revenue,
    avg_city_discount_pct,
    DENSE_RANK() OVER (PARTITION BY city ORDER BY city_revenue DESC) AS category_rank_in_city
FROM CityCategoryTotals
ORDER BY city, category_rank_in_city;

Groups products into discount tiers to see if aggressive discounting actually generates higher order volume or just dilutes overall margins.
SELECT 
    CASE 
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount > 0 AND discount <= 5 THEN '1% - 5% (Low Discount)'
        WHEN discount > 5 AND discount <= 10 THEN '6% - 10% (Medium Discount)'
        ELSE '10%+ (Deep Discount)'
    END AS discount_tier,
    COUNT(product_name) AS product_count,
    SUM(orders) AS total_orders,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(orders), 2) AS avg_orders_per_product,
    -- Corrected: average savings per product in each tier
    ROUND(AVG(current_price - original_price), 2) AS avg_savings_rupees
FROM zepto_sales_dataset_analysis
GROUP BY 
    CASE 
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount > 0 AND discount <= 5 THEN '1% - 5% (Low Discount)'
        WHEN discount > 5 AND discount <= 10 THEN '6% - 10% (Medium Discount)'
        ELSE '10%+ (Deep Discount)'
    END
ORDER BY total_revenue DESC;