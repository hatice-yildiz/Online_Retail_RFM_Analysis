# Online_Retail_RFM_Analysis
<!DOCTYPE html>
<html>
<head>
<style>
  /* CSS style rules */
  body {
    font-family: Arial, sans-serif;
    margin: 20px;
  }

  h1 {
    color: #333;
  }

  p {
    font-size: 16px;
    line-height: 1.5;
  }

  /* You can add your desired style rules to text elements here. */
</style>
</head>
<body>
  <h1>About RFM Analysis</h1>
  <p>
    <strong>Recency:</strong> Indicates when the customer last shopped. A smaller value is better for us. The Recency score is formed in a way that a small value is expressed as large. It gives information about how long the customer has been receiving service from the website/store, how long they have been a member of us. It is usually calculated by subtracting the last membership date/last order date from today.
  </p>
  <p>
    <strong>Frequency:</strong> The number of transactions made by the customer, the frequency of purchases, the total number of purchases. The biggest value is good for us. It is the metric that shows how often the customer shops, how often they log in to the site. It usually gives results by counting the order number/order code.
  </p>
  <p>
    <strong>Monetary:</strong> The monetary value left by customers. The highest value is good for us. RFM scores should be fewer so that they make sense for us; we create segments over Recency and Frequency scores. The one with low Frequency does not have a high Monetary value, so we remove it from the table. In summary, scores will be created on two dimensions, namely Recency and Frequency

