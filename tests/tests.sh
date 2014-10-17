
docker run --rm -it eddelbuettel/debian-r-base Rscript --default-packages="stats, graphics, grDevices, datasets, utils, methods, base" -e 'sapply(installed.packages()[,"Package"], tools::testInstalledPackage, type=c("examples", "tests"))'

docker run --rm -it eddelbuettel/debian-hadleyverse Rscript  --default-packages="stats, graphics, grDevices, datasets, utils, methods, base" -e 'sapply(c("devtools", "ggplot2", "dplyr", "tidyr", "reshape2", "roxygen2", "knitr", "testthat", "rmarkdown", "httr", "Rcpp"), tools::testInstalledPackage, type=c("examples", "tests"))'


Rscript --default-packages="stats, graphics, grDevices, datasets, utils, methods, base" -e 'sapply("base", tools::testInstalledPackage, type=c("examples", "tests"))'



