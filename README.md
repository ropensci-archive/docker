## Docker for ROpenSci

This repository provides Dockerfiles for provisioning a completely
portable environment for reproducible research in R.

A user creates an R terminal instance or RStudio Server instance running
in a complete development environment on either local or cloud computer
on any major operating system. A user can install new software and save
changes to their image, see (somewhat coarsely) the history of changes
made to their image, and roll back to earlier versions.

These Dockerfiles build on Dirk's [eddelbuettel/docker-ubuntu-r:add-r]() image,
which adds the basic current release of the R environment to the `ubuntu:latest` image.

## Getting started:

- See [Installing Docker]() for your operating system, or launch a cheap
cloud instance with [docker already installed]().

- Download and run an R terminal instance: `sudo docker run -it
cboettig/rstudio /usr/bin/R`

- Download and run an RStudio server instance: `sudo docker run -d -p
8787:8787 cboettig/rstudio` - You can now reach your RStudio server
at `http://<system_ip_address>:8787`.  For Windows/Mac users, run
`boot2docker ip` to get the value of `system_ip_address`. (This should
be `http://92.168.59.103:8787` but may vary as it is set dynamically).
For linux users, you can just use `localhost`.  For cloud instances,
check your server's public IP address.  - login using the default
rstudio:rstudio for user:pw, or configure particular users (see below).

## Options

- Replace `cboettig/rstudio` with `cboettig/ropensci` to run a richer (but larger) development environment.  See below for details.
- Set user name and password using environmental variables, e.g.

```bash
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> -e EMAIL=you@somewhere.com cboettig/rstudio
```
- Link the container to a local folder.



These commands will be slow on the first run since the image must be
downloaded.  Afterwards they should be pretty quick.

## rstudio Dockerfile

The `rstudio` Dockerfile adds an RStudio server and git.  You can also set
the user name, user email, and login password as environmental variables.
The user name is used for RStudio login and as the git user. The email
address is only used to set the git email configuration (required for
commits).  The password is used only for the Rstudio login (and sudo
commands in a bash shell in the container).  If these variables are not
provided, they default to `rstudio`, `rstudio` and `rstudio@example.com`.
(While this is fine when running docker locally, you probably don't want
to use these defaults on a webserver with a public IP address).

Builds of this image from this Dockerfile are avialble on through the
Dockerhub as `cboettig/rstudio`.

## ropensci Dockerfile

The `ropensci` Dockerfile provides a rich development environment for R.
This environment builds on `rstudio`, but adds the standard compiler tools
required to build R, LaTeX and pandoc support, commonly used packages
from Rstudio and the Hadleyverse (including their suggested dependencies),
and some useful Omegahat packages that also require additional libraries.

## Remote Linux clusters without root

You can run the docker images on a remote linux cluster where you don't
have root access, even if it doesn't have a web-accessible API (such as
a university server).  Ask your friendly system administrator to install
vagrant and virtualbox.  Then we can use a lightweight virtualbox in
which we can run Docker (this is just what boot2docker does in windows
and mac, in fact, we'll use an image based on boot2docker since it has
just what we need, and at just 24 MB is way smaller than a standard
ubuntu virtualbox image).

A Vagrantfile for getting up and running with this image is found in the
`vagrant` directory.  This handles exporting ports to the host machine,
and sharing files with the host machine (which can also be tricky
for boot2docker users on Mac/Windows, so this might be a work-around
for them).  Run this image with:

```bash
vagrant up
```

You may want to first adjust the Vagrantfile to allocate more or less
memory and CPU nodes to the virtual machine.  Vagrant's default is 512 MB
and 1 CPU, though the file currently puts this at 2 CPUS and 1024 MB RAM.

You can now connect to the RStudio server using some ssh port forwarding:

```bash
ssh -o "ExitOnForwardFailure yes" -f -N -L 8787:localhost:8888 <your.server>
```

The first number (8787) is the port we want things to appear on localhost,
e.g. we can now connect by visiting http://localhost:8787.  The scond
(8888) is the port we configured for the host machine with Vagrant.

Note that sometimes you need to tunnel through a head node to the compute
node where you want R to be running, replacing `<your.server>` with:

```bash
ssh <head.node.name> nc -q0 <compute.node.name> 22
```



## Author

Carl Boettiger <cboettig@ropensci.org>

## License

MIT
