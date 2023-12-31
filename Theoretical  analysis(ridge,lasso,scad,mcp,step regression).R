## ridge regression
fit_ridge<-glmnet(x=data[,-1],y=data[,1],family='binomial',alpha=0)
plot(fit_ridge,xvar='lambda')
fit_ridge_cv<-cv.glmnet(x=data[,-1],y=data[,1],family='binomial',alpha=0,type.measure='mse')
plot(fit_ridge_cv)
best_lambda_ridge<-fit_ridge_cv$lambda.1se
best_lambda_ridge
best_model_ridge<- glmnet(x=data[,-1],y=data[,1],alpha = 0,lambda =best_lambda_ridge)
coef(best_model_ridge)
summary(best_model_ridge)
# Lasso regression
split.screen(c(1, 2))
data=as.matrix(data)
fit_lasso<-glmnet(x=data[,-1],y=data[,1],family='binomial',alpha=1)
screen(2)
plot(fit_lasso,xvar='lambda')
text(-3,-0.5,"B")
fit_lasso_cv<-cv.glmnet(x=data[,-1],y=data[,1],family='binomial',alpha=1,type.measure='mse')
screen(1)
plot(fit_lasso_cv)
text(-3,0.135,"A")
best_lambda_lasso<-fit_lasso_cv$lambda.1se
best_lambda_lasso
best_model_lasso <- glmnet(x=data[,-1],y=data[,1],alpha = 1,lambda = best_lambda_lasso)
coef(best_model_lasso)
# SCAD regression
fit_scad<-ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="SCAD")
plot(fit_scad,xvar='lambda')
fit_scad_cv<-cv.ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="SCAD",type.measure='mse')
plot(fit_scad_cv)
best_lambda_scad<-fit_scad_cv$lambda.min
best_lambda_scad
best_model_scad<-ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="SCAD",lambda = best_lambda_scad)
coef(best_model_scad)
# MCP regression
fit_mcp<-ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="MCP")
plot(fit_mcp,xvar='lambda')
fit_mcp_cv<-cv.ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="MCP",type.measure='mse')
plot(fit_mcp_cv)
best_lambda_mcp<-fit_mcp_cv$lambda.min
best_lambda_mcp
best_model_mcp<-ncvreg(X=data[,-1],y=data[,1],family='binomial',penalty ="MCP",lambda = best_lambda_mcp)
coef(best_model_mcp)
# step regression
stepwiseLogit(HeartDisease~BMI+Smoking+AlcoholDrinking+Stroke+PhysicalHealth
              +MentalHealth+DiffWalking+Sex+AgeCategory+Diabetic+GenHealth+PhysicalActivity+
              SleepTime+Asthma+KidneyDisease+SkinCancer,data=data,
              selection="bidirection",select="SL",sle=0.1,sls=0.15)
# final decision oh the choice of models
modelall<-glm(HeartDisease~BMI+Smoking+AlcoholDrinking+Stroke+PhysicalHealth
            +MentalHealth+DiffWalking+Sex+AgeCategory+Diabetic+GenHealth+PhysicalActivity+
              SleepTime+Asthma+KidneyDisease+SkinCancer,data=data,family = 'binomial')
modelall
summary(modelall)
modelstep<-glm(HeartDisease~Smoking+Stroke+PhysicalHealth
            +DiffWalking+Sex+AgeCategory+Diabetic,data=data,family = 'binomial')
modelstep
summary(modelstep)
modellasso<-glm(HeartDisease~Smoking+Stroke+PhysicalHealth
            +DiffWalking+Sex+AgeCategory+Diabetic+GenHealth+
              Asthma+KidneyDisease+SkinCancer,data=data,family = 'binomial')
modellasso
summary(modellasso)
#########
attach(data)
ddist=datadist(data)
options(datadist='ddist')
modelalllrm<-lrm(HeartDisease~BMI+Smoking+AlcoholDrinking+Stroke+PhysicalHealth
              +MentalHealth+DiffWalking+Sex+AgeCategory+Diabetic+GenHealth+PhysicalActivity+
                SleepTime+Asthma+KidneyDisease+SkinCancer,data=data,x=T,y=T)
modelalllrm
summary(modelalllrm)
modelsteplrm<-lrm(HeartDisease~Smoking+Stroke+PhysicalHealth
               +DiffWalking+Sex+AgeCategory+Diabetic,data=data,x=T,y=T)
modelsteplrm
summary(modelsteplrm)
modellassolrm<-lrm(HeartDisease~Smoking+Stroke+PhysicalHealth
                +DiffWalking+Sex+AgeCategory+Diabetic+GenHealth+
                  Asthma+KidneyDisease+SkinCancer,data=data,x=T,y=T)
modellassolrm
summary(modellassolrm)
