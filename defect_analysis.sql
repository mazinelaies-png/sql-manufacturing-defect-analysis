-- ============================================================================
-- Manufacturing Defect Analysis
-- Portfolio Project: Quality Control & Risk Management
-- Database: SQLite
-- ============================================================================

-- 1. TOTAL FINANCIAL IMPACT BY DEFECT TYPE
-- Objective: Identify which defect type causes the highest financial loss.
SELECT 
    defect_type, 
    COUNT(defect_id) AS total_defects, 
    ROUND(SUM(repair_cost), 2) AS total_repair_cost
FROM manufacturing_defects
GROUP BY defect_type
ORDER BY total_repair_cost DESC;

-- 2. CRITICAL SEVERITY BY INSPECTION METHOD
-- Objective: Evaluate which inspection method catches the most 'Critical' defects.
SELECT 
    inspection_method, 
    COUNT(defect_id) AS critical_defects_caught
FROM manufacturing_defects
WHERE severity = 'Critical'
GROUP BY inspection_method
ORDER BY critical_defects_caught DESC;

-- 3. AVERAGE REPAIR COST BY COMPONENT LOCATION
-- Objective: Determine the most expensive physical locations to repair.
SELECT 
    defect_location, 
    COUNT(defect_id) AS defect_count,
    ROUND(AVG(repair_cost), 2) AS avg_cost_per_repair
FROM manufacturing_defects
GROUP BY defect_location
ORDER BY avg_cost_per_repair DESC;

-- 4. OVERALL SEVERITY DISTRIBUTION AND COST
-- Objective: Understand the proportion of Minor, Moderate, and Critical issues.
SELECT 
    severity, 
    COUNT(defect_id) AS total_incidents,
    ROUND(SUM(repair_cost), 2) AS total_cost
FROM manufacturing_defects
GROUP BY severity
ORDER BY total_cost DESC;
   