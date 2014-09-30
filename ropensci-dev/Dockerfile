## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM cboettig/ropensci 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Install rhdf5 
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")'

## Github-dev versions of the R packages already on CRAN
RUN Rscript -e 'devtools::install_github(paste0("ropensci/",c("spocc", "AntWeb", "ecoengine", "rebird", "rAvis", "rfisheries", "treebase", "rfishbase", "rbhl", "rgbif", "taxize", "rsnps", "rentrez", "paleobioDB", "rnoaa", "rdryad", "RSelenium", "rinat", "rbison", "bold", "rplos", "aRxiv", "rAltmetric", "alm", "rfigshare", "dvn", "RNeXML", "solr", "Reol", "rWBclimate")))'

## Packages not yet on CRAN
RUN Rscript -e 'devtools::install_github(paste0("ropensci/", c("rnpn", "rvertnet", "gender", "geonames", "clifro", "ecoretriever", "traits", "rebi", "rorcid", "elife", "rdatacite", "bmc", "rcrossref", "rmetadata", "EML", "git2r", "testdat", "gistr", "elastic", "plotly", "togeojson")))'

## Additional dependencies
RUN Rscript -e 'devtools::install_github("ramnathv/rCharts"); install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/", type = "source")'

## Packages needing further configuration before install will work: 
RUN Rscript -e 'devtools::install_github(paste0("ropensci/", c("fulltext", "rMaps")))'


