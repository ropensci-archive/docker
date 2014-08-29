FROM cboettig/rstudio 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN add-apt-repository -y ppa:marutter/c2d4u && apt-get update -qq && apt-get dist-upgrade -qy 

## From the Build-Depends of the Debian R package, + 
## texlive elements used in common templates (elsarticle class), +
## pandoc environment + imagemagick (used by rmarkdown for cropping) + 
## binaries for r package dependencies & libraries for R packages which must be installed from source. 
## NOTE: unfortunately, all those LaTeX libraries are really heavy...
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra imagemagick pandoc pandoc-citeproc r-cran-devtools r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev 

## Hadley-verse 
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/devtools", "hadley/ggplot2", "hadley/tidyr", "hadley/dplyr", "hadley/reshape"))'

## Omegahat-verse packages which need external librarues (from above)
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt"), repo="http://www.omegahat.org/R", type="source")'

## rhdf5
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE)'

## rdf tools
RUN Rscript -e 'devtools::install_github("egonw/rrdf", subdir="rrdflibs", build_vignettes=FALSE); devtools::install_github("egonw/rrdf", subdir="rrdf", build_vignettes=FALSE)'

## No CMD is needed: imported from cboettig/rstudio. 
## This Configures a persistent daemon running RStudio-server on (container) port 8787
## Otherwise, run interactively with /bin/batch where command is ignored.  


