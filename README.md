# QRLEnv
## Junghoon's Environment
To build the container:
`docker build -t qrlenv:yml .`

To run within the container:
`docker run -it --rm -v $(pwd):/work qrlenv:yml /bin/bash` 

Then, within the container, please do the following:
`conda activate qrl`
## GPU version
To build the container:
`docker build -t qrlenv:p3.9gpu -f Dockerfile_GPU .`

To run within the container with gpu device 0:
`docker run -it --rm -v $(pwd):/work -gpus '"device=0"' qrlenv:p3.9gpu /bin/bash` 
or with the all the GPUs:
`docker run -it --rm -v $(pwd):/work -gpus all qrlenv:p3.9gpu /bin/bash` 

Then, within the container, please do the following:
`conda activate qrl`

