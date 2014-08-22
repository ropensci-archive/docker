FROM cboettig/rstudio 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## From the Build-Depends of the Debian R package 
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion 

## Hadley-verse 
RUN add-apt-repository -y ppa:marutter/c2d4u && apt-get update -qq
RUN apt-get install --no-install-recommends -y pandoc pandoc-citeproc r-cran-devtools r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev 
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/devtools", "hadley/ggplot2", "hadley/tidyr", "hadley/dplyr", "hadley/reshape"))'


## Omegahat-verse packages which need external librarues (from above)
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt"), repo="http://www.omegahat.org/R", type="source")'

## No CMD is needed: imported from cboettig/rstudio: Configures a persistent daemon running RStudio-server on (container) port 8787
## Otherwise, run interactively with /bin/batch where command is ignored.  


