#!/bin/bash
curl -sSL https://get.docker.io/ubuntu/ | sudo sh
sudo docker pull cboettig/rstudio
sudo docker run -d -p 8787:8787 cboettig/rstudio
