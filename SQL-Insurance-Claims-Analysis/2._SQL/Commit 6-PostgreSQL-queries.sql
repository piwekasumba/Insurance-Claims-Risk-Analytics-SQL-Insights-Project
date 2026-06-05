-- Claims by status (severity proxy)
SELECT
    claim_severity,
    COUNT(*) AS num_claims,
    SUM(claim_amount) AS total_claim_amount,
    AVG(claim_amount) AS avg_claim_amount
FROM claims_clean
GROUP BY claim_severity
ORDER BY num_claims DESC;

-- Monthly claims trend
SELECT
    claim_year,
    claim_month,
    COUNT(*) AS num_claims,
    SUM(claim_amount) AS total_claim_amount,
    AVG(claim_amount) AS avg_claim_amount
FROM claims_clean
GROUP BY claim_year, claim_month
ORDER BY claim_year, claim_month;

-- Claims by severity type
SELECT
    claim_severity,
    COUNT(*) AS num_claims,
    AVG(claim_amount) AS avg_claim_amount
FROM claims_clean
GROUP BY claim_severity
ORDER BY avg_claim_amount DESC;

-- Top high-value customers
SELECT
    customer_id,
    total_claims,
    total_claim_amount,
    avg_claim_amount
FROM customer_summary
ORDER BY total_claim_amount DESC
LIMIT 10;

-- Severity distribution
SELECT
    claim_severity,
    COUNT(*) AS num_claims,
    SUM(claim_amount) AS total_claim_amount
FROM claims_clean
GROUP BY claim_severity
ORDER BY claim_severity;


