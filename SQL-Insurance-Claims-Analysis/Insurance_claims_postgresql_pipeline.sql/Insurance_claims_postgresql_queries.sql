-- =====================================
-- DATA CLEANING (RAW DATA FIXES)
-- =====================================

-- Standardize gender values
UPDATE customers
SET sex = LOWER(sex);

-- Fix negative claim amounts
UPDATE claims
SET claim_amount = ABS(claim_amount)
WHERE claim_amount < 0;

-- =====================================
-- CLAIMS BY REGION ANALYSIS
-- =====================================

SELECT 
    c.region,
    COUNT(cl.claim_id) AS total_claims,
    SUM(cl.claim_amount) AS total_claim_amount
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY c.region
ORDER BY total_claim_amount DESC;

-- =====================================
-- CLAIM RISK BY SMOKER STATUS
-- =====================================

SELECT 
    c.smoker,
    COUNT(cl.claim_id) AS total_claims,
    ROUND(AVG(cl.claim_amount), 2) AS avg_claim_amount
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY c.smoker
ORDER BY avg_claim_amount DESC;

-- =====================================
-- TOP CUSTOMERS BY CLAIM VALUE
-- =====================================

SELECT 
    customer_id,
    MAX(claim_amount) AS highest_claim
FROM claims
GROUP BY customer_id
ORDER BY highest_claim DESC
LIMIT 10;

-- =====================================
-- AGE GROUP CLAIM DISTRIBUTION
-- =====================================

SELECT
    CASE
        WHEN c.age < 30 THEN 'Under 30'
        WHEN c.age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(cl.claim_id) AS total_claims
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY age_group
ORDER BY total_claims DESC;

