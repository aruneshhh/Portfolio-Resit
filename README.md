# Statistical and Causal Inference - Portfolio Resit

**Author:** Arunesh Venkatesan (s1162061)  
**Course:** NWI-IMC012 - Statistical and Causal Inference (Radboud University)  

## Overview
This repository contains the R scripts and data analysis for portfolio items 6, 7, 8, and 9. The analyses focus on predicting and understanding the causal mechanisms of diabetes using the Pima Indians Diabetes Database. 

## Contents
* **`item6.R`**: Regression analysis using a Generalized Linear Model (Logistic Regression) to predict diabetes risk based on Glucose, BMI, and Age.
* **`item7.R`**: Statistical inference comparing a probabilistic model (GLM) with a mathematical/geometric model (Ordinary Least Squares) for binary outcomes.
* **`item8.R`**: Likelihood-based model selection comparing a simple model to a complex model using AIC.
* **`item9.R`**: Causal inference analysis using Directed Acyclic Graphs (DAGs) to derive an adjustment set and estimate the direct causal effect of BMI on diabetes risk, independent of metabolic mediators.
* **`DATASET/`**: Contains the `diabetes.csv` dataset used for the analyses.

## Data Preprocessing Note
Exploratory analysis of the dataset revealed biologically implausible zero values for variables such as Glucose, Blood Pressure, Skin Thickness, Insulin, and BMI. In these scripts, these zeros are programmatically treated as missing data (`NA`) and a complete case analysis is performed ($n=392$) to ensure robust and logically sound model estimates.

## Requirements
To run the code, you will need R installed along with the following packages:
* `stats` (Base R)
* `dagitty` (Required for constructing the DAG and deriving the adjustment set in Item 9)
