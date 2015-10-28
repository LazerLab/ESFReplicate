#==============================================================================#
#
#  Conflict & Contagion Study
#  ESF Data, 2008-2014
#  Katya Ognyanova, esfpack@ognyanova.net
#  William Minozzi, william.minozzi@gmail.com
#
#==============================================================================#

# Install the ESFPack replication package from GitHib:
# install.packages('devtools')
# devtools::install_github("LazerLab/ESFReplicate", subdir="ESFpack")

library(ESFpack)
load("ESF_Data.RData")

source("finish_data_prep.R")
set.seed(1578331049, "L'Ecuyer")

m <- 100 # number of imputed datasets
b <- 1000 # number of bootstrapped replicates

source("estimate_base.R")
source("estimate_diversity.R")
source("estimate_new_scholar.R")
source("estimate_likely_unlikely_voters.R")
source("estimate_same_cross_party.R")
source("estimate_november.R")
source("estimate_mi_models.R")
source("estimate_miss.R")

save.image("analysis.Rdata")







