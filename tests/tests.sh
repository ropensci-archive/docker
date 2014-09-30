
docker run --rm -it eddelbuettel/debian-r-base Rscript -e 'sapply(installed.packages()[,"Package"], tools::testInstalledPackage)'
docker run --rm -it eddelbuettel/debian-hadleyverse Rscript -e 'sapply(installed.packages()[,"Package"], tools::testInstalledPackage)'
