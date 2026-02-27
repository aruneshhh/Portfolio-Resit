# Model A (The "Simple" Model)
diabetes_data <- read.csv("DATASET/diabetes.csv")

cols_with_zeros <- c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI")
diabetes_data[cols_with_zeros] <- lapply(diabetes_data[cols_with_zeros], function(x) ifelse(x == 0, NA, x))
diabetes_data <- na.omit(diabetes_data)


model_simple <- glm(Outcome ~ Glucose, 
                    data = diabetes_data, 
                    family = "binomial")

# Model B (The "Complex" Model)
model_complex <- glm(Outcome ~ Glucose + BMI + Age, 
                     data = diabetes_data, 
                     family = "binomial")

print(" AIC Comparison")
print(paste("Simple Model AIC: ", round(model_simple$aic, 2)))
print(paste("Complex Model AIC:", round(model_complex$aic, 2)))

