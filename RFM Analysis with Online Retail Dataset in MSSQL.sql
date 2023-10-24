--RECENCY
--FREQUENCY
--MONETARY

CREATE TABLE online_retail_RFM(
	CustomerID varchar(20),
	LastInvoýceDate datetime,
	Recency int,
	Frequency int,
	Monetary int,
	Rcency_Score int,
	Frequency_Score int,
	Monetary_Score int,
	Segment Varchar(100)
)

-- Let's check new online_retail_RFM table
SELECT * FROM online_retail_RFM

--Let's add the ones with unique customerID to the online_retail_RFM we just created from online_retail_II
INSERT INTO online_retail_RFM(CustomerID)
SELECT DISTINCT Customer_ID FROM online_retail_II

--Retrieve customers' last purchase dates by CustomerID
UPDATE online_retail_RFM
	SET LastInvoýceDate= (SELECT MAX([InvoiceDate]) FROM online_retail_II WHERE Customer_ID =online_retail_RFM.CustomerID)

--RECENCY
UPDATE online_retail_RFM
	SET Recency=DATEDIFF(DAY,LastInvoýceDate,'20111231')

--FREQUENCY
UPDATE online_retail_RFM
	SET Frequency= (SELECT COUNT([InvoiceDate]) FROM online_retail_II WHERE Customer_ID =online_retail_RFM.CustomerID)

--MONETARY
UPDATE online_retail_RFM
	SET Monetary= (SELECT SUM(Price*Quantity) FROM online_retail_II WHERE Customer_ID =online_retail_RFM.CustomerID)


--Recency_Score
UPDATE online_retail_rfm SET Rcency_Score= 
(
 select RANK from
 (
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Recency desc) Rank
FROM online_retail_rfm
) t where  CustomerID=online_retail_rfm.CustomerID)

--Frequency
UPDATE online_retail_rfm SET Frequency_Score= 
(
 select RANK from
 (
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Frequency ) Rank
FROM online_retail_rfm
) t where  CustomerID=online_retail_rfm.CustomerID)

--Monetary
UPDATE online_retail_rfm SET Monetary_Score= 
(
 select RANK from
 (
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Monetary ) Rank
FROM online_retail_rfm
) t where  CustomerID=online_retail_rfm.CustomerID)

-- Let's check  online_retail_RFM table
SELECT * FROM online_retail_RFM

--Let's create segments
UPDATE online_retail_rfm SET Segment ='Hibernating' 
WHERE Rcency_Score LIKE  '[1-2]%' AND Frequency_Score LIKE '[1-2]%' 

UPDATE online_retail_rfm SET Segment ='At_Risk' 
WHERE Rcency_Score LIKE  '[1-2]%' AND Frequency_Score LIKE '[3-4]%'  

UPDATE online_retail_rfm SET Segment ='Cant_Loose' 
WHERE Rcency_Score LIKE  '[1-2]%' AND Frequency_Score LIKE '[5]%'  

UPDATE online_retail_rfm SET Segment ='About_to_Sleep' 
WHERE Rcency_Score LIKE  '[3]%' AND Frequency_Score LIKE '[1-2]%' 

UPDATE online_retail_rfm SET Segment ='Need_Attention' 
WHERE Rcency_Score LIKE  '[3]%' AND Frequency_Score LIKE '[3]%' 

UPDATE online_retail_rfm SET Segment ='Loyal_Customers' 
WHERE Rcency_Score LIKE  '[3-4]%' AND Frequency_Score LIKE '[4-5]%'

UPDATE online_retail_rfm SET Segment ='Promising' 
WHERE Rcency_Score LIKE  '[4]%' AND Frequency_Score LIKE '[1]%' 

UPDATE online_retail_rfm SET Segment ='New_Customers' 
WHERE Rcency_Score LIKE  '[5]%' AND Frequency_Score LIKE '[1]%' 

UPDATE online_retail_rfm SET Segment ='Potential_Loyalists' 
WHERE Rcency_Score LIKE  '[4-5]%' AND Frequency_Score LIKE '[2-3]%' 

UPDATE online_retail_rfm SET Segment ='Champions' 
WHERE Rcency_Score LIKE  '[5]%' AND Frequency_Score LIKE '[4-5]%'

-- Let's check  online_retail_RFM table
SELECT * FROM online_retail_RFM

--Let's see the size of each segment
SELECT Segment,COUNT(SEGMENT)
	FROM online_retail_RFM
	GROUP BY Segment