# What is the RFM Analysis?

![RFM_Segments](https://github.com/hatice-yildiz/Online_Retail_RFM_Analysis/blob/main/RFM_Segments.png)

## **Recency** 
When did the customer last shop? A smaller value is good for us. 
When the Recency score is formed, the score of the small value is expressed as large.
It gives information such as how long the customer has been receiving service from the website/store, how long they have been a member of us.
It is usually calculated by subtracting the last membership date/last order date from today.


## **Frequency** 
The number of transactions made by the customer, frequency of purchases, total number of purchases. 
The biggest value is good for us.
It is the metric that shows how often the customer shops, how often they log in to the site.
It usually gives results by counting the order number/order code.


## **Monetary** 
The monetary value left by customers. The highest value is good for us.

RFM scores should be fewer so that they make sense for us; we create segments over Recency and Frequency scores. The one with low Frequency does not have a high Monetary value, so we remove it from the table. In summary, scores will be created on two dimensions, namely recency and frequency.
