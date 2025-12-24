**Objective**

The objective of this project is to clean, standardize, and prepare a real-estate (housing) dataset using SQL to improve data quality and make it suitable for analysis.

**Dataset**

Type: Housing / real-estate sales data

Format: Relational table

Key Fields: Sale date, property address, owner address, sale price, parcel ID, vacancy status

**Tools & Technologies**

SQL (T-SQL)

Concepts used:

Data cleaning

Data transformation

Schema modification

CTEs (Common Table Expressions)

**Data Cleaning & Transformation Steps**

The following steps were performed in SQL:

1. Date Standardization

Converted sale date to a proper DATE format

Added a new standardized date column

2. Handling Missing Values

Populated missing property addresses using self-joins on ParcelID

Used ISNULL logic to fill null values

3. Address Normalization

Split property and owner addresses into:

Address

City

State

Used SUBSTRING, CHARINDEX, and PARSENAME functions

4. Data Standardization

Standardized categorical values in SoldAsVacant field
(Y/N → Yes/No)

5. Duplicate Removal

Identified duplicate records using ROW_NUMBER() with CTEs

Removed redundant entries to ensure data integrity

6. Schema Cleanup

Dropped unused and redundant columns after transformation

**Outcome**

Cleaned and well-structured housing dataset

Improved consistency and readability of address and date fields

Removed duplicate and unnecessary data

Dataset ready for downstream analysis or visualization
