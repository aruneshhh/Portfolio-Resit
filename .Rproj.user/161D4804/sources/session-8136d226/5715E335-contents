if(!require(dagitty)) install.packages("dagitty")
library(dagitty)

# We define a complex structure involving almost all variables:
# 1. "Confounders" (Age, Pregnancies, Pedigree) cause BMI and Outcome.
# 2. "Mediators" (Glucose, BP, Insulin) are caused by BMI and cause Outcome.
# 3. We want to know: Is there still a direct arrow from BMI -> Outcome?

dag_model <- dagitty("dag {
    Age -> BMI
    Age -> Outcome
    Pregnancies -> BMI
    Pregnancies -> Outcome
    DiabetesPedigreeFunction -> BMI
    DiabetesPedigreeFunction -> Outcome
    
    BMI -> Glucose -> Outcome
    BMI -> BloodPressure -> Outcome
    BMI -> Insulin -> Outcome
    BMI -> SkinThickness -> Outcome
    
    BMI -> Outcome [outcome, exposure]
}")

# ---------------------------------------------------------
# STEP 2: Derive the Adjustment Set (For DIRECT Effect)
# ---------------------------------------------------------
# We ask: "What must I control to see the DIRECT effect of BMI, 
# blocking the paths through Glucose, BP, etc.?

adj_set <- adjustmentSets(dag_model, exposure = "BMI", outcome = "Outcome", effect = "direct")

print("--- Required Adjustment Set for Direct Effect ---")
print(adj_set) 
# The output will tell us to adjust for EVERYTHING: 
# {Age, Pregnancies, Pedigree, Glucose, BP, Insulin, SkinThickness}

# ---------------------------------------------------------
# STEP 3: Perform Causal Analysis (Direct Effect)
# ---------------------------------------------------------

# We fit the full model with all variables
causal_model <- glm(Outcome ~ BMI + Age + Pregnancies + DiabetesPedigreeFunction + 
                      Glucose + BloodPressure + Insulin + SkinThickness,
                    data = diabetes_data, 
                    family = "binomial")

# ---------------------------------------------------------
# STEP 4: Interpret the Result
# ---------------------------------------------------------
print("--- Direct Causal Effect of BMI (Coefficients) ---")
print(summary(causal_model))
