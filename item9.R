if(!require(dagitty)) install.packages("dagitty")
library(dagitty)

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

plot(dag_model)


adj_set <- adjustmentSets(dag_model, exposure = "BMI", outcome = "Outcome", effect = "direct")

print(" Adjustment Set for Direct Effect")
print(adj_set) 


causal_model <- glm(Outcome ~ BMI + Age + Pregnancies + DiabetesPedigreeFunction + 
                      Glucose + BloodPressure + Insulin + SkinThickness,
                    data = diabetes_data, 
                    family = "binomial")


print("--- Direct Causal Effect of BMI (Coefficients) ---")
print(summary(causal_model))
