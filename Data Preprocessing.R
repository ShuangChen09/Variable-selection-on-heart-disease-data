library(readr)
library(ggplot2)
library(corrplot)
library(dplyr)
library(gridExtra)
library(ggpubr)
library(rms)
library(glmnet)
library(ncvreg)
library(pROC)
library(ROCR)
library(forestplot)
library(ROSE)
library(purrr)
library(tidyverse)
library(patchwork)
library(ggthemes)
library(StepReg)
## Read Data
data<- read_csv("C:/Users/LX/Desktop/heart_2020_cleaned.csv")
## Data Preprocessing
data$HeartDisease=ifelse(data$HeartDisease=='Yes',1,0)
data$Smoking=ifelse(data$Smoking=='Yes',1,0)
data$AlcoholDrinking=ifelse(data$AlcoholDrinking=='Yes',1,0)
data$Stroke=ifelse(data$Stroke=='Yes',1,0)
data$DiffWalking=ifelse(data$DiffWalking=='Yes',1,0)
data$Sex=ifelse(data$Sex=='Female',1,0)
table(data$Race)
data$Race=ifelse(data$Race=='White',1,0)
data$Diabetic=ifelse(data$Diabetic=='Yes',1,0)
data$SkinCancer=ifelse(data$SkinCancer=='Yes',1,0)
data$KidneyDisease=ifelse(data$KidneyDisease=='Yes',1,0)
data$Asthma=ifelse(data$Asthma=='Yes',1,0)
data$PhysicalActivity=ifelse(data$PhysicalActivity=='Yes',1,0)
table(data$GenHealth)
data$GenHealth[data$GenHealth=='Very good']=100
data$GenHealth[data$GenHealth=='Good']=80
data$GenHealth[data$GenHealth=='Excellent']=60
data$GenHealth[data$GenHealth=='Fair']=40
data$GenHealth[data$GenHealth=='Poor']=20
table(data$AgeCategory)
data$AgeCategory[data$AgeCategory=='18-24']=21
data$AgeCategory[data$AgeCategory=='25-29']=27
data$AgeCategory[data$AgeCategory=='30-34']=32
data$AgeCategory[data$AgeCategory=='35-39']=37
data$AgeCategory[data$AgeCategory=='40-44']=42
data$AgeCategory[data$AgeCategory=='45-49']=47
data$AgeCategory[data$AgeCategory=='50-54']=52
data$AgeCategory[data$AgeCategory=='55-59']=57
data$AgeCategory[data$AgeCategory=='60-64']=62
data$AgeCategory[data$AgeCategory=='65-69']=67
data$AgeCategory[data$AgeCategory=='70-74']=72
data$AgeCategory[data$AgeCategory=='75-79']=77
data$AgeCategory[data$AgeCategory=='80 or older']=85
# Store the processed data
write.csv(data,file='C:/Users/LX/Desktop/data.csv')
# To check for missing values
is.na(data)
data<- read_csv("C:/Users/LX/Desktop/data.csv")
data=select(data, -Race)
data=select(data,-...1)


