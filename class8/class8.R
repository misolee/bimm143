# K means example-----------


# Generate some example data for clustering
tmp <- c(rnorm(30,-3), rnorm(30,3))
x <- cbind(x=tmp, y=rev(tmp))
plot(x)

#use the kmeans() functions setting K to 2 and nstart=20
km <- kmeans(x, centers = 2, nstart=20 )
#inspect/print the results
km
#Q. How many points are in each cluster?
#Q. What 'component' of your result object details: cluster size, assignement/membership, centers
km$cluster
km$centers
km$size


#plot x colored by the kmeans cluster assignment and add cluster centers as blue points
plot(x, col=km$cluster)
points(km$centers, col = "blue", pch=15)
#Q. Repeat for k=3, which one has the better total SS?
km3 <- kmeans(x, centers = 3, nstart = 20)
km3
km3$withinss








########Hierarchial clustering example-----------
# First we need to calculate point (dis)similarity
#   as the Euclidean distance between observations
dist_matrix <- dist(x)
dist_matrix
#lets look at the class
class(dist_matrix)
View(as.matrix(dist_matrix))
dim(dist_matrix)
dim(as.matrix(dist_matrix))
# The hclust() function returns a hierarchical
#  clustering model
hc <- hclust(d = dist_matrix)
# the print method is not so useful here
hc
# Create hierarchical cluster model: hc
hc <- hclust(dist(x))
# We can plot the results as a dendrogram
plot(hc)
