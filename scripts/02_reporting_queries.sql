-- ==========================================
-- PROJECT: Tax Data Reporting Automation
-- OBJECTIVE: Automated Management KPI Reporting
-- ==========================================

-- Create an automated View for Leadership KPIs. 
-- This completely eliminates manual data-entry and calculation loops.
CREATE OR REPLACE VIEW v_management_tax_summary AS
SELECT 
    Tax_Year,
    Filing_Status,
    COUNT(Record_ID) AS Total_Filings,
    SUM(Gross_Income) AS Total_Gross_Income,
    AVG(Deductions) AS Average_Deductions,
    -- Calculates the percentage of successfully completed files vs pending ones
    ROUND(SUM(CASE WHEN Status = 'Filed' THEN 1 ELSE 0 END) * 100.0 / COUNT(Record_ID), 2) AS Completion_Rate_Percentage
FROM 
    mock_tax_records
WHERE 
    Status != 'Flagged for Audit' -- Automatically filters out the corrupt rows we caught in script 01
GROUP BY 
    Tax_Year, 
    Filing_Status;

-- How a user would pull the real-time automated report:
SELECT * FROM v_management_tax_summary ORDER BY Tax_Year DESC;
