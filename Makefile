## README: This Makefile is for development/testing purposes only.
## Production should always pull the latest automated build from the Docker Hub.  


# Run in parallel: make -j
FLAGS=--no-cache

# In dependency order
all:
	$(MAKE) cboettig/rstudio
	$(MAKE) cboettig/ropensci
	$(MAKE) cboettig/ropensci-dev
	$(MAKE) strata 

cboettig/rstudio: rstudio/Dockerfile
	docker build $(FLAGS) -t cboettig/rstudio rstudio/
cboettig/ropensci: ropensci/Dockerfile
	docker build $(FLAGS) -t cboettig/ropensci ropensci/
cboettig/ropensci-dev: ropensci-dev/Dockerfile
	docker build $(FLAGS) -t cboettig/ropensci:dev ropensci-dev/

## My local customizations. Won't build generically 
strata: ../../dockerfiles/strata/Dockerfile
	docker build $(FLAGS) -t strata ../../dockerfiles/strata/


pull:
	docker pull cboettig/rstudio
	docker pull cboettig/ropensci:latest
	docker pull cboettig/ropensci:dev

# delete: docker rmi eddelbuettel/debian-r-base eddelbuettel/ubuntu-r-base eddelbuettel/debian-r-devel eddelbuettel/debian-rstudio eddelbuettel/ubuntu-r-devel eddelbuettel/ubuntu-rstudio eddelbuettel/debian-hadleyverse eddelbuettel/ubuntu-hadleyverse

#clean:
#	docker rm $(docker ps -a -q)
#	docker rmi $(docker images -q --filter "dangling=true")
