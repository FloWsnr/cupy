# AUTO GENERATED: DO NOT EDIT!
ARG BASE_IMAGE="nvidia/cuda:11.6.0-devel-ubuntu20.04"
FROM ${BASE_IMAGE}

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -qqy update && \
    apt-get -qqy install \
       make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget \
       curl llvm libncursesw5-dev xz-utils tk-dev \
       libxml2-dev libxmlsec1-dev libffi-dev \
       liblzma-dev && \
    apt-get -qqy install ccache git curl && \
    apt-get -qqy --allow-change-held-packages \
            --allow-downgrades install 'libnccl2=2.11.*+cuda11.6' 'libnccl-dev=2.11.*+cuda11.6' 'libcutensor1=1.5.*' 'libcutensor-dev=1.5.*' 'libcusparselt0=0.2.0.*' 'libcusparselt-dev=0.2.0.*' 'libcudnn8=8.3.*+cuda11.5' 'libcudnn8-dev=8.3.*+cuda11.5'

ENV PATH "/usr/lib/ccache:${PATH}"

RUN git clone https://github.com/pyenv/pyenv.git /opt/pyenv
ENV PYENV_ROOT "/opt/pyenv"
ENV PATH "${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
RUN pyenv install 3.10.0 && \
    pyenv global 3.10.0 && \
    pip install -U setuptools pip

RUN pip install -U 'numpy==1.21.*' 'scipy==1.7.*' 'optuna==2.*' 'cython==0.29.*'
