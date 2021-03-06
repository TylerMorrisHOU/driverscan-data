# uncomment these lines to install the necessary packages if you haven't
# already

# install.packages('ggplot2')
# install.packages('ggmap')
# install.packages('dbscan')

# Loads the necessary R libraries

library('ggplot2')
library('ggmap')
library('dbscan')

# Reads in the necessary crash data as a R table object

crash <- read.table("Crash_Statistics_DataSet_Final.csv", header = TRUE, 
                    sep = ",", colClasses = c('character', "NULL","NULL",
                                              "NULL","NULL",'numeric',
                                              'numeric',"NULL"))
dist <- .1/69


# Clusters data according to dbscan, and appends the cluster associated with 
# each point

res <- dbscan(as.matrix(cbind(crash$Longitude, crash$Latitude)), eps = .5/69, 
                 minPts = 125)

crash$cluster <- res$cluster

# Generates a 2-dimensional density map and heat map of all crashes in Houston,
# overlaid on a map of Houston.

qmap('Houston') +
  geom_density2d(data = crash,
                 aes(Longitude, Latitude)) +
  stat_density2d(data = crash[crash$cluster != 0,], 
                 aes(Longitude, Latitude, 
                     fill = ..level..,
                     alpha = ..level..),
                 size = 0.3,
                 geom = 'polygon') +
  scale_fill_gradient(low = 'green',
                      high = 'red') +
  scale_alpha(range = c(0.25, 0.5),
              guide = FALSE)

# Writes the modified crash data to a CSV file for use in the Java app.

write.csv(crash, file = 'clustered_crashes.csv', row.names = FALSE)
  