FROM nvcr.io/nvidia/pytorch:21.03-py3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git-core cmake libeigen3-dev build-essential

#RUN pip3 install -U torch chumpy vctoolkit open3d pybullet qpsolvers cvxopt quadprog
RUN pip3 install -U chumpy vctoolkit open3d pybullet qpsolvers cvxopt quadprog; \
    pip3 install "opencv-python-headless<4.3"
RUN pip3 install vctoolkit==0.1.5.39

RUN apt install cython3 python3-numpy python3-scipy python3-matplotlib -y
RUN cd /opt/; \
    git clone --recursive https://github.com/rbdl/rbdl; \
    cd rbdl; \
    mkdir /opt/rbdl-build; \
    cd /opt/rbdl-build/; \
    cmake -DCMAKE_BUILD_TYPE=Release -DRBDL_BUILD_PYTHON_WRAPPER=ON -DRBDL_BUILD_ADDON_URDFREADER=ON ../rbdl; \
    make
ENV PYTHONPATH="${PYTHONPATH}:/opt/rbdl-build/python"

WORKDIR /root

