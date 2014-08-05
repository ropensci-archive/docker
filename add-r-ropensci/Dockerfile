FROM eddelbuettel/docker-ubuntu-r:add-r
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add more recent debian CRAN repositories.  
RUN add-apt-repository -y ppa:marutter/c2d4u

## Remain current
RUN apt-get update -qq
RUN apt-get dist-upgrade -y


RUN apt-get install -y r-cran-devtools r-cran-xml 
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema"), repo="http://www.omegahat.org/R", type="source")'


