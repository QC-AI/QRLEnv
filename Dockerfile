ARG CONDA_VER=latest
ARG OS_TYPE=x86_64

# NVIDIA container with CUDA 11.6 <-- this is somewhat old version to go with PyTorch 2.0
FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

WORKDIR /work

ENV DEBIAN_FRONTEND "noninteractive"
# gcc-10 for gcc 10.x under Ubuntu 20
RUN apt-get update \
    && apt-get install -y \
        git \
	gcc-10 \
        vim \
        curl \
	wget \
        build-essential \
        gdb \
	gcc \
	jq \
        gfortran

ARG CONDA_VER
ARG OS_TYPE
# Install miniconda 3 to /opt/conda
RUN curl -LO "https://repo.continuum.io/miniconda/Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh"
RUN bash Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh -p /opt/conda -b
RUN rm Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh
ENV PATH=/opt/conda/bin:${PATH}
RUN conda update -y conda
RUN conda init

COPY environment.yml /work
#RUN conda env create -f environment.yml
#RUN rm environment.yml

WORKDIR /work
