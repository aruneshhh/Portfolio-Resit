diabetes_data <- read.csv("DATASET/diabetes.csv")
cols_with_zeros <- c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI")
diabetes_data[cols_with_zeros] <- lapply(diabetes_data[cols_with_zeros], function(x) ifelse(x == 0, NA, x))
diabetes_data <- na.omit(diabetes_data)

model <- glm(Outcome ~ Glucose + BMI + Age, data = diabetes_data, family = "binomial")
summary(model)

