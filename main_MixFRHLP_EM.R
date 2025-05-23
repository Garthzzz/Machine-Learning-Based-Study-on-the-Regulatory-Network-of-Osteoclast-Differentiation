if(T){
  "
% Curve clustering with the MixFRHLP model and the EM (or a CEM-like)
% algorithm
%
%%%% based on matlab code by Faicel Chamroukhi (2011)%%%%%%%
%
%   When using this code please cite the following papers : The two first
%   ones concern the model and its use in clusterng and the two last ones
%   concern the model and its use in discrimination, and a review.
%
% @article{Chamroukhi-RHLP-2009,
% 	Author = {Chamroukhi, F. and Sam\'{e}, A. and Govaert, G. and Aknin, P.},
% 	Journal = {Neural Networks},
% 	Number = {5-6},
% 	Pages = {593--602},
% 	Publisher = {Elsevier Science Ltd.},
% 	Title = {Time series modeling by a regression approach based on a latent process},
% 	Volume = {22},
% 	Year = {2009}
%     }
%
% @article{Chamroukhi-MixRHLP-2011,
% 	Author = {Sam{\'e}, A. and Chamroukhi, F. and Govaert, G{\'e}rard and Aknin, P.},
% 	Issue = 4,
% 	Journal = {Advances in Data Analysis and Classification},
% 	Pages = {301--321},
% 	Publisher = {Springer Berlin / Heidelberg},
% 	Title = {Model-based clustering and segmentation of time series with changes in regime},
% 	Volume = 5,
% 	Year = {2011}
%     }
%
%
%
% @article{Chamroukhi-FDA-2018,
% 	Journal = {Wiley Interdisciplinary Reviews: Data Mining and Knowledge Discovery},
% 	Author = {Faicel Chamroukhi and Hien D. Nguyen},
% 	Note = {DOI: 10.1002/widm.1298.},
% 	Volume = {},
% 	Title = {Model-Based Clustering and Classification of Functional Data},
% 	Year = {2018},
% 	Month = {Dec}}
%
%
% @article{Chamroukhi-RHLP-FLDA,
% 	Author = {Chamroukhi, F. and Sam\'{e}, A. and Govaert, G. and Aknin, P.},
% 	Journal = {Neurocomputing},
% 	Number = {7-9},
% 	Pages = {1210--1221},
% 	Title = {A hidden process regression model for functional data description. Application to curve discrimination},
% 	Volume = {73},
% 	Year = {2010}
%     }
%
% @article{Chamroukhi-FMDA-2013,
% 	Author = {Chamroukhi, F. and Glotin, H. and Sam{\'e}, A.},
% 	Journal = {Neurocomputing},
% 	Pages = {153-163},
% 	Title = {Model-based functional mixture discriminant analysis with hidden process regression for curve classification},
% 	Volume = {112},
% 	Year = {2013}
%     }
"
  rm(list = ls())
  setwd("~/Documents/travail_CAEN/MixFRHLP_R/") # setting the path of your working directory
}



setwd("/Users/wangbeini/Documents/Columbia U/5243-bio/final project/MixFRHLP_R-master 2")
source("dataset.R")
source("MixModel.R")
source("ModelOptions.R")
source("ModelLearner.R")


# loading and setting the data
mixData <- MyData$new()
mixData$setData("data/generated_data_3.csv")

# setting the model
G <- 27; # number of clusters
K <- 1; # number of regimes (polynomial regression components)
p <- 2; # degree of the polynomials
q <- 1; # order of the logistic regression (by default 1 for contiguous segmentation)
mixModel <- MixModel(mixData,G,K,p,q)

# setting the model options
n_tries <- 1 # number of tries EM/CEM to run
max_iter <- 500 # maximum number of iteration in the EM/CEM algorithm
threshold <- 1e-5 # threshold to check the convergence
verbose <- TRUE # verbose the EM/CEM algorithm
verbose_IRLS <- FALSE # verbose the IRLS algorithm
init_kmeans <- TRUE # initialization of the parameters (with/without) Kmeans algorithm
modelOptions <- ModelOptions(n_tries, max_iter, threshold, verbose, verbose_IRLS, init_kmeans, variance_types$free)

####
# EM Algorithm
####
# 1. running the em algorithm giving mixModel (data, and model itself) and the modelOptions
solution <- EM(mixModel, modelOptions)
# 2. getting the mixture parameters solution
mixParamSolution <- solution[[1]] 
# 3. getting the mixture stats solution
mixStatsSolution <- solution[[2]]
mixStatsSolution$klas



saveRDS(solution,'solution27.rds')
# show the results
mixStatsSolution$showDataClusterSegmentation(mixModel, mixParamSolution)
# dev.off()
####
# CEM Algorithm
####
#solution <- CEM(mixModel, modelOptions)
#mixParamSolution <- solution[[1]]
#mixStatsSolution <- solution[[2]]
#mixStatsSolution$showDataClusterSegmentation(mixModel, mixParamSolution)
