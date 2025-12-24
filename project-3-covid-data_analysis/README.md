**COVID-19 Data Analysis Using SQL
Objective**

The objective of this project is to analyze global COVID-19 data using SQL to understand infection rates, death percentages, and vaccination progress across countries and continents.

**Dataset**

Source: Public COVID-19 dataset

Tables Used:

CovidDeaths

CovidVaccination

Key Fields: Location, date, total cases, total deaths, population, new vaccinations

**Concepts used:**

Aggregations

Joins

Window functions

CTEs

Table creation & insertion

**Analysis Performed**

1. Case & Death Analysis

Retrieved total and new COVID-19 cases by country and date

Calculated death percentage using total cases vs total deaths

Calculated infected population percentage

2. Infection & Mortality Rates

Identified countries with the highest number of infections

Analyzed maximum death counts by country and continent

Computed global daily death percentage

3. Vaccination Analysis

Joined death and vaccination datasets using location and date

Calculated rolling total of vaccinations using window functions

Analyzed vaccination progress relative to population size

4. Advanced SQL Techniques

Used CTEs (Common Table Expressions) to calculate vaccination percentages

Created a new table (people_vaccinated) to store transformed vaccination data

Inserted processed data into the new table for further analysis

**Key Insights**

COVID-19 infection and death rates varied significantly across regions

Some countries showed high infection rates relative to population size

Vaccination rollout trends became clear when using cumulative vaccination calculations

Window functions enabled effective tracking of vaccination progress over time
