<<<<<<< HEAD
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("TMixClust")

# load the package
library(TMixClust)
# load the simulated time series data set
data(toy_data_df)
# display the first rows of the data frame
print(head(toy_data_df))


cluster_obj = TMixClust(toy_data_df, nb_clusters = 3)

plot_silhouette(cluster_obj)


for (i in 1:3) {
  # extract the time series in the current cluster and plot them
  c_df=toy_data_df[which(cluster_obj$em_cluster_assignment==i),]
  plot_time_series_df(c_df, plot_title = paste("cluster",i))
}




# 100: Time difference of 14.84623 secs
# 200: Time difference of 17.12963 secs
# 300: Time difference of 55.38456 secs
# 500: Time difference of 144.7823 secs
# 1000: Time difference of 1154.193 secs
# 2000: Time difference of 1.663109 hours


data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:1000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time


data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:2000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time



data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:5000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time




data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:10000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time




for (i in 1:3) {
  # extract the time series in the current cluster and plot them
  c_df=df_sub[which(cluster_obj$em_cluster_assignment==i),]
  plot_time_series_df(c_df, plot_title = paste("cluster",i))
}




=======
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("TMixClust")

# load the package
library(TMixClust)
# load the simulated time series data set
data(toy_data_df)
# display the first rows of the data frame
print(head(toy_data_df))


cluster_obj = TMixClust(toy_data_df, nb_clusters = 3)

plot_silhouette(cluster_obj)


for (i in 1:3) {
  # extract the time series in the current cluster and plot them
  c_df=toy_data_df[which(cluster_obj$em_cluster_assignment==i),]
  plot_time_series_df(c_df, plot_title = paste("cluster",i))
}




# 100: Time difference of 14.84623 secs
# 200: Time difference of 17.12963 secs
# 300: Time difference of 55.38456 secs
# 500: Time difference of 144.7823 secs
# 1000: Time difference of 1154.193 secs
# 2000: Time difference of 1.663109 hours


data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:1000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time


data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:2000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time



data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:5000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time




data = read.csv("C:/Users/x_r_m/Downloads/expression_probe_mean_per_timepoint.csv")
df <- data[, 2:ncol(data)]
df_sub <- df[1:10000,]

start_time <- Sys.time()
cluster_obj = TMixClust(df_sub, nb_clusters = 3)
end_time <- Sys.time()
end_time - start_time




for (i in 1:3) {
  # extract the time series in the current cluster and plot them
  c_df=df_sub[which(cluster_obj$em_cluster_assignment==i),]
  plot_time_series_df(c_df, plot_title = paste("cluster",i))
}




>>>>>>> 01ba12da44870290598fcb448bf2d32dd79f2794
