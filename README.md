## retail-product-pricing-and-engagement-analysis-eda-sql
# Project Background
This project is a comprehensive market audit of 1M+ Myntra product entries updated as of May 2023. Using SQL as the primary tool, I analyzed the relationship between pricing strategy, discount depth, and seller performance to isolate the variables that drive customer trust and mass engagement. 

To bridge the gap between raw data and executive decision-making, I translated key SQL outputs into Excel visualizations, providing a clear look at market trends and promotional efficiency.

### Overview of Key Findings:

* *Price Engagement*: Customer interaction peaks within specific price and discount thresholds specifically the **<₹300 price range and 21-40% discount bracket**.
  
* *Quality Threshold*: A **4.4-star rating** serves as a major psychological barrier for consumers, products reaching this mark see **significantly higher feedback volume** than those even slightly below it.
* *Inventory Dominance*: A concentrated group of sellers, led by **"Roadster", "H&M" and "Puma"**, dictates the platform's volume, leveraging massive inventory depth to maintain market share.
* *Premium Product*: There is a distinct "luxury barrier" where **products priced above ₹50,000** experience a sharp decline in customer interaction, regardless of brand prestige.
* *Trust Variable*: Deep discounts are not a universal driver of sales, **engagement is heavily dependent on established seller reputation**, meaning high discounts from unknown sellers often fail to convert.

# Insights Deep Dive

### Promotional Efficiency: 
* Data shows that moderate discounts 21-40% range is the "trust threshold" for shoppers.
* Extreme discounts (>60%) often see engagement drop-offs unless the seller, like "Roadster", "Puma" etc have high established reputation.

![Q3](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q3.png)

### The Reputation Factor:
* High discounts do not guarantee engagement, **"Roadster"** maintains high trust at extreme discounts (417.54 avg ratings), while **"Anouk"** sees a significant drop (13.71 avg ratings) at similar price cuts.
 
![Q1](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q1.png)

### Quality Consistency:
* Global brands like **"Neutrogena" and "Dove"** lead the platform in quality consistency, maintaining average ratings of 4.4+ while supporting substantial customer feedback volumes.

![Q4](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q_4.png)

### Quality Engagement Threshold:
* A **4.4-star rating** is the primary "sweet spot" for maximizing feedback volume, proving that superior quality scores are essential for driving mass customer interaction.

![Q6](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q6.png)

### Price Sensitivity Barrier: 
* Engagement decays rapidly as prices rise; products priced under **<₹300 receive nearly 5x more engagement** than those in the >₹800 category.

![Q5](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q5.png)

### Inventory Dominance: 
* A specific elite group of sellers, specifically **"Roadster", "H&M" and "Puma"**, dominate the platform by leveraging massive inventory depth and high-volume product assortments.

![Q9](https://github.com/afrinanegaban/retail-product-pricing-and-engagement-analysis-eda-sql-/blob/main/Image/Q9.png)

# Recommendation

* Campaign Optimization: Focus promotions in the **21–40%** range to maximize engagement and conversion. 

* Inventory Expansion: Prioritize growth in the **₹100–₹3000** "sweet spot" to align with primary demand. 

* Strategic Partnerships: Leverage high-volume sellers like **“Roadster”** for exclusive launches and premium placements. 

* Benchmarking Quality: Use **4.4+ rated products** as benchmarks to standardize quality across low-volume sellers. 

* Premium Pivot: **Re-evaluate pricing** or listing strategies for high-end brands (₹50k+) showing minimal engagement. 

* Seller Growth: Identify **high-potential, low-volume sellers** for targeted optimization and inventory support. 


