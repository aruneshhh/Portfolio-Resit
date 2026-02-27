# MODEL 1: Generalized Linear Model (Logistic Regression)
# We interpret this as: "How does the PROBABILITY of diabetes change?"
diabetes_data <- read.csv("DATASET/diabetes.csv")
cols_with_zeros <- c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI")
diabetes_data[cols_with_zeros] <- lapply(diabetes_data[cols_with_zeros], function(x) ifelse(x == 0, NA, x))
diabetes_data <- na.omit(diabetes_data)

glm_model <- glm(Outcome ~ Glucose + BMI + Age, 
                 data = diabetes_data, 
                 family = "binomial")

# MODEL 2: Ordinary Least Squares (Linear Regression)
# We interpret this as: "Fitting a straight line through the data points 
lm_model <- lm(Outcome ~ Glucose + BMI + Age, 
               data = diabetes_data)

print("--- Model 1 (GLM) Coefficients ---")
print(summary(glm_model))

print("--- Model 2 (Least Squares) Coefficients ---")
print(summary(lm_model))
