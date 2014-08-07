FROM eddelbuettel/docker-ubuntu-r:add-r
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add more recent debian CRAN repositories.  
RUN add-apt-repository -y ppa:marutter/c2d4u

## Remain current
RUN apt-get update -qq
RUN apt-get dist-upgrade -y

## From the Build-Depends of the Debian R package 
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion 

## Common utilities 
RUN apt-get install -y git pandoc pandoc-citeproc

## CRAN R packages with external dependencies 
RUN apt-get install -y r-cran-devtools r-cran-xml r-cran-rjava 

# RStudio packages from Github
RUN Rscript -e 'options(repos=c(CRAN="http://cran.rstudio.com")); devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat"))'

# Duncan packages from Omegahat
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema"), repo="http://www.omegahat.org/R", type="source")'

RUN apt-get install -y libxslt1-dev # xslt nees this
RUN Rscript -e 'install.packages(c("Sxslt"), repo="http://www.omegahat.org/R", type="source")'

## RStudio server -- not sure this works yet, should open rstudio-server at http://localhost:8707 w user:pw rstudio:rstudio
RUN apt-get install -y gdebi-core libapparmor1 libcurl4-openssl-dev
RUN wget http://download2.rstudio.org/rstudio-server-0.98.994-amd64.deb && \
gdebi -n rstudio-server-0.98.507-amd64.deb && \
rm rstudio-server-*-amd64.deb
RUN useradd -m rstudio && \
echo "rstudio:rstudio" | chpasswd
