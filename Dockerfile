FROM ghcr.io/florianbehrens/gcc-snapshot:master

COPY ./build.sh .
RUN chmod 755 build.sh && ./build.sh && rm build.sh
CMD /bin/bash
