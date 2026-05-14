# Manufacturing Defect Analysis (SQL & Power BI)

## Project Overview
This project analyzes manufacturing defect data to identify the root causes of production failures. I used SQL to extract and aggregate operational data, and Power BI to build an interactive diagnostic dashboard for the Quality Control team.

## Technical Skills Used
* **SQL (SQLite):** Data extraction, aggregation (SUM, AVG, COUNT), and financial risk calculation.
* **Power BI:** Interactive dashboard design, cross-filtering, and visual hierarchy.
* **Domain Knowledge:** Quality Engineering, Root Cause Analysis, and Risk Management.

## The Diagnostic Dashboard
The dashboard allows Quality Control Managers to instantly filter defect types by severity and inspection method, isolating the specific failures driving up repair costs.


<img width="969" height="547" alt="Manufacturing Defect Dashboard" src="https://github.com/user-attachments/assets/a4748e87-7f27-43c8-baaf-82fd94422f25" />

## Code Structure
View the -- ============================================================================
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
   `[defect_analysis.sql](https://github.com/user-attachments/files/27776509/defect_analysis.sql)
` file in this repository to see the specific queries used to track financial impact, evaluate inspection methods, and isolate high-risk component locations.
