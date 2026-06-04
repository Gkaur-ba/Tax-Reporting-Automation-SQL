-- ==========================================
-- PROJECT: Tax Data Accuracy Optimization
-- OBJECTIVE: Data Cleaning and Validation
-- ==========================================

-- 1. REMOVE DUPLICATE RECORDS (Fixes the duplicate system glitch at Rows 5 & 6)
-- This logic identifies rows with identical Record_IDs and keeps only the most recent entry.
WITH DuplicateCTE AS (
    SELECT Record_ID,
           ROW_NUMBER() OVER (PARTITION BY Record_ID ORDER BY Submission_Date DESC) as row_num
    FROM mock_tax_records
)
DELETE FROM mock_tax_records 
WHERE Record_ID IN (SELECT Record_ID FROM DuplicateCTE WHERE row_num > 1);


-- 2. HANDLE MISSING VALUES (Fixes the missing Deductions value at Row 12)
-- If a deduction is blank (NULL), we set it to 0 so it doesn't break future math calculations.
UPDATE mock_tax_records
SET Deductions = 0
WHERE Deductions IS NULL;


-- 3. VALIDATE FINANCIAL RANGE (Flags the impossible negative income at Row 20)
-- A person cannot have negative gross income. We update their status to flag them for a manual human audit.
UPDATE mock_tax_records
SET Status = 'Flagged for Audit'
WHERE Gross_Income < 0;
