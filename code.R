# importing csv file using R programming language

data <- read.csv("C:\\Users\\Pentagon Computer\\Desktop\\R_language\\dataset.csv")

# view the dataset in R studio

View(data)
summary(data)

# checking for null values
is.na(data)
# cleaning dataset /  removing null values 
cleaned_data <-data[complete.cases(data),] 

#creaing data frame with 13 variables
normal_data <- data.frame(cleaned_data$X, cleaned_data$Age, cleaned_data$Gender,cleaned_data$Body_Height, cleaned_data$Body_Weight, cleaned_data$Education_ID, cleaned_data$Financial_status, cleaned_data$GDS, cleaned_data$Independent_or_depend_on_family, cleaned_data$Marital_status_ID, cleaned_data$MNAa_total, cleaned_data$MNAb_total, cleaned_data$MMSE_class_binary)

#apply normalization to variables
normalized_data <- as.data.frame(scale(normal_data))

#viewing normalized data
View(normalized_data)

#summary of normalized data
summary(normalized_data)


age <- normalized_data$cleaned_data.Age
gender <- normalized_data$cleaned_data.Gender
height <- normalized_data$cleaned_data.Body_Height
weight <- normalized_data$cleaned_data.Body_Weight
education <-normalized_data$cleaned_data.Education_ID
financial_s <- normalized_data$cleaned_data.Financial_status
gds <- normalized_data$cleaned_data.GDS
i_or_d <- normalized_data$cleaned_data.Independent_or_depend_on_family
martial <-normalized_data$cleaned_data.Marital_status_ID
mna <- normalized_data$cleaned_data.MNAa_total
mnb <- normalized_data$cleaned_data.MNAb_total
mmse <- normalized_data$cleaned_data.MMSE_class_binary

my_data_frame <- data.frame(age, gender, height, weight, education, financial_s, gds, i_or_d, martial, mna, mnb, mmse)

ggplot(normalized_data, aes(x = normalized_data$cleaned_data.Age , y = normalized_data$cleaned_data.Financial_status)) + geom_point()

mean(normalized_data$cleaned_data.Age)

install.packages("caret")
library(caret)
train_indices <- createDataPartition(normalized_data$cleaned_data.Age, p = 0.7, list = FALSE)
training_data <- normalized_data[train_indices,]
test_data <- normalized_data[-train_indices,]

library(stats)
model1 <- lm(cleaned_data.Age ~ ., data = normalized_data)
summary(model1)

predictions <- predict(model1, newdata = test_data)
summary(predictions)

#calculations evaluation metrics
mse <- mean((predictions - test_data$cleaned_data.Age)^2)
rmse <- sqrt(mse)
mae <- mean(abs(predictions -test_data$cleaned_data.Age))
r_squared <- summary(model1)$r.squared

ggplot(data = normalized_data , aes(x = rmse , y = normalized_data$cleaned_data.Age)) + geom_point()
ggplot(data = normalized_data, aes(x = mae , y = normalized_data$cleaned_data.Age)) + geom_point()


results <- data.frame( acutal = test_data$cleaned_data.Age , predicted = mae)

ggplot(data = results, aes(x = acutal, y = predicted)) + geom_point() + xlab("Actual values") + ylab("Predicted values") + ggtitle("Linear Regression values")
