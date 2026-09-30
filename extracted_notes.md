# INTRODUCTION

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
This project focuses on analyzing an E-Commerce Sales Analytics dataset containing 150K+ transactions from 2021–2025. The dataset covers key aspects of an e-commerce business, including customers, products, orders, sales, marketing, payments, logistics, returns, reviews, and loyalty activities.

The project involves transforming the available data into a normalized relational database using Python, Pandas, and MySQL, followed by SQL-based analysis to identify meaningful business insights.

---

# OBJECTIVES:

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Normalize the e-commerce data into structured relational tables.
<li>Establish appropriate primary key and foreign key relationships between entities.
<li>Load the normalized data into MySQL for analysis.
<li>Use SQL queries to analyze sales, customers, products, profitability, marketing, delivery, returns, reviews, and loyalty.
<li>Identify key business trends and insights that can support data-driven decision-making.
</ul>
</div>

---

## Database Schema

---

# 1. Getting Ready with Data

---

<div>

---

# 2. Individual Table Inspection/Assessment

---

### 2.1 Customers Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
The customer_type column is completely empty. Other columns have no null values.

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
There are a lot of customers with same name from different country, indicating the data is synthetic.

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Other values are mostly valid, accurate and consistent.

---

### 2.2 Orders Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.3 Order Items Table

---

 <div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
 No null or duplicates. Values are valid, accurate and consistent.
 Sales values are in different currency.

---

### 2.4 Products Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.5 Categories Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.


---

### 2.6 Payments Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.6 Shipment Tables

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Around 18% of the values in delivery_days and estimated_delivery_days are null.

---

### 2.7 Returns Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.8 Reviews Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.9 Loyalty Transactions Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

### 2.10 Brands and Supplier Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
No null or duplicates. Values are valid, accurate and consistent.

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
There are only 10 suppliers and 120 brands.

---

### 2.11 Marketing Campaign Table

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
There are 20 marketing campaigns record.

---

<div>

---

# 3. Executive & Overall Revenue Performance

---

## 3.1 Monthly Financial Health & Trend Analysis

Question: What is the month-over-month (MoM) trend for gross sales, net sales, discounts, shipping costs, and total net profit?



---

<div>

---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Gross sales and net sales spikes at end months, specifically during November and December from 2021 to 2026 and drops by 50%-60% every January.

<li>Every July, total discounts experience an extreme jump—increasing by 135% to 168% MoM to reach upwards of $660K–$720K.
<li>Excluding seasonal peak months, baseline monthly gross sales consistently float between $2.1M and $2.9M across all five years, indicating stable core operations with minimal baseline growth or churn.
</ul>

---

<div>

---

## 3.2 Sales Channel Efficiency & Margin Comparison

Question: How do sales volume, average order value (AOV), and net profit margin percentages compare across different sales channels (e.g., Mobile App vs. Website vs. Third-Party Marketplace)?


---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li> Mobile App dominates both revenue ($52.8M) and order volume (282.2k units / 45.5k orders), closely followed by Website ($46.5M).   
<li> AOV remains remarkably stable across channels (~$1,160 – $1,175), and Net Profit Margin is virtually uniform (~33.97% – 34.22%) regardless of channel volume
</div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Reported To: Chief Executive Officer (CEO), Chief Financial Officer (CFO), VP of Strategy

---

<div>

---

# 4. Customer Analytics & Value Segmentation

---

## 4.1 RFM (Recency, Frequency, Monetary) Customer Segmentation

Question: How are active customers distributed across RFM tiers (e.g., Champions, At-Risk, Hibernating), and what percentage of total revenue does each segment contribute?



---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Champions and Loyal Customers account for ~43.7% of total revenue while representing only ~30.8% of the customer base.   <li>Champions generate the highest ARPU at ~$9,132. Meanwhile, dormant segments like Need Attention ($23.2M revenue) and At-Risk ($9.1M revenue) hold significant monetary value with high average spend.  
 <li>The Hibernating / Lost segment comprises 26.67% of total customers. However, their low average frequency (~2.6 orders) and high recency (~700 days) yield a low ARPU of ~$2,636. 
</ul>

---

<div>

---

## 4.2 Customer Acquisition Cost (CAC) vs. Lifetime Value (LTV) Ratio

Question: What is the average Lifetime Value (LTV) and average CAC across different customer acquisition regions and segments? Is the LTV-to-CAC ratio exceeding the industry standard target of 3:1?


---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Across all segments and regions, the LTV:CAC ratio ranges from 173.7x to 211.5x, indicating unit economics where Customer Lifetime Value massively exceeds Acquisition Cost.
<li>Top Performing Region: The North region consistently yields the highest LTVs across VIP ($8,431.29), Business ($8,453.73), and Consumer ($8,124.23) segments.   
<li>Customer Acquisition Costs (CAC) are remarkably uniform, staying bounded between $39.87 and $43.03 across all 20 segment-region combinations
</ul>

---

<div>

---

## 4.3 Repeat Purchase & Cohort Retention Rate

Question: What percentage of customers acquired in a given month return to make a second and third purchase within 30, 60, and 90 days?



---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Initial monthly cohorts in 2021 were significantly larger (averaging ~1,000 to 1,500 new customers per month), whereas cohorts from late 2024 through 2025 dropped to ~20 to 80 new customers per month.

<li>On average, 2nd purchase conversion builds steadily across time windows—moving from ~5%–11% within 30 days to ~15%–26% within 90 days.

<li>Cohorts acquired in November and October across multiple years (e.g., 2021-10, 2021-11, 2022-10, 2022-11, 2023-11) display noticeably higher 90-day 2nd purchase retention rates (23% to 26%+), matching seasonal holiday repeat activity.

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Reported To: Chief Marketing Officer (CMO), Head of Customer Lifecycle / CRM, Growth Lead

---

<div>

---

# 5. Product & Merchandising Performance

---

## 5.1 Product Portfolio ABC Inventory Analysis

Question: Which products fall into Category A (top 80% revenue generators), Category B (next 15%), and Category C (bottom 5%) based on cumulative net sales?



---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Total 522 products contribute to 80% of total revenue.

---

## 5.2 Brand & Supplier Profitability Matrix
Question: Which brands and suppliers generate the highest volume versus those generating the highest net profit margin? Are any high-volume suppliers yielding sub-par margins?



---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Brands in the Top by volume category drive high unit turnover (averaging ~9,722 units) at moderate margins (~35.0%), whereas Top by profit brands move fewer units (averaging ~4,462 units) but capture significantly higher margins (~49.6%).
<li> Brands like Williams-Sonoma, Johnson & Johnson, and Kiehl's achieve strong dual performance—maintaining high sales volume (>8,500 units) alongside premium profit margins (>42%).

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Suppliers top by volume and profit margin have identical ranking, indicating volume or profit yields the same sales unit figures per suppliers.
<li>American Supply, Amazon Supply and Domestic Producers are top performers in both sales volume and profit margin. 

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Reported To: VP of Merchandising, Category Managers, Procurement Lead

---

<div>

---

<div>

---

# 6. Marketing & Campaign Effectiveness

---

## 6.1 Marketing Campaign ROI & Revenue Attribution

Question: What is the total gross revenue, average discount percentage, and conversion volume generated by each marketing campaign and marketing channel?



---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Organic Search ($12.94M) and Direct ($9.87M) are the top revenue drivers, generating nearly 35% of overall gross revenue (~$22.8M of $65.3M) and the highest order volumes (9,125 and 6,759 orders).

<li>Across Google Search, Shopping, and Display campaigns, Google Ads generates ~$9.9M in revenue across 6,781 orders, making it the most effective paid channel.

<li> Facebook Ads (~$7.9M across 5,498 orders) and Instagram (~$6.4M across 4,438 orders) provide steady social media acquisition across prospecting, retargeting, influencer, and reels/stories channels.

<li>Average discounts per order remain mostly consistent between $93 and $103, peaking slightly in incentive-heavy channels like Promo_Email ($103.02) and FB_Dynamic ($102.50).
</ul>


---

## 6.2 Coupon Code Dependency & Cannibalization Analysis

Question: What proportion of orders use coupon codes, and how does the Average Order Value (AOV) and gross margin of discounted orders compare to non-discounted orders?


---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Non-discounted orders dominate the business, representing 80.03% of all orders (90,876) and generating $106.32M in net revenue, compared to 19.97% for discounted orders ($26.44M), indicating low dependency on coupons.  
<li>Coupons do not appear to drive larger basket sizes or cannibalize customer spend, as both discounted ($1,445.41) and full-price ($1,449.99) orders yield virtually the same AOV.  
<li>Net profit margin is completely identical across both segments at 34.17%, indicating that coupon applications do not negatively compress profit margins relative to full-price orders
</ul>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Reported To: Head of Performance Marketing, Campaign Managers, Acquisition Lead

---

<div>

---

<div>

---

# 7. Operations, Supply Chain & Logistics

---

## 7.1 Warehouse Delivery Performance & SLA Bottlenecks

Question: What percentage of shipments exceed their estimated_delivery_days per warehouse and shipping method, and what is the average delay in days?



---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">

<ul>
<li>Same day shipping method tends to exceed more than the estimated delivery days.
<li>For most shipping method and warehouse, average delay day is around 0.3 days.

---

<div>

---

## 7.2 Product Return Rate & Root-Cause Financial Impact

Question: Which product categories and subcategories have the highest return rates, and what are the primary return reasons cited? What is the total lost net sales value from returns?



---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
<li>Return rates across all 120 subcategories are tightly concentrated between 6.17% and 8.93%, with high-value items like Jewelry (Pendants at 8.93%) leading in percentage terms.
<li>Financial loss varies dramatically by subcategory value despite similar return percentages; Pendants generated $202.46K in lost net sales, whereas high-volume/low-ticket items like Grocery Snacks lost only $18.09K.  
<li>"Product Not as Expected" emerges as the primary driver for top-returning categories (Pendants, Motorcycle Gear, Grooming), pointing to product listing descriptions or expectations mismatches rather than logistical delays or transit damages.
</ul>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
Reported To: Chief Operating Officer (COO), Logistics Manager, Warehouse Operations Director

---

<div>

---

<div>

---

# 8. Customer Sentiment & Experience Analytics

---

## 8.1 Operational Impact on Customer Satisfaction (CSAT)

Question: How do delivery delays and return events impact customer star ratings (customer_rating) and review sentiment scores?



---

<div>

---

<div style = "background-color:lightblue; color:green; font-size:20px; text-align:justify">
<ul>
</li>Fulfillment delays directly impair customer satisfaction, causing average star ratings to drop from 3.76 stars (On-Time) down to 3.22 stars (Late).
<li>On-time deliveries yield a 75.43% positive review sentiment, whereas late deliveries collapse positive sentiment down to 30.55%, shifting the vast majority of customer feedback into neutral (65.68%) and negative (3.77%) feedback.

<li>4.87% of all completed orders (16,886 orders) suffer from fulfillment delays, serving as a primary driver of preventable customer dissatisfaction and adverse review sentiment.
</ul>


---

<div>

---

# 9. Recommendations and Suggestions