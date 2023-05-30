---JOINING THE DATA 


SELECT*










FROM SQLSales..product_price pp

JOIN SQLSales..retailer_id ri

ON  pp.order_id = ri.order_id

JOIN  SQLSales..retailer_name rn 

ON rn.Order_id = ri.order_id 

JOIN SQLSales..sales_method sm 

ON  sm.order_id  = rn.Order_id

JOIN SQLSales..state_region sr 

ON sm.order_id = sr.order_id

JOIN SQLSales..invoice_date ida

ON   sr.order_id = ida.order_id 




ORDER BY 1,2;



---SELECTING MAJOR COLUMNS FOR ANALYSIS AND CALCULATING THE TOTAL SALES USING COMMON TABLE EXPRESSION 


WITH Addidas_Sales AS(
SELECT

ri.order_id,
pp.product_name,
CONVERT( INT,pp.unit_price) AS Unit_Price,
ri.units_sold,
ri.units_sold* pp.unit_price AS Total_Sales,
ri.retail_id,
rn.retailer,
ida.city,
ida.state,
ida.region,
ida.[invoice_ date],
sr.operating_margin,

sm.sales_method

FROM SQLSales..product_price pp

JOIN SQLSales..retailer_id ri

ON  pp.order_id = ri.order_id

JOIN  SQLSales..retailer_name rn 

ON rn.Order_id = ri.order_id 

JOIN SQLSales..sales_method sm 

ON  sm.order_id  = rn.Order_id

JOIN SQLSales..state_region sr 

ON sm.order_id = sr.order_id

JOIN SQLSales..invoice_date ida

ON   sr.order_id = ida.order_id )



SELECT
order_id,
retailer,
[invoice_ date],
city,
state,
region,
product_name,
Unit_Price,
units_sold,
Total_Sales,
CONVERT(float,(Total_Sales* operating_margin))AS Profit,
sales_method



FROM Addidas_Sales

ORDER BY 1,2
