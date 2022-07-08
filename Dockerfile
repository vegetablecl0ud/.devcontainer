FROM ubuntu:latest as withlinuxtools

RUN echo "Hello Ubuntu!"

RUN apt-get update && apt-get install -y git

FROM withlinuxtools as withdevelopmenttools

RUN apt-get install -y build-essential \
                                        cmake \
                                        gdb

FROM withdevelopmenttools as withdevelopmentlibs

RUN apt-get install -y libboost-all-dev

#cleanup
RUN apt autoremove