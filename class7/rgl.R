# sourcing
install.packages("rgl")
library("rgl")

# NOT RUN 
{
file.show(system.file("NEWS", package = "rgl"))
example(surface3d)
example(plot3d)
}

# NOT RUN 
{
x <- matrix(rnorm(30), ncol = 3, dimnames = list(NULL, c("x", "y", "z")))
p <- plot3d(x, type = "s")
str(p)
if (interactive())
  print(p, rglwidget = TRUE)
}