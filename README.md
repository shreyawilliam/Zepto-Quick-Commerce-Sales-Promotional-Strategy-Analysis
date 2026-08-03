# Zepto Sales & Promotional Strategy Analysis
This project analyses transactional data from Zepto (a leading quick-commerce platform in India operating hyper-local dark stores for 10-minute grocery delivery) to evaluate category revenue drivers, the return on investment (ROI) of influencer marketing campaigns, regional demand signatures across Indian metro cities, and the true impact of price discounting on order velocity. evaluating platform sales drivers, marketing ROI, and pricing mechanics. Operating in the high-velocity quick-commerce industry, Zepto relies on optimising dark store inventory turnaround, maintaining unit economics, and acquiring users via digital and influencer campaigns.

Key business metrics tracked across our catalog include Gross Merchandise Value (GMV / Revenue), Order Velocity (average orders per SKU), Discount Depth (unit margin impact), and Campaign Lift.

Insights and recommendations are provided on the following key areas:

Category 1: Product Category Performance & Revenue Drivers

Category 2: Influencer Marketing Campaign Lift & ROI

Category 3: Regional City Demand & Dark Store Preference Signatures

Category 4: Discount Economics & Price Elasticity

Targeted SQL queries regarding various business questions can be found [here](https://github.com/shreyawilliam/Zepto-Quick-Commerce-Sales-Promotional-Strategy-Analysis/blob/main/zepto_sales_dataset_analysis.sql).

# Data Structure & Initial Checks
The company's primary analytics dataset consists of a single transactional catalog view (zepto_sales_dataset) capturing product performance across 6 major metro cities, with a total row count of ~50,000+ aggregate order records. A description of the core schema attributes and derived structures is as follows:

product_id (PK), category (Snacks, Beverages, Grocery, Instant Food, Confectionery, Dairy), city, original_price (MSRP in ₹), current_price (selling price in ₹), discount (%), influencer_active (Boolean flag), orders (unit order volume), and total_revenue (GMV).

# Executive Summary
Zepto’s business is fundamentally driven by high-frequency impulse purchases—specifically Snacks and Beverages, which account for 50.8% of total revenue (₹29.39 Lakhs) across all categories.

Crucially, quick-commerce consumers demonstrate high price inelasticity: full-price SKUs (0% discount) generate the highest order velocity (171.93 orders/SKU), while active influencer campaigns yield 0% incremental order lift across every product category.

To preserve profit margins and maximize growth, leadership must immediately halt blanket 5–10% promotional discounting on core impulse SKUs and reallocate underperforming influencer ad spend toward localized dark store merchandising.

# Insights Deep Dive

1. Product Category Performance & Revenue Drivers

<img width="530" height="114" alt="Screenshot 2026-08-03 at 3 44 06 PM" src="https://github.com/user-attachments/assets/56a187de-e1ba-4277-9663-cac5695cf50c" />

<img width="490" height="320" alt="image" src="https://github.com/user-attachments/assets/925d4cf4-03a2-48cd-b3ad-e0f83ca8d7bf" />


- Snacks is the core revenue driver. The Snacks category generated ₹17,12,447 in aggregate revenue across 14,406 orders, leading all categories in product depth (82 SKUs) and total volume.

- Beverages is a strong second. Beverages contributed ₹12,27,002 in aggregate revenue across 10,802 orders with 66 active SKUs.

- Top two categories generate over half of total platform GMV. Together, Snacks and Beverages generated ₹29,39,449 (50.8%) out of the total platform sales of ₹57,83,351.

- Staples and fresh items trail significantly. Categories like Dairy (28 SKUs, ₹5,79,648 revenue) and Instant Food (36 SKUs, ₹6,61,477 revenue) display much lower order volume and catalog depth on quick-commerce.

2. Influencer Marketing Campaign Lift & ROI

<img width="803" height="208" alt="Screenshot 2026-08-03 at 3 54 15 PM" src="https://github.com/user-attachments/assets/f3026914-2d51-4280-8094-92eeaa3bbcc6" />

<img width="764" height="541" alt="image" src="https://github.com/user-attachments/assets/a7e87d34-e14f-408c-b828-44c824f46d43" />


- Influencer campaigns fail to drive higher average order velocity. Across 100% of product categories, organic products (influencer_active = False) averaged higher orders per product than influencer-backed products (influencer_active = True).

- Organic Snacks outpace Influencer Snacks by 16.3%. Non-promoted snacks averaged 184.54 orders per SKU, compared to 158.61 orders per SKU for influencer-backed snacks.

- Significant order velocity drop in Dairy campaigns. Organic dairy items achieved 181.52 average orders per SKU, whereas influencer-promoted dairy items averaged only 145.40 orders per SKU—a 19.9% decline in sales velocity.

- Marketing expense is compounding margin giveback. In Dairy, influencer SKUs carried higher average unit discounts (₹10.00 vs ₹6.09 for organic) while still delivering lower order volume, leading to double margin leakage.

3. Regional City Demand & Dark Store Preference Signatures

<img width="559" height="596" alt="Screenshot 2026-08-03 at 3 56 27 PM" src="https://github.com/user-attachments/assets/f13f989f-1544-4bb6-a162-ab2b6bf36fd6" />

<img width="1037" height="661" alt="image" src="https://github.com/user-attachments/assets/a125afc7-70cd-461f-8caa-310bc2816a38" />


- Delhi represents the largest individual market. Delhi generated the highest overall volume, anchored by Snacks alone driving ₹4,52,025 across 3,549 orders.

- Snacks dominate North and South-Central hubs. Snacks ranked #1 by revenue in Delhi (₹4.52L), Chennai (₹3.32L), Bangalore (₹3.01L), and Pune (₹2.21L).

- Beverages dominate Western and Coastal hubs. Beverages ranked #1 in Hyderabad (₹3,02,274) and Mumbai (₹2,56,581), proving regional climate and lifestyle preferences impact quick-commerce carts.

- Zero-discount elasticity in Delhi Dairy. Delhi Dairy SKUs maintained a 0.00% average discount rate while generating ₹66,904 across 648 orders, proving full-price sustainability for essential categories in specific metros.

4. Discount Economics & Price Elasticity

<img width="605" height="66" alt="Screenshot 2026-08-03 at 3 57 58 PM" src="https://github.com/user-attachments/assets/f7a00372-5dd4-4fc7-9208-f9e6287654c1" />

<img width="501" height="253" alt="image" src="https://github.com/user-attachments/assets/83b02784-429e-4047-a36c-bdfdb651607f" />



- Full-price items drive the highest aggregate volume. The 0% (No Discount) tier generated the highest total revenue (₹22,98,086) and total order volume (18,396 orders) across 107 products.

- Non-discounted SKUs exhibit superior order velocity. Full-price items averaged 171.93 orders per product, outperforming items in the 1%–5% low discount tier (166.42 orders/SKU) and 6%–10% medium discount tier (165.75 orders/SKU).

- Discounting causes margin erosion without demand creation. Increasing discount depth from 0% up to 10% yielded zero positive order elasticity, confirming that delivery speed—not minor price cuts—drives quick-commerce adoption.

- Catalog discrepancy identified in non-discounted pricing. The 0% (No Discount) category carried a residual average savings metric of ₹6.92 per unit, highlighting unit price variance between catalog list price and transactional execution.

# Recommendations
Based on the insights and findings above, we recommend the Growth, Pricing, and Category Management teams consider the following:

- Eliminate Blanket 5–10% Discounts on High-Frequency SKUs: Because 0% discount items deliver the highest order velocity (171.93 orders/SKU), pull back on small promotional discounts across Snacks and Beverages to instantly preserve gross margin without risking sales volume.

- Reallocate Influencer Marketing Budgets: Given that influencer-promoted items show 0% order lift across all categories, pause blanket influencer promotional spends in Dairy and Grocery and reallocate capital toward top-performing organic SKUs or regional awareness campaigns.

- Localise Dark Store Inventory Allocation: Reconfigure dark store layout and stock depth by city signature—prioritize warehouse space for Beverages in Mumbai and Hyderabad dark stores, while allocating prime shelf capacity for Snacks and Staples in Delhi, Bangalore, Chennai, and Pune.

- Protect Margin on Essential Staples: Capitalize on price inelasticity in high-demand staple categories (e.g., Dairy in Delhi running at 0% discount) by maintaining strict full-price pricing policies.

- Establish Performance-Linked Creator Agreements: For future influencer marketing initiatives, transition from flat-fee promotions to performance-linked affiliate structures tied directly to incremental order lift over organic baselines.

# Assumptions and Caveats
Throughout the analysis, multiple assumptions were made to manage structural nuances within the dataset:

Assumption 1: Transactional records represent completed, non-refunded user orders across all dark store fulfillment centers.

Assumption 2: Unit price variances between list price (original_price) and current price (current_price) reflect platform-funded promotional adjustments rather than vendor-level wholesale price shifts.

Assumption 3: City-level order aggregations assume uniform dark store delivery density and equal platform uptime across all six metro regions during the evaluated timeframe.
