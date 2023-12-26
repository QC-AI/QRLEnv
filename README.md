# QRLEnv

To build the container:
`docker build -t qrlenv:latest .`

To run within the container:
`docker run -it --rm -v $(pwd):/work qrlenv:latest /bin/bash` 

Then, within the container, please do the following:
`conda activate qrl`
