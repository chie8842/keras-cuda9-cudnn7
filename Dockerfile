FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
MAINTAINER Chie HAYASHIDA <chie8842@gmail.com>

ENV OPT_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$OPT_DIR/bin:$PATH \
    HOME=/home/$NB_USER

# software install
RUN apt-get update && apt-get install -y \
    git \
    wget \
    python3.5 \
    python3-pip \
    python3-dev \
    libmysqlclient-dev \
    postgresql

RUN pip3 install --upgrade pip

# Install basics
RUN pip3 install \
    numpy \
    scipy \
    jupyter \
    pandas \
    scikit-learn \
    matplotlib \
    scikit-image \
    pillow \
    matplotlib \

# Visualization
RUN pip3 install \
    matplotlib \
    seaborn \
    bokeh

# Performance Tuning
RUN pip3 install \
    line_profiler \
    numba \
    numexpr

# Keras and Tensorflow
RUN pip3 install h5py \
    tensorflow-gpu \
    tensorflow-tensorboard \
    keras

# Database Connection
RUN pip3 install awscli \
    SQLAlchemy \
    sqlalchemy-redshift \
    PyMySQL \
    psycopg2 \
    ipython-sql=0.3*

# Set alias for python3.5
RUN echo "alias python=python3" >> $HOME/.bashrc && \
    echo "alias pip=pip3" >> $HOME/.bashrc

WORKDIR $HOME
USER $NB_UID
RUN ["/bin/bash"]
