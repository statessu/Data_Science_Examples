# Build the simple network structure 
net = model2network('[H][Ind1|H][Ind2|H]')

# Hypothis Prior
cptH = matrix(c(0.2, 0.8), ncol = 2, dimnames = list(NULL, c("True", "False")))

# Indicator 1 
cptInd1 = c(0.9, 0.1, 0.05, 0.95)
dim(cptInd1) = c(2,2)
dimnames(cptInd1) = list("Ind1" = c("True", "False"), "H" = c("True", "False"))

# Indicator 2
cptInd2 = c(0.7, 0.3, 0.01, 0.99)
dim(cptInd2) = c(2,2)
dimnames(cptInd2) = list("Ind2" = c("True", "False"), "H" = c("True", "False"))

# Fit the model 
cfit = custom.fit(net, dist = list(H = cptH, Ind1 = cptInd1, Ind2 = cptInd2))

# Pass evidence 
evidence = factor("True", levels = c("True", "False"))
evidence = data.frame(Ind1 = evidence)
state = predict(cfit, "H", evidence, method = "bayes-lw", prob = TRUE)