FROM ubuntu:23.10

RUN apt-get update -y
RUN apt-get install -y git build-essential wget ninja-build libssl-dev

# Download GCC snapshot
RUN wget --quiet https://kayari.org/gcc-latest/gcc-latest.deb
RUN dpkg -i gcc-latest.deb
RUN /opt/gcc-latest/bin/g++ --version
ENV PATH=/opt/gcc-latest/bin:$PATH
ENV LD_RUN_PATH=/opt/gcc-latest/lib64

# Download and build CMake
RUN git clone -b v3.28.0-rc5 --depth 1 https://github.com/Kitware/CMake.git
WORKDIR CMake
RUN gcc --version
RUN ./bootstrap || cat /CMake/Bootstrap.cmk/cmake_bootstrap.log
RUN make -j$(nproc)
RUN make install

CMD /bin/bash
