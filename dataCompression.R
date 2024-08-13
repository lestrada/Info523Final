if (!require("pacman"))
  install.packages("pacman")
pacman::p_load(jpeg,magick,here,factoextra,gridExtra,ggplot2)

rover_origin <- readJPEG(here("perserverance_mars_rover.jpeg"))

dim(rover_origin)

red <- rover_origin[,,1]
green <- rover_origin[,,2]
blue <- rover_origin[,,3]

red.pca <- prcomp(red, center=FALSE, scale.=FALSE)
green.pca <- prcomp(green, center=FALSE, scale.=FALSE)
blue.pca <- prcomp(blue, center=FALSE, scale.=FALSE)

list.rover_origin.pca <- list(red.pca, green.pca, blue.pca)

f1 <- fviz_eig(red.pca, choice = 'eigenvalue', main = "Red", barfill = "red", ncp = 7, addlabels = TRUE)
f2 <- fviz_eig(green.pca, choice = 'eigenvalue', main = "Green", barfill = "green", ncp = 7, addlabels = TRUE)
f3 <- fviz_eig(blue.pca, choice = 'eigenvalue', main = "Blue", barfill = "blue", ncp = 7, addlabels = TRUE)

grid.arrange(f1, f2, f3, ncol=3)
