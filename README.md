# Zepto-Quick-Commerce-Sales-Promotional-Strategy-Analysis
This project analyzes transactional data from Zepto (a quick-commerce platform) to evaluate category revenue drivers, the return on investment (ROI) of influencer marketing campaigns, regional demand signatures across Indian metro cities, and the true impact of price discounting on order velocity.

Tools Used: SQLite, Excel (Data Visualization & Formatting).

Dataset Scope: ~50,000+ orders across 6 core product categories and 6 major metro cities (Bangalore, Chennai, Delhi, Hyderabad, Mumbai, Pune).

Data Cleaning & PreparationBefore running analytical queries, the dataset underwent basic data hygiene and verification:

Column Verification: Verified price attributes (current_price, original_price, discount) and sales volume identifiers.

Data Correction Note: Identified and accounted for unit price variances to calculate accurate average savings per item ($current\_price - original\_price$).

Categorical Logic: Structured discount rates into standard analytical tiers (0% Full Price, 1%–5% Low, 6%–10% Medium).

Key Findings & Executive Insights

1.Category Revenue DominanceFinding: Snacks and Beverages drive the business, accounting for 50.8% of total platform revenue (₹29.39 Lakhs out of ~₹57.8 Lakhs total).

Business Takeaway: Quick-commerce usage is heavily driven by high-frequency, impulse-buying habits rather than planned bulk grocery purchases.

2. Influencer Marketing ROI AnalysisFinding: Active influencer campaigns produced 0% incremental order lift. Across every single category, organic SKUs averaged higher orders per product (e.g., Organic Snacks averaged 184.5 orders/product vs. 158.6 orders/product for influencer-backed Snacks).

Business Takeaway: Marketing spend on influencer campaigns is underperforming compared to standard organic catalog items, creating a margin leak.

3. Regional Demand SignaturesFinding: Category performance varies significantly by geography:Snacks rank #1 in North and South-Central hubs (Delhi, Bangalore, Chennai, Pune).Beverages rank #1 in Coastal/Western hubs (Mumbai, Hyderabad).Delhi represents the highest single revenue-generating city market.

Business Takeaway: Dark store inventory planning must be localized rather than using a blanket regional stock template.

4. Discount Economics & Price ElasticityFinding: Full-price SKUs (0% Discount) achieved the highest average order velocity (171.93 orders/product), outperforming items with 1%–10% discounts (~165–166 orders/product).

Business Takeaway: Demand on quick-commerce platforms is largely price-inelastic within the 5–10% discount band; convenience and delivery speed drive purchase conversion over minor price cuts.
