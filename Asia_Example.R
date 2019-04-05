# There are 5 main steps to Bayesian Network Analysis
# 1. Network Setup 
# 2. Network Structure Learning
# 3. Parameter Learning 
# 4. Model Validation
# 5. Inference 

# To use this script, the bnlearn library must be installed in R 
# install.packages(bnlearn)
# library(bnlearn)

# ******** 1. Network Setup ********
# Manually creating nodes and arcs. We will 
# not be doing this because we will be learning 
# the network structure. 

# ******** 2. Network Structure Learning ********
# There are multiple learning algorithms to learn network
# structures. I won't get into all of them. For purposes of 
# this example, I will just pick and run with the best one. 

struct = hc(asia)

# Additional arc added from A to T. There is a scoring algorithm
# that allows us to do this. I wont get into that. 

struct = set.arc(struct, from = "A", to = "T")

# ******** 3. Parameter Learning ********
# Now that we have our network structure, what are the values of 
# the Conditional Distributions that define the network? That 
# is the goal for this step. There are multiple learning algorithms, 
# I won't get into all of them. 

fit = bn.fit(struct, asia)
fit1 = bn.fit(struct, asia, method = "bayes")

# Our data is not fit. We can access the conditional relationship 
# of a variable using fit$

# ******** 4. Model Validation ********
# This step is to validate the training algorithm used. If we were unsure 
# which algorithm was best, we could test it in this step. However, I took care
# of this and picked the best algorithm. Therefore, I will skip
# this step 


# ******** 5. Inference ********
# We are now at the point to where we can pass evidence and make inferences about
# the data. This is the best part!!! It is important to note, the algorithms use a sampling
# technique. This will create a different value return for each inference. 

# Evidence from A to X 
cpquery(fit, event = (X=="yes"), evidence = (A=="yes"))

cpquery(fit, event = (X=="yes") & (L == "no"), evidence = (A=="yes"), n=100000)

