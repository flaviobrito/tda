##########################
### Titanic Data Analysis
### Flávio Brito
##########################

setwd("/Users/flaviobrito/Desenv_Flavio/R/Kaggle_Titanic-master/")
trainData <-
  read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <-
  read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)

head(trainData)
plot(density(trainData$Age, na.rm = TRUE))
plot(density(trainData$Fare, na.rm = TRUE))

#Survivous
counts <- table(trainData$Survived, trainData$Sex)
View(counts) #shows survived by sex
barplot(counts,
        xlab = "Gender",
        ylab = "Number of people",
        main = "Survived and deceased between male and female")

Pclass_survival <- table(trainData$Survived, trainData$Pclass)
View(Pclass_survival)
barplot(Pclass_survival,
        xlab = "Cabin Class",
        ylab = "Number of People",
        main = "survived and deceased between male and female")
cat(
  "Survival_Rate_First_Class=",
  Pclass_survival[2] / (Pclass_survival[1] + Pclass_survival[2])
)
cat(
  "Survival_Rate_Second_Class=",
  Pclass_survival[4] / (Pclass_survival[3] + Pclass_survival[4])
)
cat(
  "Survival_Rate_Third_Class=",
  Pclass_survival[6] / (Pclass_survival[5] + Pclass_survival[6])
)

Pclass_survival_sex <-
  table(trainData$Survived, trainData$Pclass, trainData$Sex)

View(Pclass_survival_sex)
#transform object table into data frame
df_Pclass_survived_sex <-
  data.frame(table(trainData$Survived, trainData$Pclass, trainData$Sex))

#filter only survivials
df_survived <- subset(df_Pclass_survived_sex, Var1 == '1')
View(df_survived)
names(df_survived) <- c("Survivors", "Class", "Sexo", "Frequency")

