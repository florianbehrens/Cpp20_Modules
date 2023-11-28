FROM kitware/cmake:ci-gcc_cxx_modules-x86_64-2023-09-21

RUN dnf install -y openssl-devel ninja-build

# Download and build CMake
ENV CC=/opt/gcc-p1689/bin/gcc
ENV CXX=/opt/gcc-p1689/bin/g++
RUN git clone --depth 1 https://github.com/Kitware/CMake.git
WORKDIR CMake
RUN gcc --version
RUN ./bootstrap || cat /CMake/Bootstrap.cmk/cmake_bootstrap.log
RUN make -j$(nproc)
RUN make install

CMD /bin/bash
