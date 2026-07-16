# Project background 
“XYZ market“ is a retail company that started its business in 2024, the company owns 8 stores spread across the country and products are available for in store-purchase only. In the end of 2025, the executive team want to evaluate revenue and profitability for the current year across months, products and stores and to compare the results with the previous year.

The SQL queries used to inspect the data for this analysis can be found here [retail_eda.sql](https://github.com/Vanos008/retail_sales_analysis/blob/8a3b3df01943255c439ceebac35f7b58805b9da5/retail_eda.sql).   
A Tableau dashboard used to report and explore sales trends can be found here [Retail sales.twb](https://github.com/Vanos008/retail_sales_analysis/blob/57adfd23b3e03d1f5a9dc97b9eb3bac64fd6e002/Retail_sales.twb).

# Data Structure and initial checks
The company’s main database structure as seen below consists of six tables: 
- sales: transaction_id, transaction_datetime, customer_id, store_id, product_id, promotion_id, quantity, selling_price, total_revenue, total_cost and profit (20000 rows)
- products: product_id, product_name, category, subcategory, brand, unit_cost, base_price (24 rows)
- customers: customer_id, gender, age_group, region_id, registration_date (4000 rows)
- stores: store_id, store_name, region_id, opening_date (8 rows)
- regions: region_id, region_name (4 rows)
- promotions: promotion_id, promotion_name, start_date, end_date, category, discount_percentage (5 rows)

 ![erd](https://github.com/Vanos008/retail_sales_analysis/blob/440d120310541a7483f638537c2751eb41ae569b/entity%20relationship%20diagram.jpg)  
Data quality checks included verifying duplicate transactions, missing values, referential integrity between tables, and consistency of key fields before beginning the analysis.

# Executive summary
Total revenue reached $641K, representing a 5% increase compared with 2024. This growth was driven by a higher Average Order Value, while transaction volume remained largely unchanged. Total profit increased from $304K in 2024 to $321K in 2025, however profit margin remains stable.     
Top 5 products are laptop, smart TV, Smartphone X, Rice 5Kg and cooking pot set, most of them are highly priced products making them the main drivers of our total revenue. We also noticed that promotions did not appear to bring a meaningful increase in sales volume while reducing profit margins.   
For this year almost all stores got better sales numbers except the north region stores, especially northern horizon store because although customer count did not change much, their average spending has declined.

So, for 2026 it is recommended to bring more awareness to “XYZ market” brand to attract more customers and it is necessary to budget advertisement. Promotion strategy should be shifted to specific products promotions and not by category anymore emphasizing high value products. Finally, we want to run some investigations on the northern horizon store to find out why customers shifted toward lower-priced products.
 
# Insights deep dive
**Total sales in 2025 slightly exceeds 2024 sales:**   
Revenue in 2025 amounts at $641K with July being the best month at $62K and April the worst month at $40K. Compared to last year, this year’s revenue has grown by only 5,66% due to quite a similar transaction count: 10048 this year and 9952 for 2024.
Profit margin is around 50% similar to previous year. And Average Order value increased at $63,80 while last year’s was $60,96.
High seasons were in January, July and the entire Q4 period and the only low season was in April which shows similar pattern to last year.
 
**High priced electronics products are the primary sales driver:**   
Laptop, smart TV, Smartphone X, Rice 5Kg and cooking pot set are the products driving revenue trend in overall, these five products account for approximately 58% of total revenue, highlighting the company’s dependence on a relatively small group of high-performing products.
Laptop, smartphone X and smart TV are high-priced products therefore making them the primary contributors to revenue even if they are sold at low number. 
Cooking pot set is priced moderately and has a moderate sales number however is the highest valued product among the household items category. 
While Rice 5kg has the lowest price among the best five products, it is sold in high quantity and is the most expensive product in the food section category.

**Promotions application could not attribute to higher sales number:**   
Promotions were applied in high seasons to engage customers to buy more of the targeted product category and peak sales were expected for the promoted category. Although sales increased during promotional periods, the increase closely followed expected seasonal demand patterns. No additional sales uplift attributable to the promotions was observed, while discounted prices reduced profitability.

**Almost all store recorded higher revenue except for north region stores:**  
Compared to 2024 each store had better revenue except for north region stores, although this region was the best performing in the previous year. 
Last year, polar market center and northern horizon made $96K and $92K respectively, now polar market center has slightly declined at $92K and northern horizon sales collapsed at $68K. 
In 2025, east region stores are the top stores with $95K for sunrise retail hub and $90K for coastal trade plaza.  
Customer count hasn’t really changed over year across stores but we noticed that the average order value has increased for all stores except the north region stores especially for northern horizon store.
 
# Recommendations
- Increase the visibility of high-revenue products through strategic in-store placement to attract customer’s attention.
- Category-wide promotions appear to have delivered limited value. Future campaigns should focus on selected high-value products supported by advertising campaigns to increase customer awareness. During peak seasons, demand is already high, reducing the incremental value of promotions. Running promotions during low-demand periods is likely to deliver a higher return on investment.  
- Transactions number didn’t really increase so it is recommended to allocate budget for publicity to make our company known to a wider audience and attract more customers in our stores.  
- North region stores should adopt the same strategies that east region took for the year 2025. Additional investigations should also be conducted for the northern horizon store, which probably indicates strong competition presence in the vicinity.   
