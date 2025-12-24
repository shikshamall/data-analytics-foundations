**Objective**

The goal of this project is to perform exploratory data analysis (EDA) on a movie dataset to understand the relationship between movie budget, gross earnings, and other attributes, and to identify key factors influencing movie revenue.

**Dataset**

Source: Public movie dataset (CSV format)

Contents: Movie metadata including budget, gross revenue, company, release year, ratings, and votes

Size: Medium-sized dataset suitable for EDA

**Tools & Technologies**

Python

Pandas – data cleaning and manipulation

NumPy – numerical operations

Matplotlib & Seaborn – data visualization

**Data Cleaning & Preprocessing**

The following preprocessing steps were performed:

Identified and analyzed missing values across all columns

Converted financial columns (budget, gross) to appropriate numeric data types

Filled missing numerical values with zero where applicable

Extracted release year from the released column as a new feature

Converted categorical variables to numerical codes for correlation analysis

**Exploratory Data Analysis**

Key analyses performed include:

Scatter plot analysis between budget and gross earnings

Regression plot to observe trends between budget and revenue

Correlation analysis using Pearson correlation

Heatmap visualization to identify strong relationships between numeric features

Analysis of both numeric and encoded categorical variables

**Key Insights**

1.Movie budget shows a strong positive correlation with gross earnings, indicating that higher-budget movies generally earn more revenue.

2.Release year has a very high correlation with the extracted year feature, validating the feature engineering step.

3.Votes and gross earnings also show moderate positive correlation, suggesting audience engagement impacts revenue.



Company and genre show relatively weaker correlations compared to financial variables.
