## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxslt1-dev \
    libgeos-dev \
    libgeos-c1 \
    gdal-bin \
    libgdal1h \
    libgdal1-dev \
    netcdf-bin \
    libproj-dev
## Install Omegahat dependencies 
RUN r -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt", "RWordXML", "RHTMLForms"), repo="http://www.omegahat.org/R", type="source")'

## Install Github dependencies
RUN Rscript -e 'devtools::install_github("DataONEorg/rdataone", subdir="dataonelibs"); devtools::install_github("ropensci/rdataone", subdir="dataone", dependencies=NA); devtools::install_github("egonw/rrdf", subdir="rrdflibs", build_vignettes=FALSE); devtools::install_github("egonw/rrdf", subdir="rrdf", build_vignettes=FALSE)'

## Install build dependencies
#RUN apt-get build-dep -y r-cran-rgeos r-cran-rgdal

## Install the rOpenSci R packages that are currently on CRAN
RUN install2.r 
  alm \
  AntWeb \
  aRxiv \
  bold \
  dvn \
  ecoengine \
  paleobioDB \
  rAltmetric \
  rAvis \
  rbhl \
  rbison \
  rdryad \
  rebird \
  rentrez \
  Reol \
  rfigshare \
  rfishbase \
  rfisheries \
  rgbif \
  rinat \
  RNeXML \
  rnoaa \
  rplos \
  RSelenium \
  rsnps \
  rWBclimate \
  solr \
  spocc \
  taxize \
  treebase 


